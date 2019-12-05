/**
                    * ExilelifeClient_system_jobs_network_addSideQuest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_jobClassname","_progression","_position","_text","_primary","_type","_current","_delay","_notification","_display"];
_jobClassname = _this select 0;
_progression = _this select 1;
_position = _this select 2;
_text = _this select 3;
_primary = _this param [4,0];
_type = _this param [5,""];
_current = configFile >> "CfgJobs" >> _jobClassname >> "Progression" >> format["Step%1",_progression];
ExileLifeCurrentSideTask = player createSimpleTask [getText(_current >> "shortName"),ExileLifeParentJobTask];
ExileLifeJobTaskClearQueue pushBack ExileLifeCurrentSideTask;
ExileLifeCurrentSideTask setSimpleTaskDescription
[
	_text,
	"Side Task",
	"Side Task"
];
if (_position isEqualTo []) then
{
	_position = getArray(_current >> "sideQuestPOS");
};
if !(_position isEqualTo []) then
{
	ExileLifeCurrentSideTask setSimpleTaskDestination _position;
};
ExileLifeCurrentSideTask setTaskState "CREATED";
if (_primary > 0) then 
{
	ExileLifeCurrentSideTask setTaskState "ASSIGNED";
	player setCurrentTask ExileLifeCurrentSideTask;	
};
if !(_type isEqualTo "") then
{
	ExileLifeCurrentSideTask setSimpleTaskType _type;
};
_delay = getNumber(_current >> "delaySideQuestNotification");
_notification = getNumber(_current >> "disableSideQuestNotification");
if !(_notification == 0) then
{
	if(_delay>0) then
	{
		[_delay,_text] spawn 
		{
			uisleep _this select 0;
			["Side Task",_this select 1,10] spawn ExileLifeClient_gui_baguette_show;
		};
	}
	else
	{
		["Side Task",_text,10] spawn ExileLifeClient_gui_baguette_show;
	};
};
_display = uiNameSpace getVariable [getText (configFile >> "CfgJobs" >> _jobClassname >> "closeDialog"),displayNull];
if (!isNull _display) then
{
	_display closeDisplay 0;
};