/**
                    * ExilelifeClient_object_player_event_network_meleeResponse
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

                    private["_amountOfDamage","_hitPoint","_ammo","_currentDamage","_newDamage","_bleedoutTime"];
_amountOfDamage = _this select 0;
_hitPoint = _this select 1;
_ammo = _this select 2;
[100] call BIS_fnc_bloodEffect;
_currentDamage = player getHitPointDamage _hitPoint;
_newDamage = _currentDamage + _amountOfDamage; 
if (_newDamage > 1.0) then 
{
	_newDamage = 1.0;
};
if ((_hitPoint == "HitHead") && (getNumber (configFile >> "cfgAmmo" >> _ammo >> "knockout")==1)) then 
{
	if ((floor(random 10)) <= (_newDamage*10)) then 
	{
		[60*_newDamage] call ExileLifeClient_object_player_event_onKnockOut;
	};
};
player setHitPointDamage [_hitPoint, _newDamage];
_bleedoutTime = _newDamage*30; 
if ((_bleedoutTime > 0) && (getNumber (configFile >> "cfgAmmo" >> _ammo >> "bleeding")==1)) then 
{
	if (ExileLifeClientPlayerIsBleeding) then
	{
		ExileLifeClientBleedingCountDownEnd = ExileLifeClientBleedingCountDownEnd + _bleedoutTime;
		ExileLifeClientBleedOutRate = ExileLifeClientBleedOutRate + (_newDamage/300); 
		throw false;
	}
	else 
	{
		ExileLifeClientBleedOutRate = ExileLifeClientBleedOutRate + (_amountOfDamage/300); 
		ExileLifeClientPlayerIsBleeding = true;
		ExileLifeClientBleedingCountDownEnd = time + _bleedoutTime;
		player setVariable ["ExileLifeClientBleeding",true,true];
		true call ExileLifeClient_gui_hud_toggleBleedingIcon;
	};
};