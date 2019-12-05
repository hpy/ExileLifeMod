/**
                    * ExilelifeClient_gui_xm8_slide_notify_onOpen
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_listbox","_index","_endSeconds","_hours","_minutes","_seconds","_time"];
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_listbox = _display displayCtrl 32201;
lbClear _listbox;
if !(ExileLifeNotifications isEqualTo []) then
{
	{
		_index = _listbox lbAdd (format [ "%1", parseText ( format [ "<t>%1</t>", (_x select 0) ] ) ] select [0,25]);
		_endSeconds = round(time - (_x select 2));
		_hours = floor((_endSeconds / 60 / 60) % 24);
		_minutes = floor((_endSeconds / 60) % 60);
		_seconds = floor(_endSeconds % 60);
		_time = "";
		if !(_hours isEqualTo 0) then
		{
			_time = _time + format["%1h ",_hours];
		};
		if !(_minutes isEqualTo 0) then
		{
			_time = _time + format["%1m ",_minutes];
		};
		if !(_seconds isEqualTo 0) then
		{
			_time = _time + format["%1s ",_seconds];
		};
		_listbox lbSetTextRight [_index,format["%1ago",_time]];
		_listbox lbSetData [_index, format["%1`%2",_x select 0,_x select 1]];
		_listbox lbSetValue [_index, (count(ExileLifeNotifications) - 1) - _forEachIndex];
	}
	forEach ([ExileLifeNotifications, [], {_x select 2}, "DECEND", {true}] call BIS_fnc_sortBy);
	ExileLifeNotificationsIsOpen = true;
	ExileLifeXM8NotifThread = [5,ExileLifeClient_gui_xm8_slide_notify_thread_update,[],true,"XM8 Timer"] call ExileClient_system_thread_addTask;
};