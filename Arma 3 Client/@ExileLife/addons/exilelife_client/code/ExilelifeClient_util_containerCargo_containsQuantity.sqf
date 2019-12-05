/**
                    * ExilelifeClient_util_containerCargo_containsQuantity
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

                    private["_container","_itemClassName","_quantity","_contains","_cargo"];
_container = _this select 0;
_itemClassName = toLower (_this select 1);
_quantity = _this select 2;
_contains = false;
_cargo = _container call ExileClient_util_containerCargo_list;
_cargo = _cargo call ExileClient_util_array_toLower;
if !(({_x == _itemClassName} count _cargo) < _quantity) then 
{
	_contains = true;
}; 
_contains