/**
                    * ExilelifeClient_gui_xm8_slide_jobManagement_event_onForfeitButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_jobType","_uberJobsList"];
try
{
	_jobType = 0;
	if(player getVariable ["ExileLifeJobMultiJob",""] != "")then{
		_jobType = 1;
		throw ["Are you sure you want to leave this job queue?", "Forfeit", "Keep"];
	};
	if(!(ExileLifeCurrentJob isEqualTo []) && (isNumber (configFile >> "CfgJobs" >> (ExileLifeCurrentJob select 0) >> "RequiredMembers")))then{
		_jobType = 2;
		throw 	[parseText "<t valign='middle'>Are you sure you want to forfeit this job? \nThe job will be cancelled for everyone involved and they may not be happy...</t>", "Forfeit", "Keep"];
	};
	_uberJobsList = player getVariable ['ExileLifeClientUberJobs',[]];
	if !(_uberJobsList isEqualTo []) then {
		_jobType = 3;
		throw 	[parseText "<t valign='middle'>Are you sure you want to forfeit this job? \nThe job will no longer be available!</t>", "Forfeit", "Keep"];
	};
	throw [parseText "<t valign='middle'>Are you sure you want to forfeit your current job? \nBad things will happen to you if you aren't careful...</t>", "Forfeit", "Keep"];
}catch{
	_exception call ExileClient_gui_xm8_showConfirm;
};
waitUntil { !(isNil "ExileClientXM8ConfirmResult") };
if (ExileClientXM8ConfirmResult) then
{
	switch (_jobType) do {
	   case 3: {
		   _uberJobsList deleteAt 0;
		   player setVariable ['ExileLifeClientUberJobs',_uberJobsList,true];
           ExileLifeJobManagmentIsOpen = false;
           ExileLifeUberJobID = "";
		   if (count _uberJobsList > 0)then{
			   call ExileLifeClient_gui_xm8_slide_jobManagement_onOpen;
		   }else{
			   [ExileExtraAppsHomePage, 1] call ExileClient_gui_xm8_slide;
		   };
	   };
	   default {
		   ["forfeitJobRequest",[]] call ExileClient_system_network_send;
		   [ExileExtraAppsHomePage, 1] call ExileClient_gui_xm8_slide;
		   ExileLifeJobManagmentIsOpen = false;
		   ExileLifeUberJobID = "";
	   };
	};
};
