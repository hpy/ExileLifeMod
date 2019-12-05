/**
                    * ExilelifeClient_system_jobs_network_updateJobBoard
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_jobBoardArray","_display"];
disableSerialization;
_jobBoardArray = _this select 0;
format["Received %1",_jobBoardArray] call ExileLifeClient_util_log;
ExileLifeJobBoard = _jobBoardArray;
_display = uiNamespace getVariable ["RscExileLifeJobsBoard",displayNull];
if !(isNull _display) then
{
	call ExileLifeClient_gui_jobs_board_event_updateAvailableJobs;
};
