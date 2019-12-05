/**
                    * ExilelifeServer_system_jobs_uber_cancelFailedUber
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

                    private["_uberJob","_jobID","_offeredByPID","_offeredByPlayerSessionID","_offeredBy","_acceptedByPID","_acceptedByPlayerSessionID","_acceptedBy"];
_uberJob = _this;
_jobID = _uberJob select 0;
_offeredByPID = (_uberJob select 7) select 0;
_offeredByPlayerSessionID = _offeredByPID call ExileLifeServer_system_session_getIDfromDBID;
_offeredBy = _offeredByPlayerSessionID call ExileServer_system_session_getPlayerObject;
_acceptedByPID = (_uberJob select 8) select 0;
_acceptedByPlayerSessionID = _acceptedByPID call ExileLifeServer_system_session_getIDfromDBID;
_acceptedBy = _acceptedByPlayerSessionID call ExileServer_system_session_getPlayerObject;
if !(_acceptedByPlayerSessionID isEqualTo "")then{
    [_acceptedByPlayerSessionID] call ExileLifeServer_system_jobs_process_network_failJobRequest;
}else{
    [_offeredBy,_jobID] call ExileLifeServer_system_jobs_uber_removeJobOffer;
    if !(([_jobID] call ExileLifeServer_system_jobs_uber_removeJob) isEqualTo []) then{
        {
            [_x,_uberJob] call ExileLifeServer_system_jobs_uber_removeJobOffer;
        }forEach allPlayers;
    };
};
true
