/**
                    * ExilelifeServer_system_jobs_util_vehicle_destroyedPunishment
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

                    private["_driverList","_vehicleObject","_jobClassname","_instigator","_result","_responsible","_driverNetID","_driver","_activeDriver","_sessionID","_punishment","_instSessionID","_instPunishment","_punishmentConfig","_wanted","_fine","_dueDate","_dbPID","_infractionID","_currentTime","_endTime"];
_driverList = _this select 0;
_vehicleObject = _this select 1;
_jobClassname = _this select 2;
_instigator = _this select 3;
_result = true;
try
{
    if (_driverList isEqualTo []) then {
        throw false;
    };
    if(isNull _vehicleObject) then {
        throw false;
    };
    if (_jobClassname == "") then {
        throw false;
    };
    _responsible = False;
    {
        _driverNetID =_x;
        _driver = objectFromNetid _driverNetID;
        if !(isNull _driver) then {
            if (((isNull _instigator) && (_driver == driver _vehicleObject)) || (isPlayer _instigator) && (_driver == _instigator)) then {
                _responsible = True;
            };
            _driver setVariable ["ExileLifeJobVehicle",nil,true];
            _activeDriver = _driver;
        };
    }forEach _driverList;
    if(isNull _activeDriver) then {
        throw false;
    };
    _sessionID = (getPlayerUID _activeDriver) call ExileLifeServer_system_session_getIDfromUID;
    if (isNumber(configFile >> "CfgJobs" >> _jobClassname >> "vehicleDestroyedPunishment")) then{
        _punishment = getNumber(configFile >> "CfgJobs" >> _jobClassname >> "vehicleDestroyedPunishment");
        if !(_responsible) then {
            _instSessionID = (getPlayerUID _instigator) call ExileLifeServer_system_session_getIDfromUID;
            if (_instSessionID != "") then {
                [_instSessionID, "toastRequest", ["ErrorTitleAndText", ["Protected Vehicle Destroyed", "That was a protected Vehicle you destroyed! There will be consequences!"]]] call ExileServer_system_network_send_to;
                _instPunishment = getNumber(configFile >> "CfgJobs" >> _jobClassname >> "vehicleDestroyedInstigatorPunishment");
                switch (_instPunishment) do {
                    case 1: {
                        _punishmentConfig = missionConfigFile >> "CfgPenalties" >> "hireVehicleDestruction" >> "mid";
                    };
                    case 2: {
                        _punishmentConfig = missionConfigFile >> "CfgPenalties" >> "hireVehicleDestruction" >> "max";
                    };
                    default {
                    };
                };
                if!(isNil "_punishmentConfig")then {
                    _wanted = getNumber(_punishmentConfig >> "wanted") ;
                    _fine = getNumber(_punishmentConfig >> "fine") ;
                    _dueDate = getArray(_punishmentConfig >> "dueDate") ;
                    if(_dueDate isEqualTo [])then{
                            _dueDate = [2,0,0];
                    };
                    if(_wanted != 1)then{
                        _wanted = -1;
                    };
                    _dbPID = _instigator getVariable ["ExileLifePID",-1];
                    [_dbPID,"SYSTEM",_wanted,-1] call ExileLifeServer_system_prisonRecords_updateCriminalRecord;
                    if(_fine > 0)then{
                        _infractionID = format["createPrisonerInfraction:%1:%2:%3:%4:%5:%6",_dbPID,"SYSTEM","Hire Vehicle Destroyed",[],0,0] call ExileServer_system_database_query_insertSingle;
                        _currentTime = call ExileServer_util_time_currentTime;
                        _dueDate pushBack 0;
                        _endTime = [_currentTime,_dueDate] call ExileLifeServer_util_time_addTimeEXTDB;
                        format["createPrisonerFine:%1:%2:%3:%4",_dbPID,_infractionID,_fine,_endTime] call ExileServer_system_database_query_fireAndForget;
                    };
                };
            };
        };
        switch (_punishment) do {
            case 1: {
                [_sessionID, "toastRequest", ["ErrorTitleAndText", ["Vehicle Destroyed", "Your vehicle has been destroyed! There will be consequences for this destruction!"]]] call ExileServer_system_network_send_to;
                [_sessionID] call ExilelifeServer_system_jobs_process_network_failJobRequest;
                _punishmentConfig = missionConfigFile >> "CfgPenalties" >> "hireVehicleDestruction" >> "mid";
            };
            case 2: {
                [_sessionID] call ExilelifeServer_system_jobs_process_network_failJobRequest;
                _punishmentConfig = missionConfigFile >> "CfgPenalties" >> "hireVehicleDestruction" >> "max";
            };
            default {
                _punishmentConfig = missionConfigFile >> "CfgPenalties" >> "hireVehicleDestruction" >> "min";
                [_sessionID,[netID _activeDriver]] call ExileLifeServer_system_jobs_process_network_overrideJobRequest;
            };
        };
        if!(isNil "_punishmentConfig")then {
            _wanted = getNumber(_punishmentConfig >> "wanted") ;
            _fine = getNumber(_punishmentConfig >> "fine") ;
            _dueDate = getArray(_punishmentConfig >> "dueDate") ;
            if(_dueDate isEqualTo [])then{
                    _dueDate = [2,0,0];
            };
            if(_wanted != 1)then{
                _wanted = -1;
            };
            _dbPID = _activeDriver getVariable ["ExileLifePID",-1];
            [_dbPID,"SYSTEM",_wanted,-1] call ExileLifeServer_system_prisonRecords_updateCriminalRecord;
            if(_fine > 0)then{
                _infractionID = format["createPrisonerInfraction:%1:%2:%3:%4:%5:%6",_dbPID,"SYSTEM","Hire Vehicle Destroyed",[],0,0] call ExileServer_system_database_query_insertSingle;
                _currentTime = call ExileServer_util_time_currentTime;
                _dueDate pushBack 0;
                _endTime = [_currentTime,_dueDate] call ExileLifeServer_util_time_addTimeEXTDB;
                format["createPrisonerFine:%1:%2:%3:%4",_dbPID,_infractionID,_fine,_endTime] call ExileServer_system_database_query_fireAndForget;
            };
        };
    };
}
catch
{
    _result = _exception;
};
_result
