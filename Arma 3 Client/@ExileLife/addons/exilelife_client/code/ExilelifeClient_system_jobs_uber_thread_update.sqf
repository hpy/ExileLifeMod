/**
                    * ExilelifeClient_system_jobs_uber_thread_update
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_playerUberJobs","_modified","_i","_curr","_uberJob","_timeToMsg"];
if(UberJobsQueue isEqualTo [])exitWith{};
_playerUberJobs = player getVariable ['ExileLifeClientUberJobs',[]];
_modified = false;
for "_i" from ((count UberJobsQueue) - 1) to 0 do {
    _curr = UberJobsQueue select _i;
    _uberJob = _curr select 0;
    _timeToMsg = _curr select 1;
    if(_timeToMsg <= time)then{
        _playerUberJobs pushBackUnique _uberJob;
        UberJobsQueue deleteAt _i;
        _modified = true;
    };
};
if(_modified)then{
    ["InfoTitleOnly",["Uber Job Alert"]] call ExileClient_gui_toaster_addTemplateToast;
    player setVariable ['ExileLifeClientUberJobs',_playerUberJobs];
};
true
