/**
                    * ExilelifeClient_object_player_event_onDammaged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_unit","_selectionName","_amountOfDamage","_hitPartIndex","_hitPoint","_instigator","_projectile","_victimReviveState","_result"];
_unit = _this select 0;
_selectionName = _this select 1;
_amountOfDamage = _this select 2;
_hitPartIndex = _this select 3;
_hitPoint = _this select 4;
_instigator = _this select 5;
_projectile = _this select 6;
_victimReviveState = player getVariable ['ExileLifeClientIncapacitated', false];
if (local _unit && alive _unit && !_victimReviveState && (_amountOfDamage >= 0.95) &&  (_hitPoint == "Incapacitated")) then{
		player setDamage 0.001;
		if !((vehicle _unit) isEqualTo _unit) then
		{
			unassignVehicle _unit;
			player action ["GetOut", vehicle _unit];
			player action ["Eject", vehicle _unit];
		};
		player allowDamage false;
		_result = [_unit,_instigator,_instigator] call ExileLifeClient_object_player_death_onIncapacitated;
};
