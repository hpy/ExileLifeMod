/**
                    * ExilelifeClient_system_jobs_network_completeJobTask
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_jobClassname","_playerRespect","_msg","_display"];
_jobClassname = _this select 0;
_playerRespect = _this select 1;
ExileClientPlayerScore = parseNumber(_playerRespect);
ExileLifeParentJobTask setTaskState "Succeeded";
{
	player removeSimpleTask _x;
}
forEach ExileLifeJobTaskClearQueue;
if !(ExileLifeCurrentJobTaskMarker isEqualTo "") then
{
	removeMissionEventHandler ["Draw3D",ExileLifeCurrentJobTaskMarker];
};
ExileLifeCurrentJobTask = "";
ExileLifeParentJobTask = "";
ExileLifeCurrentJobTaskMarker = "";
ExileLifeCurrentJob = [];
ExileLifeJobTaskClearQueue = [];
ExileLifeCurrentJobCanForfeit = true;
ExileLifeParentJobTaskLongDescription = "";
ExileLifeParentJobTaskShortDescription = "";
ExileLifeParentJobTaskShortName = "";
_msg = format["%1",getText(configFile >> "CfgJobs" >> _jobClassname >> "completedText")];
if !(_msg isEqualTo "") then 
{
	["Job Completed",_msg,10] spawn ExileLifeClient_gui_baguette_show;
};
_display = uiNameSpace getVariable [getText (configFile >> "CfgJobs" >> _jobClassname >> "closeDialog"),displayNull];
if (!isNull _display) then
{
	_display closeDisplay 0;
};
