/**
                    * ExilelifeServer_system_prisonRecords_updateCriminalRecord
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

                    private["_dbPID","_scanBy","_wanted","_armed","_prisonerSessionID","_prisoner","_prisonerGang","_criminalRecord","_record","_alert","_prisonerID","_msg"];
_dbPID = _this select 0;
_scanBy = _this select 1;
_wanted = _this select 2;
_armed = _this select 3;
try
{
    _prisonerSessionID = _dbPID call ExileLifeServer_system_session_getIDfromDBID;
    if !(_prisonerSessionID isEqualTo "") then {
	    _prisoner = _prisonerSessionID call ExileServer_system_session_getPlayerObject;
	    if (isNull _prisoner) then{
	        throw false;
	    };
		if (!alive _prisoner) then{
	        throw false;
	    };
		_prisonerGang = _prisoner getVariable [EXILELIFE_prisoner_GANG, ""];
	    if (_prisonerGang == "Guard") then{
	        throw false;
	    };
        _criminalRecord = _prisoner getVariable ["ExileLifeCriminalRecord",[]];
    }else{
        format["Offline Prisoner Record Update: PID: %1",_dbPID] call ExileLifeServer_util_debugLog;
        _criminalRecord = [];
	};
    if(_criminalRecord isEqualTo [])then{
        _record = format ["getPrisonerRecord:%1",_dbPID] call ExileServer_system_database_query_selectSingle;
        _criminalRecord = [_record select 2, _record select 3];
    };
    if (_criminalRecord isEqualTo [])then{
        throw false;
    };
    try{
        if (_wanted == 1 && _criminalRecord select 0 == 0)then{
            if(_armed == 1)then{
                throw "Armed and Dangerous";
            };
            throw "";
        };
        if (_wanted == 0 && _criminalRecord select 0 == 1)then{
            throw "Cancelled";
        };
    }catch{
        _alert = _exception;
    };
    format["updatePrisonerRecord:%1:%2:%3:%4",_scanBy,_wanted,_armed,_dbPID] call ExileServer_system_database_query_insertSingle;
    if !(isNil "_prisoner")then{
        _prisoner setVariable ["ExileLifeCriminalRecord",[_wanted, _armed],true];
        if !(isNil _alert) then {
            _name = [_prisoner] call ExileLifeClient_util_prisoner_name;
            _prisonerID = _dbPID call ExileLifeServer_system_session_createPrisonerID;
            _msg = format["Prisoner %1 (%2) %3",_name,_prisonerID,_alert];
            ["Guard", "baguetteRequest", [["WANTED",_msg]]] call ExileLifeServer_system_network_send_to_gang;
        };
    };
}
catch
{
    diag_log format["ExileLifeServer_system_prisonRecords_updateCriminalRecord: %1",_exception] call ExileLifeServer_util_debugLog;
};
