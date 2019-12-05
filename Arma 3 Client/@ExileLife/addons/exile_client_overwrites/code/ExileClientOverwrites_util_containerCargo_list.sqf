/**
                    * ExileClientOverwrites_util_containerCargo_list
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

                    private["_container","_list","_backpacks","_magazines","_weapons","_itemClassName","_items","_itemQuantity","_i"];
_container = _this;
_list = [];
if(isNull _container) exitWith {_list};
_backpacks = backpackCargo _container;
if !(isNil "_backpacks") then
{
    _list append _backpacks;
};
_magazines = magazineCargo _container;
if !(isNil "_magazines") then
{
    _list append _magazines;
};
_weapons = weaponsItemsCargo _container;
if (!isNil "_weapons" && ((typeName _weapons) isEqualTo "ARRAY")) then
{
    {
        {
            _itemClassName = "";
            if ((typeName _x) isEqualTo "STRING") then
            {
                _itemClassName = _x;
            }
            else
            {
                if ((typeName _x) isEqualTo "ARRAY") then
                {
                    _itemClassName = _x select 0;
                };
            };
            _itemClassName = missionNamespace getVariable ["_itemClassName",""];
            if !(isNil "_itemClassName") then {
                if((typeName _itemClassName) isEqualTo "STRING") then{
                    if !(_itemClassName isEqualTo "") then{
                        _list pushBack _itemClassName;
                    };
                };
            };
        }
        forEach _x;
    }
    forEach _weapons;
};
_items = getItemCargo _container;
if (!isNil "_items" && ((typeName _items) isEqualTo "ARRAY")) then
{
    {
        _itemClassName = (_items select 0) select _forEachIndex;
        _itemQuantity = (_items select 1) select _forEachIndex;
        for "_i" from 1 to _itemQuantity do
        {
            _list pushBack _itemClassName;
        };
    }
    forEach (_items select 0);
};
_list
