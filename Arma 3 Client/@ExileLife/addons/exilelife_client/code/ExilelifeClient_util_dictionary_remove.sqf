/**
                    * ExilelifeClient_util_dictionary_remove
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

                    private["_dictionary","_itemToRemove","_items","_values","_index"];
_dictionary = _this select 0;
_itemToRemove = (_this select 1) select 0;
_items = _dictionary select 0;
_values = _dictionary select 1;
if (_items isEqualTo []) exitWith { _dictionary };
_index = _items find _itemToRemove;
if (_index isEqualto -1) exitWith { _dictionary };
_values deleteAt _index;
_items deleteAt _index;
_dictionary