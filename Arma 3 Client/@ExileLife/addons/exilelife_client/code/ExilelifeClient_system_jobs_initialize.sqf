/**
                    * ExilelifeClient_system_jobs_initialize
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_isBambi","_check","_jobClassname","_progression","_endTime","_position","_current","_type","_marker","_configFile","_icon"];
_isBambi = _this select 0;
waituntil { uiSleep 0.1; !(IsNull findDisplay 46) };
uiSleep 3;
_check = profileNamespace getVariable ["ExileLifeCompletedTutorial",""];
if (_isBambi && (_check isEqualTo "")) then
{
	"WelcomeScreen" call ExileLifeClient_gui_dialog_select;
	waitUntil {uiSleep 0.1;!isNil "ExileLifeWelcomeMessageClosed"};
	ExileLifeWelcomeMessageClosed = nil;
	["startJobRequest",["Tutorial"]] call ExileClient_system_network_send;
	profileNamespace setVariable ["ExileLifeCompletedTutorial","STARTED"];
	saveProfileNameSpace;
}
else
{
	if !(ExileLifeCurrentJob isEqualTo []) then
	{
		_jobClassname = ExileLifeCurrentJob select 0;
		_progression = ExileLifeCurrentJob select 1;
		_endTime = ExileLifeCurrentJob select 2;
		_position = ExileLifeCurrentJob select 3;
		ExileLifeParentJobTask = player createSimpleTask [_jobClassname];
		ExileLifeJobTaskClearQueue pushBack ExileLifeParentJobTask;
		ExileLifeParentJobTask setSimpleTaskDescription
		[
			getText (configFile >> "CfgJobs" >> _jobClassname >> "longDescription"),
			getText (configFile >> "CfgJobs" >> _jobClassname >> "shortDescription"),
			getText (configFile >> "CfgJobs" >> _jobClassname >> "shortName")
		];
		if (getNumber(configFile >> "CfgJobs" >> _jobClassname >> "cancelOnRestart") > 0) then
		{
			["overrideJobRequest",[netID player]] call ExileClient_system_network_send;
			["ErrorTitleAndText", ["BLACKOUT", "It appears you blacked out and forgot what you were doing..."]] call ExileClient_gui_toaster_addTemplateToast;
		}
		else
		{
			if (getNumber(configFile >> "CfgJobs" >> _jobClassname >> "cancelOnDisconnect") > 0) then
			{
				["failJobRequest",[]] call ExileClient_system_network_send;
			}
			else
			{
				_current = configFile >> "CfgJobs" >> _jobClassname >> "Progression" >> format["Step%1",_progression];
				ExileLifeCurrentJobTask = player createSimpleTask [getText(_current >> "shortName"),ExileLifeParentJobTask];
				ExileLifeJobTaskClearQueue pushBack ExileLifeCurrentJobTask;
				ExileLifeParentJobTaskLongDescription = getText(_current >> "longDescription");
				ExileLifeParentJobTaskShortDescription = getText(_current >> "shortDescription");
				ExileLifeParentJobTaskShortName = getText(_current >> "shortName");
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
				ExileLifeCurrentJobTask setTaskState "ASSIGNED";
				_type = getText(_current >> "type");
				if !(_type isEqualTo "") then
				{
					ExileLifeCurrentJobTask setSimpleTaskType _type;
				};
				player setCurrentTask ExileLifeCurrentJobTask;
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
				if ((getNumber (configFile >> "CfgJobs" >> _jobClassname >> "disableJobForfeit")) > 0) then
				{
					ExileLifeCurrentJobCanForfeit = false;
				};
				if !((getNumber (configFile >> "CfgJobs" >> _jobClassname >> "disableMsgonRestart")) > 0) then
				{
					["JobInProgress",[getText(_current >> "shortDescription")]] call ExileClient_gui_toaster_addTemplateToast;
				};
			};
		};
	};
};
