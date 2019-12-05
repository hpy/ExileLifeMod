/**
                    * ExilelifeClient_system_jobs_network_completeCustomJobTask
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_jobClassname","_playerRespect","_customMessage","_title","_subText","_display"];
_jobClassname = _this select 0;
_playerRespect = _this select 1;
_customMessage = param[2,["",""]];
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
_title = _customMessage select 0;
_subText = _customMessage select 1;
if (!(_title isEqualTo "") || !(_subText isEqualTo "")) then{
	[_title,_subText,10] spawn ExileLifeClient_gui_baguette_show;
};
_display = uiNameSpace getVariable [getText (configFile >> "CfgJobs" >> _jobClassname >> "closeDialog"),displayNull];
if (!isNull _display) then
{
	_display closeDisplay 0;
};
