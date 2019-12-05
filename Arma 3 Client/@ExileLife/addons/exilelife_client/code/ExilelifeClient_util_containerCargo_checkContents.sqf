/**
                    * ExilelifeClient_util_containerCargo_checkContents
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

                    private["_container","_items","_contents","_result","_contains","_item","_quantity"];
_container = _this select 0; 
_items = _this select 1;
_contents = []; 
_result = false; 
_contains = true;
_contents = _container call ExileClient_util_containerCargo_list; 
{ 
  _item = _x select 0; 
  _quantity = _x select 1; 
  if (({_x == _item} count _contents) < _quantity) exitWith 
  {
    _contains = false;
  }; 
  if (_contains) exitWith 
  {
    _result = true;
  }; 
}forEach _items;
_result