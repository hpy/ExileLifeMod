/**
                    * ExilelifeClient_util_playerCargo_contains
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

                    private["_player","_itemClassName","_cargo"];
_player = _this select 0;
_itemClassName = toLower (_this select 1);
_cargo = _player call ExileClient_util_playerCargo_list;
_cargo = _cargo call ExileClient_util_array_toLower;
(_itemClassName in _cargo)