/**
                    * ExilelifeClient_action_resting_repeating
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_restTime","_healthRegen","_hungerDeg","_thirstDeg"];
_restTime = [missionConfigFile >> "CfgPlayer", "restingTime",5] call BIS_fnc_returnConfigEntry;
if ((diag_tickTime - ExileLifeClientRestingLastLooped) >= _restTime) then 
{
	_healthRegen = [missionConfigFile >> "CfgPlayer", "healthRegeneration",2] call BIS_fnc_returnConfigEntry;
	_hungerDeg = [missionConfigFile >> "CfgPlayer", "hungerDegradation",5] call BIS_fnc_returnConfigEntry;
	_thirstDeg = [missionConfigFile >> "CfgPlayer", "thirstDegradation",5] call BIS_fnc_returnConfigEntry;
	ExileLifeClientRestingHealthRegen = ExileLifeClientRestingHealthRegen + _healthRegen;
	ExileLifeClientRestingHungerDeg = ExileLifeClientRestingHungerDeg + _hungerDeg;
	ExileClientPlayerAttributes set [2, ((((ExileClientPlayerAttributes select 2) - _hungerDeg) min 100) max 0)];
	ExileLifeClientRestingThirstDeg = ExileLifeClientRestingThirstDeg + _thirstDeg;
	ExileClientPlayerAttributes set [3, ((((ExileClientPlayerAttributes select 3) - _thirstDeg) min 100) max 0)];
	ExileClientPlayerAttributes set [0, ((((ExileClientPlayerAttributes select 0) + _healthRegen) min 100) max 0)];
	ExileLifeClientRestingLastLooped = diag_tickTime;
};
true
