/**
                    * ExilelifeServer_system_prisonRecords_network_getPrisonerRecordsRequest
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

                    private["_sessionID","_parameter","_prisonerId","_guard","_guardGang","_alphabet","_forbiddenCharacter","_dbPID","_prisonerSessionId","_prisoner","_prisonerGang","_criminalName","_prisonerName","_criminalRecord","_criminalHistory","_crimes","_infractionID","_crimeTitle","_infractionHistory","_fineID","_fine","_dateDue","_timeLeft","_prisonerID"];
_sessionID = _this select 0;
_parameter = _this select 1;
_prisonerId = _parameter select 0;
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
	if (_guard getVariable ["ExileMutex",false]) then
	{
		throw "Spamming for Prisoner Records";
	};
	_guard setVariable ["ExileMutex",true];
    _guardGang = _guard getVariable ['ExileLifeClientGang', ""];
    if (_guardGang != 'Guard') then
	{
		throw "Player is not a guard!";
	};
	_alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");
	_forbiddenCharacter = [format["%1",_prisonerId], _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) then
	{
		throw "Invalid Character in Prisoner ID";
	};
	_dbPID = _prisonerId call ExileLifeServer_util_player_getPIDfromPID;
	_prisonerSessionId = _dbPID call ExileLifeServer_system_session_getIDfromDBID;
	_prisoner = _prisonerSessionId call ExileServer_system_session_getPlayerObject;
    _prisonerGang = _prisoner getVariable ['ExileLifeClientGang', ""];
    if (_prisonerGang == 'Guard') then
	{
		throw "Prisoner is a fellow guard!";
	};
	_criminalName = format ["getPlayerName:%1",_dbPID] call ExileServer_system_database_query_selectSingle;
	if(isNil "_criminalName")then{
		throw "Invalid Prisoner ID";
	};
	_prisonerName = format["%1 %2",_criminalName select 0, _criminalName select 1];
	_criminalRecord = format ["getPrisonerRecord:%1",_dbPID] call ExileServer_system_database_query_selectSingle;
	if(typename _criminalRecord != "ARRAY") then{
		throw "Error Processing getPrisonerRecord DB Request!";
	};
	_criminalHistory = format ["getPrisonerInfractions:%1",_dbPID] call ExileServer_system_database_query_selectFull;
	if(typename _criminalHistory != "ARRAY") then{
		throw "Error Processing getPrisonerInfractions DB Request!";
	};
	_crimes = [];
	{
		if(count _x == 2) then{
			_infractionID =  _x select 0;
			_crimeTitle =  _x select 1;
			if !(_infractionID > 0) then{
				throw "Error Invalid Infraction ID!";
			};
			_infractionHistory = format["getInfractionIDHistory:%1",_infractionID] call ExileServer_system_database_query_selectFull;
			if(typename _infractionHistory != "ARRAY") then{
				throw "Error Processing getInfractionHistory DB Request!";
			};
			{
				_fineID = _x select 6;
				_fine = format ["getFine:%1",_fineID] call ExileServer_system_database_query_selectSingle;
				if(typename _fine != "ARRAY") then{
					throw "Error Processing getInfractionFine DB Request!";
				};
				_dateDue = _fine select 3;
				_timeLeft = [_dateDue, call ExileServer_util_time_currentTime] call ExileLifeServer_util_time_timeLeft;	
				_fine set [3, _timeLeft];
				_x set [6, _fine];
			}forEach _infractionHistory;
			reverse _infractionHistory;
			_crimes pushbackUnique ([_infractionID,_crimeTitle,_infractionHistory]); 
		};
	} forEach _criminalHistory;
	reverse _crimes;
	_prisonerID = _dbPID call ExileLifeServer_system_session_createPrisonerID;
	[_sessionID, "getPrisonerRecordsResponse", [[_prisonerId,_prisonerName],_criminalRecord,_crimes]] call ExileServer_system_network_send_to;
	_guard setVariable ["ExileMutex",false];
}
catch
{
	_guard setVariable ["ExileMutex",false];
	[_sessionID, "getPrisonerRecordsResponse", [[_prisonerId,_prisonerName],[],[]]] call ExileServer_system_network_send_to;
	_exception call ExileLifeServer_util_debugLog;
};
