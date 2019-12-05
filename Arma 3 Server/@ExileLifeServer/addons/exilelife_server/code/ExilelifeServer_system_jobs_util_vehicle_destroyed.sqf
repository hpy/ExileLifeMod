/**
                    * ExilelifeServer_system_jobs_util_vehicle_destroyed
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

                    private["_vehicleObject","_killer","_instigator","_useEffects","_result","_jobClassname","_drivers"];
_vehicleObject = _this select 0;
_killer = _this select 1;
_instigator = _this select 2;
_useEffects = _this select 3;
_result = true;
try
{
    if (isNull _vehicleObject) then {
        throw false;
    };
    _jobClassname = _vehicleObject getVariable ["ExileLifeJobName", ""];
    if(_jobClassname == "") then {
        throw false;
    };
    _drivers = _vehicleObject getVariable ["ExileLifePermittedDrivers",[]];
    if (_drivers isEqualTo []) then {
        throw false;
    };
    if !([_drivers,_vehicleObject, _jobClassname,_instigator] call ExileLifeServer_system_jobs_util_vehicle_destroyedPunishment) then {
        throw false;
    };
}
catch
{
    _result = _exception;
};
_result
