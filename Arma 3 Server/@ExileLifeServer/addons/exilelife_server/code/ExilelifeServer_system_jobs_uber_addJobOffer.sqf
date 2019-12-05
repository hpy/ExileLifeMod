/**
                    * ExilelifeServer_system_jobs_uber_addJobOffer
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

                    private["_player","_uberJob","_uberJobList"];
_player = _this select 0;
_uberJob = _this select 1;
_uberJobList = _player getVariable ['ExileLifeClientUberJobsOffered',[]];
_uberJobList pushBackUnique _uberJob;
_player setVariable ['ExileLifeClientUberJobsOffered',_uberJobList,true];
true
