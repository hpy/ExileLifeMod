/**
                    * ExileClientOverwrites_util_containerCargo_remove
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

                    private["_container","_itemClassName","_removed","_containerCargo","_magazines","_weapons","_items","_subContainers","_content","_currentWeaponIndex","_weapon","_weaponItemClassName","_itemQuantity"];
_container = _this select 0;
_itemClassName = param[1,""];
_removed = false;
if(_itemClassName isEqualTo "")exitWith{_removed};
_containerCargo = _container call ExileClient_util_containerCargo_serialize;
_itemClassName = toLower _itemClassName;
try 
{
	_magazines = _containerCargo select 0;
	_weapons = _containerCargo select 1;
	_items = _containerCargo select 2;
	_subContainers = _containerCargo select 3;
	{
		if ((_x select 0) == _itemClassName) then
		{
			_subContainers deleteAt _forEachIndex;
			_content = [_magazines, _weapons, _items, _subContainers];
			throw true;
		};
	}
	forEach _subContainers;
	{
		if ((_x select 0) == _itemClassName) then
		{
			_magazines deleteAt _forEachIndex;
			_content = [_magazines, _weapons, _items, _subContainers];
			throw true;
		};
	}
	forEach _magazines;
	{
		_currentWeaponIndex = _forEachIndex;
		_weapon = _x;
		{
			_weaponItemClassName = "";
			if (typeName _x == "ARRAY") then 
			{
				_weaponItemClassName = _x select 0;
			}
			else 
			{	
				if (typeName _x == "STRING") then{
					_weaponItemClassName = _x;
				};
			};
			if (_weaponItemClassName == _itemClassName) then
			{
				_weapon set [_forEachIndex, ""];
				_weapons set [_currentWeaponIndex, _weapon];
				_content = [_magazines, _weapons, _items, _subContainers];
				throw true;
			};
		}forEach _weapon;
	}
	forEach _weapons;
	{
		if ((_x select 0) == _itemClassName) then
		{
			_itemQuantity = _x select 1;
			if (_itemQuantity isEqualTo 1) then
			{
				_items deleteAt _forEachIndex;
			}
			else 
			{
				_items set [_forEachIndex, [_x select 0, (_x select 1) - 1]];
			};
			_content = [_magazines, _weapons, _items, _subContainers];
			throw true;
		};
	}
	forEach _items;
}
catch 
{
	_container call ExileClient_util_containerCargo_clear;
	[_container, _containerCargo] call ExileClient_util_containerCargo_deserialize;
	_removed = _exception;
};
_removed
