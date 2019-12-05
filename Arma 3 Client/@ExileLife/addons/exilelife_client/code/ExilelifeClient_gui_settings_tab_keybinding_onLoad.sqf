/**
                    * ExilelifeClient_gui_settings_tab_keybinding_onLoad
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_keybinds","_listbox","_dropdown","_clearButton","_index"];
disableSerialization;
ExileLifeKeybindLastSelected = "";
ExileLifeKeybindWaitingForKeypress = false;
ExileLifeKeybindModifingID = "";
ExileLifeKeybindModified = [];
ExileLifeKeybindCurrentBinds = [];
_display = uiNamespace getVariable ["RscExileLifeSettings",displayNull];
_display displayAddEventHandler ["KeyDown","_this call ExileLifeClient_gui_settings_tab_keybinding_event_onKeyDown"];
_display displayAddEventHandler ["KeyUp","_this call ExileLifeClient_gui_settings_tab_keybinding_event_onKeyUp"];
_keybinds = profileNameSpace getVariable ["ExileLifeKeybinds",[]];
_listbox = _display displayCtrl 23108;
_dropdown = _display displayCtrl 23113;
_clearButton = _display displayCtrl 23112;
_listbox ctrlRemoveAllEventHandlers "KeyUp";
_dropdown ctrlRemoveAllEventHandlers "LBSelChanged";
_clearButton ctrlRemoveAllEventHandlers "ButtonClick";
lbClear _listbox;
lbClear _dropdown;
if !(_keybinds isEqualTo []) then
{
	{
		if (_x in (ExileLifeKeybindActiveBinds select 0)) then
		{
			_index = _dropdown lbAdd format["%1", _x];
			_dropdown lbSetValue [_index,_forEachIndex];
		};
	}
	forEach (_keybinds select 0);
};
_listbox ctrlAddEventHandler ["LBDblClick", "call ExileLifeClient_gui_settings_tab_keybinding_event_onLBDoubleClick"];
_listbox ctrlAddEventHandler ["LBSelChanged", "call ExileLifeClient_gui_settings_tab_keybinding_event_onLBSelChanged"];
_dropdown ctrlAddEventHandler ["LBSelChanged","call ExileLifeClient_gui_settings_tab_keybinding_event_onDropdownLBSelChanged"];
_clearButton ctrlAddEventHandler ["ButtonClick","call ExileLifeClient_gui_settings_tab_keybinding_event_onClearButtonClick"];
_dropdown lbSetCurSel 0;