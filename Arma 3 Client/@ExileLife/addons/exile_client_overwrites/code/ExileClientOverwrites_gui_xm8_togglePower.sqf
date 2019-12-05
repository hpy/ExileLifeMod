/**
                    * ExileClientOverwrites_gui_xm8_togglePower
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

                    private["_display","_control","_controlsToShow","_backgroundSplash"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (diag_tickTime > ExileClientXM8NextPossiblePowerToggleTime) then
{
	if (ExileClientXM8IsPowerOn) then
	{
		ExileClientXM8NextPossiblePowerToggleTime = diag_tickTime + 1;
		playSound ["SndXM8PowerOff", true];
		{
			_control = _display displayCtrl _x;
			_control ctrlSetFade 0;
			_control ctrlCommit 0;
			_control ctrlSetFade 1;
			_control ctrlCommit 0.250;
		}
		forEach
		[
			4007, 
			4003, 
			4004, 
			4005, 
			4001,
			4010,
			4030,
			4020
		];
		ExileClientXM8IsPowerOn = false;
	}
	else 
	{
		ExileClientXM8NextPossiblePowerToggleTime = diag_tickTime + 1.5;
		_controlsToShow = 		
		[
			4007, 
			4003, 
			4004, 
			4005, 
			4001
		];
		if (ExileClientXM8IsMessageVisible) then { _controlsToShow pushBack 4010 };
		if (ExileClientXM8IsWarningVisible) then { _controlsToShow pushBack 4030 };
		if (ExileClientXM8IsConfirmVisible) then { _controlsToShow pushBack 4020 };
		playSound ["SndXM8PowerOn", true];
		{
			_control = _display displayCtrl _x;
			_control ctrlSetFade 1;
			_control ctrlCommit 0;
		}
		forEach _controlsToShow;
		_backgroundSplash = _display displayCtrl 4002;
		if (!(ExileLifeClientGang isEqualTo "") && !(ExileLifeClientGang isEqualTo "Rogue") && !(isNil 'ExileLifeClientGang')) then
		{
			_backgroundSplash ctrlSetText format["exilelife_assets\texture\ui\XM8\xm8_splash_%1_ca.paa",ExileLifeClientGang];
		};
		_backgroundSplash ctrlSetFade 1;
		_backgroundSplash ctrlShow true;
		_backgroundSplash ctrlSetPosition [0 * (0.025) + (0), -4 * (0.04) + (0)]; 
		_backgroundSplash ctrlCommit 0;
		_backgroundSplash ctrlSetFade 0;
		_backgroundSplash ctrlCommit 0.250;
		waitUntil {ctrlCommitted _backgroundSplash};
		{
			_control = _display displayCtrl _x;
			_control ctrlSetFade 0;
			_control ctrlCommit 0;
		}
		forEach _controlsToShow;
		uiSleep 1;
		_backgroundSplash ctrlSetFade 1;
		_backgroundSplash ctrlCommit 0.250;
		waitUntil {ctrlCommitted _backgroundSplash};
		_backgroundSplash ctrlShow false; 
		_backgroundSplash ctrlSetPosition [-1, -1]; 
		ExileClientXM8IsPowerOn = true;
	};
};
