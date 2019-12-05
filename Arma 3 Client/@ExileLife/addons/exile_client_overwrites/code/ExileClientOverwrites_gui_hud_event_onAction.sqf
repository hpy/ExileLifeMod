/**
                    * ExileClientOverwrites_gui_hud_event_onAction
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

                    private["_type","_cancelAction"];
if (isNil "_this") exitWith { false };
if !(_this isEqualType []) exitWith { false };
if ((count _this) < 4) exitWith { false };
_type = _this select 3;
_cancelAction = false;
if (ExileClientIsHandcuffed) then 
{
	if !(_type isEqualTo "User") then 
	{
		_cancelAction = true;
	};
};
if (ExileIsPlayingRussianRoulette) then 
{
	_cancelAction = true;
};
if (ExileClientActionDelayShown) then 
{
	if !(ExileLifeActionRepeatOverride) then 
	{
		ExileClientActionDelayAbort = true; 
		_cancelAction = true; 
	};
};
_cancelAction