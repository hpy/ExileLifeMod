/**
                    * ExilelifeClient_object_player_event_handleHearingLoss
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_weapon","_ammo","_result","_ignored","_headgearList"];
_weapon = _this select 0;
_ammo = _this select 1;
_result = [missionConfigFile >> "CfgPlayer", "enableHearingLoss",0] call BIS_fnc_returnConfigEntry; 
if (_result != 0) then 
{
	_ignored = [missionConfigFile >> "CfgHearingLoss", "ignoredWeapons",[]] call BIS_fnc_returnConfigEntry;
	if ((((player weaponAccessories (currentMuzzle player)) param [0, ""]) isEqualTo "") && !(_weapon in _ignored)) then {
		_headgearList = [missionConfigFile >> "CfgHearingLoss", "headgearProtection",[]] call BIS_fnc_returnConfigEntry;
		if (!ExileClientEarplugsInserted && !((headgear player) in _headgearList)) then {
			0 fadeSound 0;
			playSound ["combat_deafness", true]; 
			ExileLifeHearingLossTimeout = getNumber(configFile >> "CfgAmmo" >> _ammo >> "hit") * 2; 	
			ExileLifePlayerLastLostHearing = diag_tickTime;
			ExileLifePlayerLastLostHearingPlayed = diag_tickTime;
			ExileLifePlayerHearingLossActive = true;
		};
	};
};
true