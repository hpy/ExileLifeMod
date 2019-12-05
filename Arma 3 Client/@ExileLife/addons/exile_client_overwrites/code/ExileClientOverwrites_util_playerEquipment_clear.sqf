/**
                    * ExileClientOverwrites_util_playerEquipment_clear
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

                    {_this removeWeaponGlobal _x} forEach weapons _this;
{_this unlinkItem _x;} forEach assignedItems _this;
removeGoggles _this;
removeHeadgear _this;