/**
                    * ExilelifeClient_system_jobs_util_stealCargo
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_vehicle","_result","_jobClassname","_vehicleCargo"];
_vehicle = _this;
_result = true;
try
{
    if(isNull _vehicle) then {
            throw false;
    };
    if !(alive _vehicle) then {
            throw false;
    };
    _jobClassname = _vehicle getVariable ["ExileLifeJobName", ""];
    if(_jobClassname == "") then {
        throw false;
    };
    _vehicleCargo = _vehicle getVariable ["ExileLifeJobCargo",[]];
    if (_vehicleCargo isEqualTo []) then {
        throw false;
    };
    ["stealCargo", [_vehicle,_jobClassname]] call ExileClient_action_execute;
}
catch
{
    _result = _exception;
};
_result
