/**
                    * ExilelifeClient_gui_xm8_slide_notify_event_clear
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_listbox","_type","_index"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileXM8",displayNull];
_listbox = _display displayCtrl 32201;
_type = _this;
if (_type isEqualTo "ALL") then
{
	ExileLifeNotifications = [];
	call ExileLifeClient_gui_xm8_slide_notify_thread_update;
}
else
{
	_index = _listbox lbValue (lbCursel _listbox);
	ExileLifeNotifications deleteAt _index;
	call ExileLifeClient_gui_xm8_slide_notify_thread_update;
};
true