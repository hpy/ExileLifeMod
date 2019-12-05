/**
                    * ExileClientOverwrites_object_player_event_onHit
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

                    private["_unit","_causedBy","_damage","_instigator"];
_unit = _this select 0;
_causedBy = _this select 1;
_damage = _this select 2;
_instigator = _this select 3;
[_damage * 10] call BIS_fnc_bloodEffect;
ExileClientPlayerIsInCombat = true;
ExileClientPlayerLastCombatAt = diag_tickTime;
true call ExileClient_gui_hud_toggleCombatIcon;
