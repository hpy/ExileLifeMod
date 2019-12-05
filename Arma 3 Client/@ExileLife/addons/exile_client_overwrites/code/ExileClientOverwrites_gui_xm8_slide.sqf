/**
                    * ExileClientOverwrites_gui_xm8_slide
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

                    private["_toSlideName","_direction","_display","_toConfig","_toSlideControlID","_toSlideControl","_toSlideTitle","_fromConfig","_fromSlideControlID","_fromSlideControl","_titleControl","_appsPageTransition"];
disableSerialization;
_toSlideName = _this select 0;
_direction = _this select 1;
if(_toSlideName == "apps")then{
	if (isNil "ExileExtraAppsHomePage")then{
		_toSlideName = "extraApps";
	}else{
		_toSlideName = ExileExtraAppsHomePage;
	};
};
if (!(ExileClientXM8CurrentSlide isEqualTo _toSlideName)) then
{
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	_toConfig = configFile >> "CfgXM8" >> _toSlideName;
	if (isclass(missionConfigFile >> "CfgXM8" >> _toSlideName)) then
	{
		_toConfig = missionConfigFile >> "CfgXM8" >> _toSlideName;
	};
	_toSlideControlID = getNumber (_toConfig >> "controlID");
	_toSlideControl = _display displayCtrl _toSlideControlID;
	_toSlideTitle = getText (_toConfig >> "title");
	_fromConfig = configFile >> "CfgXM8" >> ExileClientXM8CurrentSlide;
	if (isclass(missionConfigFile >> "CfgXM8" >> ExileClientXM8CurrentSlide)) then
	{
		_fromConfig = missionConfigFile >> "CfgXM8" >> ExileClientXM8CurrentSlide;
	};
	_fromSlideControlID = getNumber (_fromConfig >> "controlID");
	_fromSlideControl = _display displayCtrl _fromSlideControlID;
	_titleControl = _display displayCtrl 4004;
	_titleControl ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>%1</t>", _toSlideTitle]));
	_appsPageTransition = false;
	if(ExileClientXM8CurrentSlide == "extraApps" && (_toSlideName == "extraAppsTransition"))then{
		_appsPageTransition = true;
	};
	if(ExileClientXM8CurrentSlide == "extraAppsTransition" && (_toSlideName == "extraApps"))then{
		_appsPageTransition = true;
	};
	if (_appsPageTransition) then {
		if (_direction isEqualTo 0) then{
			if(ExileClientXM8Page < ExileClientXM8MaxPage) then{
				ExileClientXM8Page = ExileClientXM8Page + 1;
			};
		}else{
			if(ExileClientXM8Page > 0) then{
				ExileClientXM8Page = ExileClientXM8Page - 1;
			};
		};
	};
	if (_direction isEqualTo 0) then
	{
		_toSlideControl ctrlSetPosition [(19 * 0.05), (0 * 0.05)];
		_toSlideControl ctrlShow true;
		_toSlideControl ctrlCommit 0;
		_toSlideName call ExileLifeClient_gui_xm8_slideFunctions;
		_toSlideControl ctrlSetPosition [(0 * 0.05), (0 * 0.05)];
		_toSlideControl ctrlCommit 0.25;
		_fromSlideControl ctrlSetPosition [(-19 * 0.05), (0 * 0.05)];
		_fromSlideControl ctrlCommit 0.25;
	}
	else
	{
		_toSlideControl ctrlSetPosition [(-19 * 0.05), (0 * 0.05)];
		_toSlideControl ctrlShow true;
		_toSlideControl ctrlCommit 0;
		_toSlideName call ExileLifeClient_gui_xm8_slideFunctions;
		_toSlideControl ctrlSetPosition [(0 * 0.05), (0 * 0.05)];
		_toSlideControl ctrlCommit 0.25;
		_fromSlideControl ctrlSetPosition [(19 * 0.05), (0 * 0.05)];
		_fromSlideControl ctrlCommit 0.25;
	};
	ExileClientXM8CurrentSlide = _toSlideName;
};
