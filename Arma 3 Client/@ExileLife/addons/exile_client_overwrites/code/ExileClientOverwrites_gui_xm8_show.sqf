/**
                    * ExileClientOverwrites_gui_xm8_show
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_display","_control","_loadedApps","_appIndex","_index","_slideControlID","_slideName","_slideTitle","_slideControl","_appID","_resource","_slidesControlGroup","_titleControl","_toSlideOpenFunction"];
if ((player getVariable ['ExileLifeClientIncapacitated', false]) || (!alive player)) exitWith{};
disableSerialization;
createDialog "RscExileXM8";
ExileClientXM8IsVisible = true;
if(isNil "ExileClientXM8CurrentSlide")then{
	ExileClientXM8CurrentSlide = "extraApps";
};
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (ExileClientXM8IsPowerOn) then
{
	_control = _display displayCtrl 4002;
	_control ctrlSetFade 1;
	_control ctrlCommit 0;
}
else
{
	{
		_control = _display displayCtrl _x;
		_control ctrlSetFade 1;
		_control ctrlCommit 0;
	}
	forEach
	[
		4002,
		4003,
		4004,
		4005,
		4007,
		4001,
		4010,
		4030,
		4020
	];
};
ExileClientXM8Apps = [[]];
_loadedApps = getArray(missionConfigFile >> "CfgXM8AppSettings" >> ExileLifeClientGang >> format["Rank%1", ExileLifeClientRank]);
_appIndex = 0;
_index = 0;
{
	(ExileClientXM8Apps select _appIndex) pushBackUnique _x;
	_index = _index + 1;
	if(_index == 14) then {
		_index = 0;
		_appIndex = _appIndex + 1;
		ExileClientXM8Apps pushBack [];
	};
}forEach _loadedApps;
ExileClientXM8MaxPage = _appIndex;
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
if (ExileClientXM8CurrentSlide isEqualTo "party") then
{
	if (ExileClientPartyID isEqualTo -1) then
	{
		ExileClientXM8CurrentSlide = "extraApps";
	};
};
{
	_slideControlID = getNumber (_x >> "controlID");
	_slideName = configName _x;
	_slideTitle = getText (_x >> "title");
	_slideControl = _display displayCtrl _slideControlID;
	if (_slideName isEqualTo ExileClientXM8CurrentSlide) then
	{
		if (isNull _slideControl) then
		{
			_appID = getText(_x >> "appID");
			_resource = getText(missionConfigFile >> format["XM8_%1_Button", _appID] >> "resource");
			_slidesControlGroup = _display displayCtrl 4007;
			_slideControl = _display ctrlCreate [_resource, getNumber(missionConfigFile >> _resource >> "idc"), _slidesControlGroup];
		};
		_titleControl = _display displayCtrl 4004;
		_titleControl ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>%1</t>", _slideTitle]));
		_slideControl ctrlSetPosition [(0 * 0.05), (0 * 0.05)];
		_slideControl ctrlCommit 0;
		_slideControl ctrlShow true;
		_toSlideOpenFunction = missionNamespace getVariable [format ["ExileLifeClient_gui_xm8_slide_%1_onOpen", _slideName], ""];
		if !(_toSlideOpenFunction isEqualTo "") then
		{
			call _toSlideOpenFunction;
		}
		else
		{
			_toSlideOpenFunction = missionNamespace getVariable [format ["ExileClient_gui_xm8_slide_%1_onOpen", _slideName], ""];
			if !(_toSlideOpenFunction isEqualTo "") then
			{
				call _toSlideOpenFunction;
			};
		};
	}
	else
	{
		if !(isNull _slideControl) then
		{
			_slideControl ctrlShow false;
		};
	};
}
forEach (("true" configClasses (missionConfigFile >> "CfgXM8")) + ("true" configClasses (configFile >> "CfgXM8")));
ExileXM8ThreadHandle = [10, ExileClient_gui_xm8_thread_update, [], true,"XM8 Update"] call ExileClient_system_thread_addtask;
call ExileClient_gui_xm8_thread_update;
