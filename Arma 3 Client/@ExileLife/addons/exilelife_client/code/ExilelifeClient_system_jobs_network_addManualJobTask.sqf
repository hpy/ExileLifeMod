/**
                    * ExilelifeClient_system_jobs_network_addManualJobTask
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_jobClassname","_progression","_timeLeft","_position","_disableForfeit","_current","_type","_marker","_configFile","_icon"];
_jobClassname = _this select 0;
_progression = _this select 1;
_timeLeft = _this select 2;
_position = _this select 3;
ExileLifeParentJobTaskShortName = _this select 4;
ExileLifeParentJobTaskShortDescription = _this select 5;
ExileLifeParentJobTaskLongDescription = _this select 6;
_disableForfeit = _this select 7;
ExileLifeCurrentJob = [_jobClassname,_progression,_timeLeft,_position];
if (_progression > 0) then
{
	ExileLifeCurrentJobTask setTaskState "Succeeded";
	ExileLifeJobTaskClearQueue pushBack ExileLifeCurrentJobTask;
	if !(ExileLifeCurrentJobTaskMarker isEqualTo "") then
	{
		removeMissionEventHandler ["Draw3D",ExileLifeCurrentJobTaskMarker];
	};
	ExileLifeCurrentJobTask = "";
	ExileLifeCurrentJobTaskMarker = "";
};
if (_progression isEqualTo 0) then
{
	ExileLifeParentJobTask = player createSimpleTask [_jobClassname];
	ExileLifeJobTaskClearQueue pushBack ExileLifeParentJobTask;
	ExileLifeParentJobTask setSimpleTaskDescription
	[
		ExileLifeParentJobTaskLongDescription,
		ExileLifeParentJobTaskShortDescription,
		ExileLifeParentJobTaskShortName
	];
};
_current = configFile >> "CfgJobs" >> _jobClassname >> "Progression" >> format["Step%1",_progression];
ExileLifeCurrentJobTask = player createSimpleTask [ExileLifeParentJobTaskShortName];
ExileLifeJobTaskClearQueue pushBack ExileLifeCurrentJobTask;
ExileLifeCurrentJobTask setSimpleTaskDescription
[
	ExileLifeParentJobTaskLongDescription,
	ExileLifeParentJobTaskShortDescription,
	ExileLifeParentJobTaskShortName
];
if !(_position isEqualTo []) then
{
	ExileLifeCurrentJobTask setSimpleTaskDestination _position;
};
ExileLifeCurrentJobTask setTaskState "CREATED";
if !(isNil "ExileLifeCurrentSideTask") then
{
	if !((taskState ExileLifeCurrentSideTask) == "ASSIGNED") then
	{
		player setCurrentTask ExileLifeCurrentJobTask;
	};
}
else
{
	ExileLifeCurrentJobTask setTaskState "ASSIGNED";
	player setCurrentTask ExileLifeCurrentJobTask;
};
_type = getText(_current >> "type");
if !(_type isEqualTo "") then
{
	ExileLifeCurrentJobTask setSimpleTaskType _type;
};
_marker = (getNumber(_current >> "use3DMarkers")) isEqualTo 1;
if (_marker && !(_position isEqualTo [])) then
{
	ExileLifeCurrentJobTaskMarker = addMissionEventHandler ["Draw3D",
	{
		_configFile = (configFile >> "CfgJobs" >> (ExileLifeCurrentJob select 0) >> "Progression" >> format["Step%1",(ExileLifeCurrentJob select 1)]);
		_position = ExileLifeCurrentJob select 3;
		_icon = getText(_configFile >> "type");
		if ((round(player distance _position)) < 500) then
		{
			drawIcon3D
			[
				format["\A3\ui_f\data\igui\cfg\simpleTasks\types\%1_ca.paa",_icon],
				[0.604,0.953,0.067,1],
				_position,
				0.7,
				0.7,
				1,
				toUpper(format["%1m",round(player distance _position)]),
				0.7,
				0.03,
				"OrbitronLight",
				"center"
			];
		};
	}];
};
if (_disableForfeit) then
{
	ExileLifeCurrentJobCanForfeit = false;
};
