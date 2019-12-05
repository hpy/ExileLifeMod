/**
                    * ExilelifeServer_system_jobs_scenes_prisonCollect_onProgression_step3
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

                    private["_sessionID","_playerObject","_jobClassname","_position","_result","_vehicleNetId","_vehicle","_contents","_value","_bankBalance","_drivers","_driverNetID","_driver"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_jobClassname = _this select 2;
_position = _this select 3;
_result = "";
try
{
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _playerObject) then
    {
        throw "Null player.";
    };
     if !(_playerObject getVariable ["ExileLifeClient:Guard",false]) then
    {
        throw "Invalid player.";
    };
    _vehicleNetId = _playerObject getVariable ["ExileLifeJobVehicle",""];
    _vehicle = objectFromNetId _vehicleNetId;
    if(isNull _vehicle) then {
        [_sessionID] call ExileLifeServer_system_jobs_process_network_failJobRequest;
        throw "Vehicle does not exist";
    };
    if !(alive _vehicle) then {
        [_sessionID] call ExileLifeServer_system_jobs_process_network_failJobRequest;
        throw "Vehicle is destroyed";
    };
    if (_playerObject distance _vehicle > 30) then {
        throw "Your vehicle is too far away!";
    };
    _contents = _vehicle getVariable ["ExileLifeJobCargo",[]];
    _vehicle setVariable ["ExileLifeJobCargo",nil,true];
    if(count _contents == 0) then {
        [_sessionID] call ExileLifeServer_system_jobs_process_network_failJobRequest;
        throw "Vehicle is Empty!";
    };
    _contents = _contents select 0;
    _value = getNumber(missionConfigFile >> "CfgExileArsenal" >>(_contents select 0) >> "price") * (_contents select 1);
    _bankBalance = missionNamespace getVariable ["Guard",-1];
    _bankBalance = _bankBalance + (_value*3);
    missionNamespace setVariable ["Guard",_bankBalance];
    format["updateGangBank:%1:%2",_bankBalance, "Guard"] call ExileServer_system_database_query_fireAndForget;
    _drivers = _vehicle getVariable ["ExileLifePermittedDrivers",[]];
    _value = _value/(count _drivers);
    {
        _driverNetID =_x;
        _driver = objectFromNetid _driverNetID;
        if !(isNull _driver) then {
            _driver setVariable ["ExileLifeJobReward",_value];
        };
    }forEach _drivers;
}
catch
{
    _result = _exception;
    [_sessionID,"toastRequest",["ErrorTitleAndText",["Error",_result]]] call ExileServer_system_network_send_to;
};
_result
