/**
                    * ExileClientOverwrites_object_player_event_onFIredNear
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

                    private["_unit","_firer","_distance","_weapon","_ammo","_putInCombat"];
_unit = _this select 0;
_firer = _this select 1;
_distance = _this select 2;
_weapon = _this select 3;
_ammo = _this select 6;
_putInCombat = true;
if (_weapon in ["Put", "Throw", "Exile_Melee_Axe", "Exile_Melee_SledgeHammer", "Exile_Melee_Shovel", "ExileLife_Melee_PickAxe", "ExileLife_Melee_GardenHoe", "ExileLife_Melee_Guitar"]) then
{
	_putInCombat = false;
};
if (ExilePlayerInSafezone) then
{
	_putInCombat = false;
};
if (_putInCombat) then
{
	ExileClientPlayerIsInCombat = true;
	ExileClientPlayerLastCombatAt = diag_tickTime;
	true call ExileClient_gui_hud_toggleCombatIcon;
	if !(_unit isEqualTo _firer) then 
	{
		[_weapon, _ammo] call ExileLifeClient_object_player_event_handleHearingLoss;
	};
};
true