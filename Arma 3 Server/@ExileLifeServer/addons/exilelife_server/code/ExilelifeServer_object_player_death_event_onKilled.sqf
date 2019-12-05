/**
                    * ExilelifeServer_object_player_death_event_onKilled
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

                    private["_victim","_killer","_instigator","_countDeath","_countKill","_killSummary","_killingPlayer","_victimPID","_victimSessionID","_killerPID","_killerSessionID","_killType","_killerPosition","_killerGang","_victimPosition","_victimGang","_oldVictimRespect","_newVictimRespect","_oldKillerRespect","_update","_newKillerRespect","_unknownReasons","_systemChat","_modifyVictimRespect","_respectLoss","_perks","_minRespectTransfer","_respectTransfer","_perkNames","_victimPosGangTerritory","_killerPosGangTerritory","_killerStatsNeedUpdate","_newKillerFrags","_victimStatsNeedUpdate","_newVictimDeaths"];
_victim = _this select 0;
_killer = _this select 1;
_instigator = _this select 2;
if (!isServer || hasInterface || isNull _victim) exitWith {};
if !(isPlayer _victim) exitWith {};
_victim setVariable ["ExileName", ([_victim] call ExileLifeClient_util_player_name), true];
_countDeath = false;
_countKill = false;
_killSummary = [];
_killingPlayer = _killer call ExileServer_util_getFragKiller;
_victimPID = _victim getVariable ["ExileDatabaseId",-1];
_victimSessionID = _victimPID call ExileLifeServer_system_session_getIDfromDBID;
_killerPID = _killingPlayer getVariable ["ExileDatabaseId", -1];
_killerSessionID = _killerPID call ExileLifeServer_system_session_getIDfromDBID;
_killType = [_victim, _killer, _killingPlayer, _instigator] call ExileServer_util_getFragType;
_killerPosition = getPosATL _killer; 
_killerGang = _killer getVariable ['ExileLifeClientGang', ""];
_victimPosition = getPosATL _victim;
_victimGang = _victim getVariable ['ExileLifeClientGang', ""];
_oldVictimRespect = _victim getVariable ["ExileScore", 0];
_newVictimRespect = _oldVictimRespect;
_oldKillerRespect = 0;
_update = [_victim] call ExileLifeServer_object_player_database_ExilelifeUpdate; 
if !(isNull _killingPlayer) then
{
	_oldKillerRespect = _killingPlayer getVariable ["ExileScore", 0];
};
_newKillerRespect = _oldKillerRespect;
switch (_killType) do
{
	default 
	{
		_unknownReasons =
		[
			"%1 died because... Arma.",
			"%1 died because the universe hates him.",
			"%1 died a mysterious death.",
			"%1 died and nobody knows why.",
			"%1 died because that's why.",
			"%1 died because %1 was very unlucky.",
			"%1 died due to Arma bugs and is probably very salty right now.",
			"%1 died an awkward death.",
			"%1 died. Yes, %1 is dead. Like really dead-dead."
		];
		_countDeath = true;
		_systemChat = format [selectRandom _unknownReasons, ([_victim] call ExileLifeClient_util_player_name)];
		_newVictimRespect = _oldVictimRespect - round ((abs _oldVictimRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "unlucky")));
	};
	case 1:
	{
		_countDeath = true;
		_modifyVictimRespect = true;
		_systemChat = format ["%1 commited suicide!", ([_victim] call ExileLifeClient_util_player_name)];
		_newVictimRespect = _oldVictimRespect - round ((abs _oldVictimRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "suicide")));
	};
	case 2:
	{
		_countDeath = true;
		_countKill = false;
		_systemChat = format ["%1 died while playing Russian Roulette!", ([_victim] call ExileLifeClient_util_player_name)];
		_newVictimRespect = _oldVictimRespect;
		_victim call ExileServer_system_russianRoulette_event_onPlayerDied;
	};
	case 3:
	{
		_countDeath = true;
		_countKill = false;
		_systemChat = format ["%1 crashed to death!",([_victim] call ExileLifeClient_util_player_name)];
		_newVictimRespect = _oldVictimRespect - round ((abs _oldVictimRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "crash")));
	};
	case 4:
	{
		_countDeath = true;
		_countKill = false;
		_systemChat = format ["%1 was killed by an NPC!", ([_victim] call ExileLifeClient_util_player_name)];
		_newVictimRespect = _oldVictimRespect - round ((abs _oldVictimRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "npc")));
	};
	case 5: 
	{
		_countDeath = true;
		_countKill = false;
		_systemChat = format ["%1 was team-killed by %2!", ([_victim] call ExileLifeClient_util_player_name), ([_killingPlayer] call ExileLifeClient_util_player_name)];
		_respectLoss = round ((abs _oldKillerRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "friendyFire")));
		_newKillerRespect = _oldKillerRespect - _respectLoss;
		_killSummary pushBack ["FRIENDLY FIRE", -1 * _respectLoss];
	};
	case 9: 
	{
		_countDeath = true;
		_countKill = false;
		_systemChat = format ["%1 was murdered by the coward %2!", ([_victim] call ExileLifeClient_util_player_name),([_killingPlayer] call ExileLifeClient_util_player_name)];
		_respectLoss = round ((abs _oldKillerRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "safeNSound")));
		_newKillerRespect = _oldKillerRespect - _respectLoss;
		_killSummary pushBack ["COWARDLY KILL", -1 * _respectLoss];
	};
	case 10: 
	{
		_countDeath = true;
		_countKill = false;
		_systemChat = format ["%1 was murdered by camping scum %2!", ([_victim] call ExileLifeClient_util_player_name), ([_killingPlayer] call ExileLifeClient_util_player_name)];
		_respectLoss = round ((abs _oldKillerRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "campingTerritory")));
		_newKillerRespect = _oldKillerRespect - _respectLoss;
		_killSummary pushBack ["CAMPING KILL", -1 * _respectLoss];
	};
	case 6:
	{
		_countDeath = false;
		_countKill = false;
		_systemChat = format ["%1 was killed by %2! (BAMBI SLAYER)", ([_victim] call ExileLifeClient_util_player_name), ([_killingPlayer] call ExileLifeClient_util_player_name)];
		_respectLoss = round ((abs _oldKillerRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "bambiKill")));
		_newKillerRespect = _oldKillerRespect - _respectLoss;
		_killSummary pushBack ["BAMBI SLAYER", -1 * _respectLoss];
	};
    case 12:
	{
		_countDeath = true;
		_countKill = true;
		_systemChat = format ["%1 was killed by %2! (MURDER)", ([_victim] call ExileLifeClient_util_player_name), ([_killingPlayer] call ExileLifeClient_util_player_name)];
		_respectLoss = round ((abs _oldKillerRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "smotherKill")));
		_newKillerRespect = _oldKillerRespect - _respectLoss;
		_killSummary pushBack ["MURDER", -1 * _respectLoss];
	};
	case 7:
	{
		_countDeath = true;
		_countKill = true;
		_perks = [_victim, _killer, _killingPlayer] call ExileServer_util_getFragPerks;
		if ((currentWeapon _killingPlayer) isKindOf ["ExileLife_Weapon_Taser", configFile >> "CfgWeapons"]) then
		{
			if (_killer getVariable ["ExileLifeClient:Guard",false]) then
			{
				_systemChat = format ["%1 died from guard brutality! RISE UP, RESIST!", ([_victim] call ExileLifeClient_util_player_name)];
			};
		};
		if ((_victimGang isEqualTo "Rogue") && !(_killerGang isEqualTo "Rogue")) then
		{
			_minRespectTransfer = getNumber (configFile >> "CfgSettings" >> "Respect" >> "killingRoguesMinRespectTransfer");
		}
		else
		{
			if ((_killerGang isEqualTo "Rogue") && !(_victimGang isEqualTo "Rogue")) then
			{
				_minRespectTransfer = getNumber (configFile >> "CfgSettings" >> "Respect" >> "rogueKillingGangMembersMinRespectTransfer");
			}
			else
			{
				_minRespectTransfer = getNumber (configFile >> "CfgSettings" >> "Respect" >> "minRespectTransfer");
			};
		};
		_respectTransfer = round ((abs _oldVictimRespect) / 100 * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Percentages" >> "frag")));
		if (_respectTransfer < _minRespectTransfer) then
		{
			_respectTransfer = _minRespectTransfer;
		};
		_newVictimRespect = _oldVictimRespect - _respectTransfer;
		_newKillerRespect = _oldKillerRespect + _respectTransfer;
		_killSummary pushBack ["ENEMY FRAGGED", _respectTransfer];
		if (_perks isEqualTo []) then
		{
			_systemChat = format ["%1 was killed by %2!", ([_victim] call ExileLifeClient_util_player_name), ([_killingPlayer] call ExileLifeClient_util_player_name)];
		}
		else
		{
			_perkNames = [];
			{
				_perkNames pushBack (_x select 0);
				_killSummary pushBack _x;
				_newKillerRespect = _newKillerRespect + (_x select 1);
			}
			forEach _perks;
			_systemChat = format ["%1 was killed by %2! (%3)", ([_victim] call ExileLifeClient_util_player_name), ([_killingPlayer] call ExileLifeClient_util_player_name), _perkNames joinString ", "];
		};
		_victimPosGangTerritory = [_victim] call ExileLifeClient_util_world_findGangTerritory;
		if ((_victimPosGangTerritory isEqualTo "Guard") && !(_killerGang isEqualTo "Guard")) then
		{
		}
		else
		{
			_killerPosGangTerritory = [_victim] call ExileLifeClient_util_world_findGangTerritory;
			if (!(_victimPosGangTerritory isEqualTo "None") && !(_killerGang isEqualTo _victimPosGangTerritory)) then
			{
			};
		};
	};
};
if !(isNull _killingPlayer) then
{
	if !(_killSummary isEqualTo []) then
	{
		[_killingPlayer, "showFragRequest", [_killSummary]] call ExileServer_system_network_send_to;
	};
};
if !(isNull _killingPlayer) then
{
	_killerStatsNeedUpdate = false;
	if (_countKill) then
	{
		_newKillerFrags = _killingPlayer getVariable ["ExileKills", 0];
		_newKillerFrags = _newKillerFrags + 1;
		_killerStatsNeedUpdate = true;
		_killingPlayer setVariable ["ExileKills", _newKillerFrags];
		format["addAccountKill:%1",_killerPID] call ExileServer_system_database_query_fireAndForget;
	};
	if !(_newKillerRespect isEqualTo _oldKillerRespect) then
	{
		_killingPlayer setVariable ["ExileScore", _newKillerRespect];
		_killerStatsNeedUpdate = true;
		format["setAccountScore:%1:%2", _newKillerRespect, _killerPID] call ExileServer_system_database_query_fireAndForget;
	};
	if (_killerStatsNeedUpdate) then
	{
		_killingPlayer call ExileServer_object_player_sendStatsUpdate;
	};
};
_victimStatsNeedUpdate = false;
if (_countDeath) then
{
	_newVictimDeaths = _victim getVariable ["ExileDeaths", 0];
	_newVictimDeaths = _newVictimDeaths + 1;
	_victim setVariable ["ExileDeaths", _newVictimDeaths];
	_victimStatsNeedUpdate = true;
	format["addAccountDeath:%1",_victimPID] call ExileServer_system_database_query_fireAndForget;
	_victim call ExileServer_object_player_sendStatsUpdate;
};
if !(_newVictimRespect isEqualTo _oldVictimRespect) then
{
	_victim setVariable ["ExileScore", _newVictimRespect];
	_victimStatsNeedUpdate = true;
	format["setAccountScore:%1:%2", _newVictimRespect, _victimPID] call ExileServer_system_database_query_fireAndForget;
};
if (_victimStatsNeedUpdate) then
{
	_victim call ExileServer_object_player_sendStatsUpdate;
};
if !(_systemChat isEqualTo "") then
{
	if ((getNumber (configFile >> "CfgSettings" >> "Logging" >> "deathLogging")) isEqualTo 1) then
	{
		[_systemChat,"Death"] call ExileLifeServer_util_A3Log;
	};
};
if (getNumber(configFile >> "CfgSettings" >> "Escape" >> "enableEscape") isEqualTo 1) then
{
	[_killer, _victim, _killType] spawn ExileServer_system_escape_deathCheck;
}
else
{
	format["insertPlayerHistory:%1:%2:%3:%4:%5", getPlayerUID _victim, name _victim, _victimPosition select 0, _victimPosition select 1, _victimPosition select 2] call ExileServer_system_database_query_fireAndForget;
};
if(underwater _victim)exitWith{
	_victim allowDamage true;
	_victim setDamage 999;
};
true
