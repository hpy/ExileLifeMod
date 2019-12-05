/**
                    * ExilelifeClient_gui_xm8_button_respect_onLoad
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_appTile","_respectValue"];
_appTile = _this;
if(isNull _appTile)exitWith{};
_respectValue = ExileClientPlayerScore;
if (_respectValue > 999) then
{
	_respectValue = format ["%1k", floor (_respectValue / 1000)];
};
_appTile ctrlSetTooltip format["You have %1 Respect", _respectValue];
_appTile ctrlSetText (format ["%1", _respectValue]);
