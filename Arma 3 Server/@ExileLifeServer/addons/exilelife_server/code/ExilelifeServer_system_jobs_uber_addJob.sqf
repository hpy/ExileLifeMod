/**
                    * ExilelifeServer_system_jobs_uber_addJob
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

                    private["_uberJob","_uberJobList"];
_uberJob = _this;
if(ExileLifeUberJobMutex)then{
    [] spawn{
        waitUntil {!ExileLifeUberJobMutex};
    };
};
ExileLifeUberJobMutex = true;
_uberJobList = uiNameSpace getVariable ['ExileLifeServerUberJobList',[]];
_uberJobList pushBackUnique _uberJob;
uiNameSpace setVariable ['ExileLifeServerUberJobList',_uberJobList];
ExileLifeUberJobMutex = false;
true
