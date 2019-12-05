/**
                    * ExilelifeClient_gui_xm8_slide_jobManagement_onOpen
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_clear","_currentJob","_description","_currentObjective","_progression","_uberJobs","_job"];
disableSerialization;
if(ExileLifeJobManagmentIsOpen)exitWith{};
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_clear = false;
ExileLifeUberJobID = "";
if !(ExileLifeCurrentJob isEqualTo []) then
{
	ExileLifeJobManagmentIsOpen = true;
	(_display displayCtrl 31013) ctrlEnable false;
	(_display displayCtrl 31013) ctrlShow false;
	(_display displayCtrl 31016) ctrlEnable false;
	(_display displayCtrl 31016) ctrlShow false;
	(_display displayCtrl 31015) ctrlEnable false;
	(_display displayCtrl 31015) ctrlShow false;
	if (ExileLifeCurrentJobCanForfeit) then
	{
		(_display displayCtrl 31013) ctrlEnable true;
		(_display displayCtrl 31013) ctrlShow true;
	};
	_currentJob = _display displayCtrl 31003;
	_currentJob ctrlSetStructuredText parseText format["<t valign='middle'>%1</t>",ExileLifeParentJobTaskShortName]; 
	_description = _display displayCtrl 31006;
	_description ctrlSetStructuredText parseText format["<t size='0.9'>%1</t>",ExileLifeParentJobTaskLongDescription];
	_currentObjective = _display displayCtrl 31008;
	_progression = (configFile >> "CfgJobs" >> (ExileLifeCurrentJob select 0) >> "Progression" >> format["Step%1",ExileLifeCurrentJob select 1]);
	_currentObjective ctrlSetStructuredText parseText getText(_progression >> "shortDescription");
	getArray(configFile >> "CfgJobs" >> (ExileLifeCurrentJob select 0) >> "reward") call ExileLifeClient_gui_xm8_slide_jobManagement_showRewards;
	ExileLifeXM8JobThread = [0.1,ExileLifeClient_gui_xm8_slide_jobManagement_thread_update,[],true,"XM8 Timer"] call ExileClient_system_thread_addTask;
	call ExileLifeClient_gui_xm8_slide_jobManagement_thread_update;
}else{
	_uberJobs = player getVariable ['ExileLifeClientUberJobs',[]];
	if !(_uberJobs isEqualTo [])then{
		_job = _uberJobs select 0;
		if !(_job isEqualTo [])then{
			ExileLifeJobManagmentIsOpen = true;
			_job call ExileLifeClient_gui_xm8_slide_jobManagement_showUberJob;
		}else{
			_currentJob ctrlSetText "You currently don't have any jobs or offers";
			_clear = true;
		};
	}else{
		_currentJob ctrlSetText "You currently don't have any jobs or offers";
		_clear = true;
	};
	if(_clear)then{
		(_display displayCtrl 31013) ctrlShow false;
		(_display displayCtrl 31013) ctrlEnable false;
		(_display displayCtrl 31014) ctrlShow true;
		(_display displayCtrl 31014) ctrlEnable true;
		{
			(_display displayCtrl _x) ctrlSetText "";
		}
		forEach [31006,31008];
		{
			(_display displayCtrl _x) ctrlSetStructuredText parseText "<t></t>";
		}
		forEach [31010,31012];
	};
};
true
