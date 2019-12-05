/**
                    * ExilelifeServer_system_jobs_util_vehicle_returnVehicle
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

                    private["_sessionID","_jobClassname","_result","_playerObject","_vehicleNetID","_vehicle","_drivers","_driverNetID","_driver"];
_sessionID = _this select 0;
_jobClassname = _this select 1;
_result = "";
try{
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _playerObject) then {
        throw "You don't Exist...";
    };
    if(_jobClassname == "") then {
        throw "You don't have a job...";
    };
    _vehicleNetID = _playerObject getVariable ["ExileLifeJobVehicle",""];
    if (_vehicleNetID == "") then {
        throw "You don't have a job vehicle..";
    };
    _vehicle = objectFromNetId _vehicleNetID;
    if ((isNull _vehicle) || !(alive _vehicle)) then {
        if (isNumber(configFile >> "CfgJobs" >> _jobClassname >> "vehicleDestroyedPunishment")) then{
            [_playerObject,_vehicle, _jobClassname] call ExileLifeServer_system_jobs_util_vehicle_destroyedPunishment;
        };
    }else{
            if (_playerObject distance _vehicle > 15) then {
                throw "Your vehicle is too far away!";
            };
    };
    _drivers = _vehicle getVariable ["ExileLifePermittedDrivers",[]];
    if (_drivers isEqualTo []) then {
        throw "You are not a permitted driver of this vehicle!";
    };
    {
        _driverNetID =_x;
        _driver = objectFromNetid _driverNetID;
        _driver setVariable ["ExileLifeJobVehicle",nil,true];
    }forEach _drivers;
    deleteVehicle _vehicle;
}
catch
{
    _result = _exception;
};
_result
