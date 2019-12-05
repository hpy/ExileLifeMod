/**
                    * ExilelifeClient_util_item_transferContents
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_object","_toClassname","_fromClassname","_newClassname","_result","_amountNeeded","_magazines","_oldQuantity","_newAmount","_itemDisplayName","_remove","_emptyClassname"];
_object = _this select 0;
_toClassname = _this select 1; 
_fromClassname = _this select 2; 
_newClassname = _this select 3; 
_result = false;
_amountNeeded = getNumber(configFile >> "CfgMagazines" >> _toClassname >> "count");
_magazines = magazinesAmmo player;
try
{
	{
		if ((_x select 0) isEqualTo _fromClassname) then
		{
			_oldQuantity = (_x select 1);
			_newAmount = _oldQuantity - _amountNeeded;
			if !(_newAmount < 0) then
			{
				_result = true;
			};
		};
		if(_result) exitWith {};
	}
	forEach _magazines;
	if !(_result) then
	{
		_itemDisplayName = getText(configFile >> "CfgMagazines" >> _fromClassname >> "displayName");
		throw format ["You do not have any %1",_itemDisplayName];
	};	
	_result = false;
	if (_newAmount < 1) then
	{
		_remove = [player, _fromClassname] call ExileClient_util_playerCargo_remove;
		if !(_remove) then
		{
			throw "Something or somebody did a whoopsie!";
		};
		_emptyClassname = getText(configFile >> "CfgMagazines" >> _fromClassname >> "emptyclassname");
		if (_emptyClassname isEqualTo "") then
		{
			throw "There is no empty equivalent of this";
		};
		[player, _emptyClassname] call ExileLifeClient_util_playerCargo_addOrDrop;
		_result = true;
	}
	else
	{
		_result = 
		[
			player,
			[_fromClassname,_oldQuantity], 
			[_fromClassname,_newAmount] 
		] call ExileClient_util_inventory_replaceMagazine;
	};
	if !(_result) then
	{
		throw "Error updating the contents of the container we are filling from";
	};
	_result = [player, _toClassname] call ExileClient_util_playerCargo_remove;
	if !(_result) then
	{
		throw "Error removing empty container from inventory";
	};
	[player, _newClassname] call ExileLifeClient_util_playerCargo_addOrDrop;
}
catch
{
	["ErrorTitleAndText", ["ERROR!",_exception]] call ExileClient_gui_toaster_addTemplateToast;
};
_result
