/**
                    * ExilelifeServer_system_jobs_uber_removeJob
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

                    private["_uberJobID","_uberJobList","_index","_job"];
_uberJobID = _this;
try
{
    if(ExileLifeUberJobMutex)then{
        [] spawn{
            waitUntil {!ExileLifeUberJobMutex};
        };
    };
    ExileLifeUberJobMutex = true;
    _uberJobList = uiNameSpace getVariable ['ExileLifeServerUberJobList',[]];
    if (_uberJobList isEqualTo [])then{
        throw false;
    };
    _index = _uberJobList findIf {(_x select 0) isEqualTo _uberJobID};
    if (_index isEqualTo -1) then{
        throw false;
    };
    _job = _uberJobList deleteAt _index;
    uiNameSpace setVariable ['ExileLifeServerUberJobList',_uberJobList];
}
catch
{
    _job = [];
};
ExileLifeUberJobMutex = false;
_job
