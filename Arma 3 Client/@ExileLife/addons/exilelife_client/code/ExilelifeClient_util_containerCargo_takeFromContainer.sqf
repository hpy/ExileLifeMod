/**
                    * ExilelifeClient_util_containerCargo_takeFromContainer
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

                    private["_containerFrom","_containerTo","_itemClassName","_transferred","_containerFromCargo","_item","_magazines","_weapons","_items","_subContainers","_content","_currentWeaponIndex","_weapon","_weaponItemClassName","_itemQuantity"];
_containerFrom = _this select 0;
_containerTo = _this select 1;
_itemClassName = _this select 2;
_transferred = false;
_containerFromCargo = _containerFrom call ExileClient_util_containerCargo_serialize;
_item = [];
try 
{
	_magazines = _containerFromCargo select 0;
	_weapons = _containerFromCargo select 1;
	_items = _containerFromCargo select 2;
	_subContainers = _containerFromCargo select 3;
	{
		if ((_x select 0) isEqualTo _itemClassName) then
		{
			_item = [_itemClassName,_x select 1];
			_subContainers deleteAt _forEachIndex;
			_content = [_magazines, _weapons, _items, _subContainers];
			throw true;
		};
	}
	forEach _subContainers;
	{
		if ((_x select 0) isEqualTo _itemClassName) then
		{
			_item = [_itemClassName,_x select 1];
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
			if (typeName _x isEqualTo "ARRAY") then 
			{
				_weaponItemClassName = _x select 0;
			}
			else 
			{
				_weaponItemClassName = _x;
			};
			if (_weaponItemClassName isEqualTo _itemClassName) then
			{
				_item = [_itemClassName,1];
				_weapon set [_forEachIndex, ""];
				_weapons set [_currentWeaponIndex, _weapon];
				_content = [_magazines, _weapons, _items, _subContainers];
				throw true;
			};
		}
		forEach _weapon;
	}
	forEach _weapons;
	{
		if ((_x select 0) isEqualTo _itemClassName) then
		{
			_itemQuantity = _x select 1;
			_item = [_itemClassName,_itemQuantity];
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
	_transferred = _exception;
	if (_transferred) then
	{
		_containerFrom call ExileClient_util_containerCargo_clear;
		[_containerFrom, _containerFromCargo] call ExileClient_util_containerCargo_deserialize;
		[_containerTo,_item select 0, _item select 1] call ExileLifeClient_util_playerCargo_addOrDrop;	
	};
};
_transferred