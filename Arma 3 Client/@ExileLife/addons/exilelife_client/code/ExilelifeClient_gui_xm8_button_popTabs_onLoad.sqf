/**
                    * ExilelifeClient_gui_xm8_button_popTabs_onLoad
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_appTile","_popTabsValue"];
_appTile = _this;
if(isNull _appTile)exitWith{};
_popTabsValue = (player getVariable ["ExileLocker", 0]);
if (_popTabsValue > 999) then
{
	_popTabsValue = format ["%1k", floor (_popTabsValue / 1000)];
};
_appTile ctrlSetTooltip format["You have %1 Pop Tabs in your locker", _popTabsValue];
_appTile ctrlSetText (format ["%1", _popTabsValue]);
