/**
                    * ExilelifeClient_util_containerCargo_removeMultiple
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

                    private["_container","_itemClassName","_quantity","_removed","_contains","_containerCargo","_magazines","_weapons","_items","_subContainers","_count","_tempArray","_completed","_itemQuantity"];
_container = _this select 0;
_itemClassName = param[1,""];
_quantity = _this select 2;
_removed = false;
if(_itemClassName isEqualTo "")exitWith{_removed};
_contains = [_container, _itemClassName,_quantity] call ExileLifeClient_util_containerCargo_containsQuantity;
if !(_contains) exitWith {_removed};
_containerCargo = _container call ExileClient_util_containerCargo_serialize;
try 
{
	_magazines = _containerCargo select 0;
	_weapons = _containerCargo select 1;
	_items = _containerCargo select 2;
	_subContainers = _containerCargo select 3;
	_count = 0;
	_tempArray = [];
	_completed = false;
	{
		if (((_x select 0) isEqualTo _itemClassName) && (_count < _quantity)) then
		{
			_count = _count + 1;
			_tempArray deleteAt _forEachIndex;
			if (_count isEqualTo _quantity) then
			{
				_completed = true;
			};
		}
		else
		{
			_tempArray pushBack _x;
		};
	}
	forEach _subContainers;
	if (_completed) then
	{
		_containerCargo = [_magazines, _weapons, _items, _tempArray];
		throw true;	
	};
	_count = 0;
	_tempArray = [];
	_completed = false;
	{
		if (((_x select 0) isEqualTo _itemClassName) && (_count < _quantity)) then
		{
			_count = _count + 1;
			_tempArray deleteAt _forEachIndex;
			if (_count isEqualTo _quantity) then
			{
				_completed = true;
			};
		}
		else
		{
			_tempArray pushBack _x;
		};
	}
	forEach _magazines;
	if (_completed) then
	{
		_containerCargo = [_tempArray, _weapons, _items, _subContainers];
		throw true;	
	};
	{
		if ((_x select 0) isEqualTo _itemClassName) then
		{
			_itemQuantity = _x select 1;
			if (_itemQuantity < _quantity) then
			{
				throw false;
			};
			_items set [_forEachIndex, [_x select 0, _itemQuantity - _quantity]];
			_containerCargo = [_magazines, _weapons, _items, _subContainers];
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