/**
                    * ExilelifeClient_gui_xm8_slide_jobManagement_thread_update
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_endSeconds","_uberJobList","_uberJob","_jobTime","_uberJobsList","_days","_hours","_minutes","_seconds","_text"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (isNull _display || !ExileLifeJobManagmentIsOpen || !ExileClientXM8IsVisible) exitWith
{
	[ExileLifeXM8JobThread] call ExileClient_system_thread_removeTask;
	ExileLifeJobManagmentIsOpen = false;
	[ExileExtraAppsHomePage, 1] call ExileClient_gui_xm8_slide; 
};
_endSeconds = 0;
if (ExileLifeCurrentJob isEqualTo [])then{
	_uberJobList = player getVariable ['ExileLifeClientUberJobs',[]];
	 if (_uberJobList isEqualTo [])exitWith
	 {
	 	[ExileLifeXM8JobThread] call ExileClient_system_thread_removeTask;
	 	ExileLifeJobManagmentIsOpen = false;
		[ExileExtraAppsHomePage, 1] call ExileClient_gui_xm8_slide; 
	 };
	 _uberJob = _uberJobList select 0;
	 _jobTime = _uberJob select 6;
	 if (typeName _jobTime != "SCALAR")exitWith{
		[ExileLifeXM8JobThread] call ExileClient_system_thread_removeTask;
 	 	ExileLifeJobManagmentIsOpen = false;
		[ExileExtraAppsHomePage, 1] call ExileClient_gui_xm8_slide; 
	 };
	if(ExileLifeTimeSynced) then{
		_endSeconds = (_uberJob select 6) - serverTime + ExileLifeTimeDifference;
	}else{
		_endSeconds = (_uberJob select 6) - serverTime;
	};
	if(_endSeconds < 0)then{
		_uberJobsList = player getVariable ['ExileLifeClientUberJobs',[]];
		_uberJobsList deleteAt 0;
		player setVariable ['ExileLifeClientUberJobs',_uberJobsList];
		ExileLifeJobManagmentIsOpen = false;
		ExileLifeUberJobID = "";
		if (count _uberJobsList > 0)then{
			call ExileLifeClient_gui_xm8_slide_jobManagement_onOpen;
		}else{
			[ExileLifeXM8JobThread] call ExileClient_system_thread_removeTask;
			[ExileExtraAppsHomePage, 1] call ExileClient_gui_xm8_slide;
		};
	};
}else{
	if(ExileLifeTimeSynced) then{
		_endSeconds = parseNumber(ExileLifeCurrentJob select 2) - serverTime + ExileLifeTimeDifference;
	};
};
if (_endSeconds > 0) then
{
	_days = floor(_endSeconds / 60 / 60 / 24);
	_hours = floor((_endSeconds / 60 / 60) % 24);
	_minutes = floor((_endSeconds / 60) % 60);
	_seconds = floor(_endSeconds % 60);
	if (_days + _hours isEqualTo 0 && ((_minutes + _seconds) > 0))then{
		_text = format["<t>%1 minutes, %2 seconds</t>",_minutes,_seconds];
	}else{
		if (_days isEqualTo 0 && ((_hours+_minutes+_seconds) > 0))then{
			_text = format["<t>%1 hours, %2 minutes, %3 seconds</t>",_hours,_minutes,_seconds];
		}else{
			if ((_days + _hours + _minutes + _seconds) > 0) then
			{
				_text = format["<t>%1 days, %2 hours, %3 minutes, %4 seconds</t>",_days,_hours,_minutes,_seconds];
			}
			else
			{
				_text = "<t>0 days, 0 hours, 0 minutes, 0 seconds</t>";
			};
		}
	};
	(_display displayCtrl 31012) ctrlSetStructuredText parseText _text;
}
else
{
	(_display displayCtrl 31012) ctrlSetStructuredText parseText "<t>Waiting for ArmA to figure out how to time...</t>";
};
