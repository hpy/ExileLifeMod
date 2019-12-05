/**
                    * ExilelifeClient_gui_settings_tab_keybinding_event_save
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_id","_keybind","_downHash","_upHash","_keybindsArr","_data","_category","_keyID","_index","_actionsArray","_actionIndex","_actionHash"];
try
{
	{
		_id = _x select 0;
		_keybind = _x select 1;
		_downHash = ExileLifeKeybindsDown getVariable _id;
		_upHash = ExileLifeKeybindsUp getVariable _id;
		if !((isNil "_downHash") && (isNil "_upHash")) then
		{
			_downHash set [1,_keybind];
			_upHash set [1,_keybind];
			ExileLifeKeybindsDown setVariable [_id,_downHash];
			ExileLifeKeybindsUp setVariable [_id,_upHash];
			_keybindsArr = profileNameSpace getVariable ["ExileLifeKeybinds",[]];
			if (_keybindsArr isEqualTo []) then
			{
				throw "Keybinds are empty!!";
			};
			_data = _id splitString "_";
			_category = _data select 0;
			_keyID = _data select 1;
			_index = (_keybindsArr select 0) find _category;
			if (_index isEqualTo -1) then
			{
				throw "Could not find category";
			};
			_actionsArray = (_keybindsArr select 1) select _index;
			_actionIndex = (_actionsArray select 0) find _keyID;
			if (_index isEqualTo -1) then
			{
				throw "Could not find ID";
			};
			_actionHash = (_actionsArray select 1) select _actionIndex;
			_actionHash set [2,_keybind];
		};
	}
	forEach ExileLifeKeybindModified;
}
catch
{
	_exception call ExileLifeClient_util_log;
	systemChat _exception;
};
ExileLifeKeybindLastSelected = "";
ExileLifeKeybindWaitingForKeypress = false;
ExileLifeKeybindModifingID = "";
ExileLifeKeybindModified = [];
ExileLifeKeybindCurrentBinds = [];
true