/**
                    * ExilelifeServer_system_prisonRecords_network_updatePrisonerRecordsRequest
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_sessionID","_parameter","_prisonerId","_prisonerInfraction","_oldInfraction","_wanted","_armed","_guard","_guardGang","_guardRank","_configPermissions","_recordsPermission","_crimeDesc","_itemsArray","_notes","_fineOffence","_jailOffence","_fineAmount","_timeToComplete","_jailSentenceOre","_jailSentenceLength","_infractionHistoryID","_infractionID","_dbPID","_chkID","_infractionHistory","_oldInfractionHistoryID","_oldCrimeDesc","_oldWanted","_oldArmed","_oldItems","_oldNotes","_oldFineID","_oldInfractionID","_testItems","_guardName","_alphabet","_forbiddenCharacter","_crime","_infractionCrime","_currentTime","_endTime","_fineID","_fineStatus"];
_sessionID = _this select 0;
_parameter = _this select 1;
_prisonerId = _parameter select 0;
_prisonerInfraction = _parameter select 1; 
_oldInfraction = _parameter select 2;
_wanted = _parameter select 3;
_armed = _parameter select 4;
try
{
	_guard = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _guard) then
	{
		throw "Guard Object is null";
	};
	if (!alive _guard) then
    {
        throw "Guard is dead!";
    };
	_guardGang = _guard getVariable ['ExileLifeClientGang', ""];
    if (_guardGang != 'Guard') then
	{
		throw "Guard Object is not a guard!";
	};
	_guardRank = _guard getVariable ['ExileLifeClientRank', ""];
	_configPermissions = missionConfigFile >> "CfgPlayer" >> "CfgExileLifeClasses" >> _guardGang >> "Permissions";
	_recordsPermission = _guardRank in (getArray(_configPermissions >> "setRecords"));
	if !(_recordsPermission) then{
		throw "Guard does not have the required rank to add criminal records!";
	};
    if (_guard getVariable ["ExileMutex",false]) then
	{
		throw "Spamming Prisoner Records";
	};
    _guard setVariable ["ExileMutex",true];
    _crimeDesc = _prisonerInfraction select 0;
    _itemsArray = _prisonerInfraction select 1;
    _notes  = _prisonerInfraction select 4;
    _fineOffence = _prisonerInfraction select 5; 
    _jailOffence = _prisonerInfraction select 6; 
    _fineAmount = 0;
    _timeToComplete = [0,0,0];
    if !(_fineOffence isEqualTo [])then{
        _fineAmount = _fineOffence select 0;
        _timeToComplete = _fineOffence select 1;
    };
    _jailSentenceOre = 0;
    _jailSentenceLength = [0,0,0];
    if !(_jailOffence isEqualTo [])then{
        _jailSentenceOre = _jailOffence select 0;
        _jailSentenceLength = _jailOffence select 1;
    };
    _infractionHistoryID = _oldInfraction select 0;
    _infractionID = _oldInfraction select 1;
    _dbPID = _prisonerId call ExileLifeServer_util_player_getPIDfromPID;
    _chkID = format["chkPrisonerInfractionID:%1:%2",_dbPID,_infractionID] call ExileServer_system_database_query_selectSingle;
    if (_chkID isEqualTo [])then{
            throw "Error Invalid Infraction ID";
    };
    _infractionHistory = format["getInfractionHistory:%1",_infractionHistoryID] call ExileServer_system_database_query_selectSingle;
    if(typename _infractionHistory != "ARRAY") then{
        throw "Error Processing getInfractionHistory DB Request!";
    };
    _oldInfractionHistoryID = _infractionHistory select 0;
    _oldCrimeDesc = _infractionHistory select 1;
    _oldWanted = _infractionHistory select 2;
    _oldArmed = _infractionHistory select 3;
    _oldItems = _infractionHistory select 4;
    _oldNotes = _infractionHistory select 5;
    _oldFineID = _infractionHistory select 6;
    _oldInfractionID = _infractionHistory select 9;
    if (_oldInfractionID != _infractionID)then{
        throw "Error Invalid Infraction ID";
    };
    if(_crimeDesc == _oldCrimeDesc && _wanted == _oldWanted && _armed == _oldArmed && _notes == _oldNotes)then{
        if (count _oldItems == count _itemsArray)then{
            _testItems = +_oldItems;
            {
                _testItems pushBackUnique _x;
            }forEach _itemsArray;
            if (count _testItems == count _itemsArray)then{
                throw "Duplicate Entry Detected";
            };
        };
    };
    _guardName  =  [_guard] call ExileLifeClient_util_player_name;
	[_dbPID,_guardName,_wanted,_armed] call ExileLifeServer_system_prisonRecords_updateCriminalRecord;
    _armed  = _prisonerInfraction select 3;
	_alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");
	_forbiddenCharacter = [_crimeDesc, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) then {
		throw format["You cannot use the character %1 in your crime description!",_forbiddenCharacter];
	};
    if (typename _itemsArray != "ARRAY")then{
            throw "Invalid Items Array";
    };
    if (count _itemsArray > 0)then{
        {
            if (!(typename (_x select 0) isEqualTo "STRING") || !(typename (_x select 1) isEqualTo "SCALAR"))then{
                throw format["Invalid Items Array Format - Item: %1",_x];
            };
        }forEach _itemsArray
    };
    _infractionHistoryID = format["createPrisonerInfractionHistory:%1:%2:%3:%4:%5:%6:%7:%8",_dbPID,_crimeDesc,_infractionID,_guardName,_wanted,_armed,_itemsArray,_notes] call ExileServer_system_database_query_insertSingle;
    if (isNil '_infractionHistoryID')then{
            throw "Error Storing Infraction History";
    };
    _crime = _infractionCrime select 0;
    if (_oldCrimeDesc != _crimeDesc)then{
        _currentTime = call ExileServer_util_time_currentTime;
        _timeToComplete pushBack 0;
        _endTime = [_currentTime,_timeToComplete] call ExileLifeServer_util_time_addTimeEXTDB;
        _fineID = format["createPrisonerFine:%1:%2:%3:%4:%5:%6",_dbPID,_infractionID,_fineAmount,_endTime,_jailOffence,_fineStatus] call ExileServer_system_database_query_insertSingle;
        format["updateFineStatus:%1:%2",6,_oldFineID] call ExileServer_system_database_query_fireAndForget;    
    }else{
        _fineID = _oldFineID;
    };
    format["updateInfractionFine:%1:%2",_fineID,_infractionID] call ExileServer_system_database_query_fireAndForget;
    format["updateInfractionHistoryFine:%1:%2",_fineID,_infractionHistoryID] call ExileServer_system_database_query_fireAndForget;
    _guard setVariable ["ExileMutex",false];
    [_sessionID,"toastRequest",["SuccessTitleAndText",["Criminal Record","Record Updated"]]] call ExileServer_system_network_send_to;
}
catch
{
    _guard setVariable ["ExileMutex",false];
    [_sessionID,"toastRequest",["ErrorTitleAndText",["Update Failed","System Error Occurred"]]] call ExileServer_system_network_send_to;
    _exception call ExileLifeServer_util_log;
    diag_log format["_exception: %1",_exception];
};
