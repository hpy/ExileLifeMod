/**
                    * ExilelifeServer_system_jobs_util_notify_gang
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

                    private["_jobStage","_jobClassname","_threaded","_result","_notifyMsg","_notifyGangArray","_notifyRankArray","_jobName","_msgDelay","_notify","_gang","_rank"];
_jobStage = _this select 0;
_jobClassname = _this select 1;
_threaded = param[2,0];
_result = true;
try
{
    if(_jobClassname == "") then{
        throw false;
    };
    if(_jobStage == "") then {
        throw false;
    };
    _notifyMsg = getText(configFile >> "CfgJobs" >> _jobClassname >> "Progression" >> _jobStage >> "notifyMsg");
    if(_notifyMsg=="") then {
        throw false;
    };
    _notifyGangArray = getArray(configFile >> "CfgJobs" >> _jobClassname >> "Progression">>_jobStage>>"notifyGang");
    if(_notifyGangArray isEqualTo []) then {
        throw false;
    };
    _notifyRankArray = getArray(configFile >> "CfgJobs" >> _jobClassname >> "Progression">>_jobStage>>"notifyRank");
    if(_notifyGangArray isEqualTo []) then {
        _notifyRankArray = [0,1,2,3,4,5,6];
    };
    _jobName = getText(configFile >> "CfgJobs" >> _jobClassname >> "shortName");
    if (_jobName == "") then {
            _jobName = "Job Alert";
    };
    _msgDelay = getNumber(configFile >> "CfgJobs" >> _jobClassname >> "Progression">>_jobStage>>"notifyDelay");
    if ((_msgDelay < 1) || (_threaded == 1)) then {
        _notify = [];
        {
            _gang = _x getVariable['ExileLifeClientGang',""];
            _rank = _x getVariable ["ExileLifeClientRank",-1];
            if (_gang in _notifyGangArray) then {
                if (_rank in _notifyRankArray) then {
                    [_x, "toastRequest", ["InfoTitleAndText", [_jobName, _notifyMsg]]] call ExileServer_system_network_send_to;
                };
            };
        }forEach allPlayers;
    }
    else
    {
        [
            _msgDelay,
            {
                _jobStage = _this select 0;
                _jobClassname = _this select 1;
                [_jobStage,_jobClassname,1] call ExileLifeServer_system_jobs_util_notify_gang;
            },
            [_jobStage,_jobClassname],
            false,
            "Job Gang Msg"
        ] call ExileServer_system_thread_addTask;
    };
}
catch
{
    _result = _exception;
};
_result
