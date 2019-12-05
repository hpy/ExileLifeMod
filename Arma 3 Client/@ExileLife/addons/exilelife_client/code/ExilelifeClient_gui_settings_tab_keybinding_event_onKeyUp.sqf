/**
                    * ExilelifeClient_gui_settings_tab_keybinding_event_onKeyUp
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_caller","_keyCode","_shiftState","_controlState","_altState","_display","_listbox","_index","_text","_key","_removalIndex"];
if (ExileLifeKeybindWaitingForKeypress) then
{
	disableSerialization;
	_caller = _this select 0;
	_keyCode = _this select 1;
	_shiftState = _this select 2;
	_controlState = _this select 3;
	_altState = _this select 4;
	_display = uiNamespace getVariable ["RscExileLifeSettings",displayNull];
	_listbox = _display displayCtrl 23108;
	_index = lbCurSel _listbox;
	_text = "";
	if (_controlState) then
	{
		_text = _text + "Control + ";
	};
	if (_altState) then
	{
		_text = _text + "Alt + ";
	};
	if (_shiftState) then
	{
		_text = _text + "Shift + ";
	};
	if !(_keyCode in [0x2A,0x38,0x1D,0x36,0xB8,0x9D]) then
	{
		_key = _keyCode call ExileLifeClient_util_keybinding_getStringedDik;
		_text = _text + _key;
		_listbox lbSetTextRight [_index,_text];
		_removalIndex = ExileLifeKeybindCurrentBinds find ExileLifeKeybindLastSelected;
		if !(_removalIndex isEqualTo -1) then
		{
			ExileLifeKeybindCurrentBinds deleteAt _removalIndex;
		};
		if (_text in ExileLifeKeybindCurrentBinds) then
		{
			_listbox lbSetColorRight [_index, [0.780, 0.149, 0.318, 1]];
		}
		else
		{
			ExileLifeKeybindCurrentBinds pushbackUnique _text;
			_listbox lbSetColorRight [_index, [1,1,1,1]];
		};
		ExileLifeKeybindWaitingForKeypress = false;
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
			ExileLifeKeybindModified pushbackUnique [ExileLifeKeybindModifingID,[_keyCode,[_shiftState,_controlState,_altState]]];
		}
		else
		{
			(ExileLifeKeybindModified select _index) set [1,[_keyCode,[_shiftState,_controlState,_altState]]];
		};
		_listbox ctrlEnable true;
	};
};
true