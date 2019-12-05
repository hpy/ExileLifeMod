/**
                    * ExilelifeClient_system_jobs_network_overrideJobTask
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_silent","_text","_display"];
_silent = _this select 0;
if !(ExileLifeParentJobTask isEqualTo "") then
{
	ExileLifeParentJobTask setTaskState "Failed";
};
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
if (_silent == 0) then
{
	_text = "Your previous job has been cancelled!";
	["Job Cancelled",_text,10,"orange"] spawn ExileLifeClient_gui_baguette_show;
};
_display = uiNameSpace getVariable ["RscExileXM8",displayNull];
if (!isNull _display) then
{
	if(ExileLifeJobManagmentIsOpen)then{
		ExileLifeJobManagmentIsOpen = false;
		[ExileExtraAppsHomePage, 1] call ExileClient_gui_xm8_slide; 
	};
	[ExileLifeXM8JobThread] call ExileClient_system_thread_removeTask;
};
