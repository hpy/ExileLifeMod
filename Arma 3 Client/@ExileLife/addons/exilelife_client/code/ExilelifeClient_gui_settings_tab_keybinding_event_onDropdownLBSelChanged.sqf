/**
                    * ExilelifeClient_gui_settings_tab_keybinding_event_onDropdownLBSelChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_keybinds","_lbIndex","_listbox","_category","_actions","_id","_activeActions","_index","_keyArray","_key","_modifierArray","_text"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeSettings",displayNull];
_keybinds = profileNameSpace getVariable ["ExileLifeKeybinds",[]];
_lbIndex = _this select 1;
_listbox = _display displayCtrl 23108;
_category = (_keybinds select 0) select _lbIndex;
lbClear _listbox;
if !(_keybinds isEqualTo []) then
{
	_actions = (_keybinds select 1) select _lbIndex;
	{
		_id = _x;
		if (_x in (ExileLifeKeybindActiveBinds select 1)) then
		{
			_activeActions = _actions select 1;
			_index = _listbox lbAdd ((_activeActions select _forEachIndex) select 0);
			_listbox lbSetData [_index,format["%1|%2_%3",(_activeActions select _forEachIndex) select 1,_category,_id]];
			_keyArray = (_activeActions select _forEachIndex) select 2;
			_key = (_keyArray select 0) call ExileLifeClient_util_keybinding_getStringedDik;
			_modifierArray = _keyArray select 1;
			_text = "";
			if (_modifierArray select 1) then
			{
				_text = _text + "Control + ";
			};
			if (_modifierArray select 2) then
			{
				_text = _text + "Alt + ";
			};
			if (_modifierArray select 0) then
			{
				_text = _text + "Shift + ";
			};
			_text = _text + _key;
			_listbox lbSetTextRight [_index,_text];
			ExileLifeKeybindCurrentBinds pushbackUnique _text;
		};
	}
	forEach (_actions select 0);
};