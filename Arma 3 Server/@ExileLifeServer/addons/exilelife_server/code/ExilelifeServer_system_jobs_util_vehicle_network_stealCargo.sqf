/**
                    * ExilelifeServer_system_jobs_util_vehicle_network_stealCargo
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

                    private["_sessionID","_parameters","_jobCName","_vehicleNetID","_player","_vehicle","_jobClassname","_vehicleCargo","_classname","_amount","_index","_msg","_gang"];
_sessionID = _this select 0;
_parameters = _this select 1;
_jobCName = _parameters select 0;
_vehicleNetID = _parameters select 1;
try
{
    _player = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _player) then
    {
        throw "Player doesnt exist!";
    };
    _vehicle = objectFromNetId _vehicleNetID;
    if (isNull _vehicle) then {
            throw "Vehicle does not exist";
    };
    if !(alive _vehicle) then {
            throw "The Vehicle is destroyed";
    };
    _jobClassname = _vehicle getVariable ["ExileLifeJobName", ""];
    if(_jobClassname == "") then {
        throw "This is not a job vehicle";
    };
    _vehicleCargo = _vehicle getVariable ["ExileLifeJobCargo",[]];
    if (_vehicleCargo isEqualTo []) then {
        throw "The vehicle has no cargo left to steal!";
    };
    {
        _classname = _x select 0;
        _amount = _x select 1;
        _index = _forEachIndex;
        if(_amount > 0) then {
            while {[_player,_classname] call ExileClient_util_playerCargo_add} do {
                _amount = _amount - 1;
                _vehicleCargo set [_index, [_classname,_amount]];
                _vehicle setVariable ["ExileLifeJobCargo",_vehicleCargo,true];
            };
        };
    } forEach _vehicleCargo;
    _msg = "Success! Nicely done!";
    _gang = _player getVariable ['ExileLifeClientGang', ""];
    if(!(_gang isEqualTo "") && (_gang == getText(configFile >> "CfgJobs" >> _jobClassname >> "JobBoard"))) then {
        _msg = "Success! Skimming off the top... Ballsy!";
    };
    [_sessionID, "toastRequest", ["SuccessTitleOnly", [_msg]]] call ExileServer_system_network_send_to;
	format["Player: %1 Stole from job: %2",name _player,_jobClassname] call ExileLifeServer_util_log;
}
catch
{
    _exception call ExileLifeServer_util_log;
};
