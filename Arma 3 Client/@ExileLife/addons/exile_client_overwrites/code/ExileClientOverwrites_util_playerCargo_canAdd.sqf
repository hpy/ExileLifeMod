/**
                    * ExileClientOverwrites_util_playerCargo_canAdd
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

                    private["_player","_itemClassName","_canAdd","_itemInformation","_itemCategory","_itemType"];
_player = _this select 0;
_itemClassName = _this select 1;
_canAdd = false;
try
{
	_itemInformation = [_itemClassName] call BIS_fnc_itemType;
	_itemCategory = _itemInformation select 0;
	_itemType = _itemInformation select 1;
	switch (_itemType) do
	{
		case "UnknownEquipment":
		{
			if ("armband" in (toLower _itemClassName splitString "_")) then
			{
				throw false;
			};
		};
		case "NVGoggles":
		{
			if !(_player getVariable ["ExileLifeClient:Guard",false]) then
    		{
				throw false;
			};
		};
	};
	if (_player canAddItemToUniform _itemClassName) then
	{
		throw true;
	};
	if (_player canAddItemToVest _itemClassName) then
	{
		throw true;
	};
	if (_player canAddItemToBackpack _itemClassName) then
	{
		throw true;
	};
	if ([_player, _itemClassName] call ExileClient_util_playerEquipment_canAdd) then
	{
		throw true;
	};
}
catch
{
	_canAdd = _exception;
};
_canAdd
