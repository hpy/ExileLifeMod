/**
                    * ExilelifeServer_system_jobs_uber_modifyJobOffer
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

                    private["_player","_uberJobID","_newUberJob","_job"];
_player = _this select 0;
_uberJobID = _this select 1;
_newUberJob = _this select 2;
try
{
    if(([_player,_uberJobID] call ExileLifeServer_system_jobs_uber_removeJobOffer) isEqualTo [])then{
        throw false;
    };
    _job = [_player,_newUberJob] call ExileLifeServer_system_jobs_uber_addJobOffer;
}
catch
{
    _job = [];
};
_job
