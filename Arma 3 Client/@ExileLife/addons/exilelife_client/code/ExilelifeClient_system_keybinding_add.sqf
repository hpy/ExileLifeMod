/**
                    * ExilelifeClient_system_keybinding_add
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_category","_id","_displayName","_description","_downCode","_upCode","_default","_temporary","_hash","_keybinds","_categories","_actions","_index","_actionIndex","_info","_downHashArray","_upHashArray"];
_category = _this select 0;
_id = _this select 1;
_displayName = _this select 2;
_description = _this select 3;
_downCode = _this select 4;
_upCode = _this select 5;
_default = param [6,[-1,[false,false,false]]];
_temporary = param [7,false];
_hash = false;
try
{
	if (_category isEqualTo "") then
	{
		throw "Category cannot be empty!";
	};
	if (_id isEqualTo "") then
	{
		throw "ID cannot be empty!";
	};
	_keybinds = profileNameSpace getVariable ["ExileLifeKeybinds",nil];
	if (isNil "_keybinds") then
	{
		_keybinds = [[],[]];
		profileNameSpace setVariable ["ExileLifeKeybinds",_keybinds];
	};
	_categories = _keybinds select 0;
	_actions = _keybinds select 1;
	_index = _categories find _category;
	if (_index isEqualTo -1) then
	{
		_index = _categories pushBack _category;
		_actions pushBack [[],[]];
	};
	_actions = _actions select _index;
	_actionIndex = (_actions select 0) find _id;
	if !(_actionIndex > -1) then
	{
		(_actions select 0) pushback _id;
		(_actions select 1) pushBack [_displayName,_description,_default];
	}
	else
	{
		_info = ((_actions select 1) select _actionIndex);
		if !((_info select 0) isEqualTo _displayName) then
		{
			_info set [0, _displayName];
		};
		if !((_info select 1) isEqualTo _description) then
		{
			_info set [1, _description];
		};
		_default = _info select 2;
	};
	_hash = format["%1_%2",_category,_id];
	if (_upCode isEqualTo {} && _downCode isEqualTo {}) then
	{
		throw format["Keybind %1 (%2) needs to have code assigned to it!",_category,_id];
	};
	if !(_downCode isEqualTo {}) then
	{
		_downHashArray = [_downCode,_default];
		ExileLifeKeybindsDown setVariable [_hash,_downHashArray];
		ExileLifeActiveKeyDown pushbackUnique _hash;
	};
	if !(_upCode isEqualTo {}) then
	{
		_upHashArray = [_upCode,_default];
		ExileLifeKeybindsUp setVariable [_hash,_upHashArray];
		ExileLifeActiveKeyUp pushbackUnique _hash;
	};
	(ExileLifeKeybindActiveBinds select 0) pushbackUnique _category;
	(ExileLifeKeybindActiveBinds select 1) pushbackUnique _id;
	if !(_temporary) then
	{
		profileNameSpace setVariable ["ExileLifeKeybinds",_keybinds];
		saveProfileNameSpace;
	};
}
catch
{
	systemChat _exception;
	_hash = false;
};
_hash
