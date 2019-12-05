/**
                    * ExileClientOverwrites_object_player_event_onHandleDamage
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

                    private["_unit","_selectionName","_amountOfDamage","_sourceOfDamage","_typeOfProjectile","_hitPartIndex","_instigator","_hitPoint","_result","_victimReviveState","_damageVehicle","_damagePoint","_bleedoutTime"];
_unit = _this select 0;
_selectionName = _this select 1;
_amountOfDamage = _this select 2; 
_sourceOfDamage = _this select 3;
_typeOfProjectile = _this select 4;
_hitPartIndex = _this select 5;
_instigator = _this select 6;
_hitPoint = _this select 7;
_result = true;
try
{
	if(!alive _unit)then{
		throw false;
	};
	if(lifeState _unit == "Incapacitated")then{
		throw false;
	};
	_victimReviveState = _unit getVariable ['ExileLifeClientIncapacitated', false];
	if(_victimReviveState)then{
		throw false;
	};
	if (_typeOfProjectile == "ExileLife_Ammo_Taser") then{
		[60] call ExileLifeClient_object_player_event_onKnockOut;
		throw false;
	};
	if ((vehicle _unit) isEqualTo _unit) then{
		_damageVehicle = ['LandVehicle', 'Ship', 'Air'] findIf {vehicle _sourceOfDamage isKindOf _x };
		switch (_damageVehicle) do {
		    case 0: {
				_damagePoint = "hitLegs"; 
			};
			case 1: {
				_damagePoint = "hitLegs"; 
			};
			case 2: {
				_damagePoint = "hitArms"; 
			};
			default {
				_damagePoint = "";
			};
		};
		if (_damageVehicle != -1) then{
			diag_log "DEBUG: You were hit by a vehicle!";
			player setHitPointDamage [_damagePoint,_amountOfDamage];
			throw false;
		};
	};
	switch (_selectionName) do {
		case "": {_amountOfDamage = 0;}; 
		case "face_hub": { _amountOfDamage = 0.95 min _amountOfDamage; }; 
		case "neck": {_amountOfDamage = 0.95 min _amountOfDamage;}; 
		case "head": {_amountOfDamage = 0.95 min _amountOfDamage;}; 
		case "pelvis": {_amountOfDamage = 0.95 min _amountOfDamage;}; 
		case "spine1": {_amountOfDamage = 0.95 min _amountOfDamage;}; 
		case "spine2": {_amountOfDamage = 0.95 min _amountOfDamage;}; 
		case "spine3": {_amountOfDamage = 0.95 min _amountOfDamage;}; 
		case "body": {_amountOfDamage = 0.95 min _amountOfDamage;}; 
		case "arms": { }; 
		case "hands": { }; 
		case "legs": { }; 
		default {_amountOfDamage = 0;};
	};
}
catch
{
	_result = _exception;
};
if (_result) then
{
	_bleedoutTime = _amountOfDamage * 100;
	if (ExileLifeClientPlayerIsBleeding && (handleDamageDelay < time)) then{diag_log "9";
		handleDamageDelay = time + 2;
		ExileLifeClientBleedingCountDownEnd = ExileLifeClientBleedingCountDownEnd + _bleedoutTime;
		ExileLifeClientBleedOutRate = ExileLifeClientBleedOutRate + (_amountOfDamage/300);
	}else{
		handleDamageDelay = time + 2;
		[100] call BIS_fnc_bloodEffect;
		[time + _bleedoutTime] call ExileLifeClient_object_player_injury_blood_toggleBleeding;
	};
}else{
	_amountOfDamage = 0.001;
};
_amountOfDamage
