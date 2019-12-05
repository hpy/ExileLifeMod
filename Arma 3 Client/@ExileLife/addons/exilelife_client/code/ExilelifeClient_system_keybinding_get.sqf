/**
                    * ExilelifeClient_system_keybinding_get
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_category","_id","_key","_keybinds","_index","_actions","_actionIndex"];
_category = _this select 0;
_id = _this select 1;
_key = [];
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
	_key = ((_actions select 1) select _actionIndex) select 2;
}
catch
{
	systemchat _exception;
};
_key