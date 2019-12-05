/**
                    * ExilelifeClient_system_keybinding_remove
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_category","_id","_keybinds","_index","_actions","_actionIndex","_i"];
_category = _this select 0;
_id = _this select 1;
try
{
	if (_category isEqualTo "") then
	{
		throw "Category cannot be blank!"
	};
	if (_id isEqualTo "") then
	{
		throw "ID cannot be blank!";
	};
	_keybinds = profileNameSpace getVariable ["ExileLifeKeybinds",nil];
	if (isNil "_keybinds") then
	{
		throw "Keybinds registry does not exist!";
	};
	_index = (_keybinds select 0) find _category;
	if !(_index > -1) then
	{
		throw format["Registry for category %1 does not exist!",_category];
	};
	_actions = (_keybinds select 1) select _index;
	if (isNil "_actions") then
	{
		throw format["No keybinds found for category %1",_category];
	};
	_actionIndex = (_actions select 0) find _id;
	if !(_actionIndex > -1) then
	{
		throw format["Action with ID %1 does not exist!",_id];
	};
	for "_i" from 0 to 2 do
	{
		(_actions select _i) deleteAt _actionIndex;
	};
	if (count(_actions) isEqualTo 0) then
	{
		(_keybinds select 0) deleteAt _index;
		(_keybinds select 1) deleteAt _index;
	};
	profileNameSpace setVariable ["ExileLifeKeybinds",_keybinds];
	saveProfileNameSpace;
}
catch
{
	_exception call ExileLifeClient_util_log;
};