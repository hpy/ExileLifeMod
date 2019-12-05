/**
                    * ExilelifeServer_system_jobs_uber_removeJobOffer
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

                    private["_player","_uberJobID","_uberJobList","_index","_job"];
_player = _this select 0;
_uberJobID = _this select 1;
try
{
    _uberJobList = _player getVariable ['ExileLifeClientUberJobsOffered',[]];
    _uberJobList = _player getVariable ['ExileLifeClientUberJobsOffered',[]];
    if (_uberJobList isEqualTo [])then{
        throw false;
    };
    _index = _uberJobList findIf {(_x select 0) isEqualTo _uberJobID};
    if (_index isEqualTo -1) then{
        throw false;
    };
    _job = _uberJobList deleteAt _index;
    _player setVariable ['ExileLifeClientUberJobsOffered',_uberJobList,true];
}
catch
{
    _job = [];
};
_job
