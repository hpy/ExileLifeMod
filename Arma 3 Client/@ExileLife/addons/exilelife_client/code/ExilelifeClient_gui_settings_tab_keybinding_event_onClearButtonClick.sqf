/**
                    * ExilelifeClient_gui_settings_tab_keybinding_event_onClearButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_listbox","_index"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeSettings",displayNull];
_listbox = _display displayCtrl 23108;
_index = -1;
{
	if ((_x select 0) isEqualTo ExileLifeKeybindModifingID) exitWith
	{
		_index = _forEachIndex;
	};
}
forEach ExileLifeKeybindModified;
if (_index isEqualTo -1) then
{
	ExileLifeKeybindModified pushbackUnique [ExileLifeKeybindModifingID,[-1,[false,false,false]]];
}
else
{
	(ExileLifeKeybindModified select _index) set [1,[-1,[false,false,false]]];
};
_listbox lbSetTextRight [(lbCurSel _listbox),""];
_listbox ctrlEnable true;
ExileLifeKeybindWaitingForKeypress = false;