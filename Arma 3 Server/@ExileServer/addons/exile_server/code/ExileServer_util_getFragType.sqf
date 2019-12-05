/**
                    * ExileServer_util_getFragType
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

                    private["_victim","_killer","_killingPlayer","_instigator","_type","_victimClanId","_killerClanId","_victimGang","_killerGang","_killerPosGangTerritory","_victimPosGangTerritory"];
_victim = _this select 0;
_killer = _this select 1;
_killingPlayer = _this select 2;
_instigator = _this select 3;
_type = 0;
try
{
	if (_victim getVariable ["ExileLifeClientUnconscious", false]) then
	{
		if (currentWeapon  _killer == "ExileLife_Weapon_Taser") then
		{
			throw 7;
		};
	};
	if (_victim getVariable ['ExileLifeClientReviveState', 0] == 4) then
	{
		if(_victim getVariable ['ExileLifeClientReviveMedic', objNull] == _killingPlayer)then{
			throw 12;
		};
	};
	if (_victim getVariable ["IsPlayingRussianRoulette", false]) then
	{
		throw 2; 
	};
	if (_victim isEqualTo _killer) then
	{
		throw 1; 
	};
	if ((vehicle _victim) isEqualTo _killer) then
	{
		throw 3; 
	};
	if (isNull _instigator) then
	{
		throw 0; 
	};
	if (isNull _killer) then
	{
		throw 0;
	};
	if (isNull _killingPlayer) then
	{
		throw 4; 
	};
	if ((group _victim) isEqualTo (group _killingPlayer)) then
	{
		throw 5;
	};
	_victimClanId = _victim getVariable ["ExileClanID", -2];
	_killerClanId = _killer getVariable ["ExileClanID", -3];
	if (!(_victimClanId isEqualTo -1) && (_victimClanId isEqualTo _killerClanId)) then
	{
		throw 5;
	};
	_victimGang = _victim getVariable ['ExileLifeClientGang', ""];
	_killerGang = _killer getVariable ['ExileLifeClientGang', ""];
	if (!(_victimGang isEqualTo "") && (_victimGang isEqualTo _killerGang) && !(_killerGang isEqualTo "Rogue")) then
	{
		throw 5;
	};
	_killerPosGangTerritory = [_killer] call ExileLifeClient_util_world_findGangTerritory; 
	_victimPosGangTerritory = [_victim] call ExileLifeClient_util_world_findGangTerritory; 
	if ((_victimPosGangTerritory isEqualTo "none") && (_killerPosGangTerritory isEqualTo _killerGang)) then
	{
		throw 9; 
	};
	if ((_killerPosGangTerritory isEqualTo "none") && (_victimGang isEqualTo _victimPosGangTerritory)) then
	{
		throw 10; 
	};
	if (_victim getVariable ["ExileIsBambi", false]) then
	{
		throw 6;
	};
	throw 7;
}
catch
{
	_type = _exception;
};
_type
