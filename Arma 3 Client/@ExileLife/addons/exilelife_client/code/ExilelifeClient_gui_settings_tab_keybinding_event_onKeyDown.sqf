/**
                    * ExilelifeClient_gui_settings_tab_keybinding_event_onKeyDown
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_keyCode","_result","_display","_listbox","_index"];
disableSerialization;
_keyCode = _this select 1;
_result = false;
_display = uiNamespace getVariable ["RscExileLifeSettings",displayNull];
_listbox = _display displayCtrl 23108;
_index = lbCurSel _listbox;
if (_keyCode == 0x01) then
{
	if (ExileLifeKeybindWaitingForKeypress) then
	{
		_listbox lbSetTextRight [_index,ExileLifeKeybindLastSelected];
		_listbox ctrlRemoveAllEventHandlers "KeyUp";
		_listbox ctrlEnable true;
		ExileLifeKeybindModifingID = "";
		_result = true;
	};
};
_result