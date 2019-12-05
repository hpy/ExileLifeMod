/**
                    * ExilelifeClient_action_resting_duration
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_sleepingBag","_hungerDeg","_thirstDeg","_tick","_hungerLoop","_thirstLoop"];
_sleepingBag = _this;
ExileLifeClientRestingHealthRegen = 0;
ExileLifeClientRestingHungerDeg = 0;
ExileLifeClientRestingThirstDeg = 0;
ExileLifeClientRestingLastLooped = diag_tickTime;
ExileLifeClientRestingStartingHunger = ExileClientPlayerAttributes select 2;
ExileLifeClientRestingStartingThirst = ExileClientPlayerAttributes select 3;
ExileLifeClientRestingStartingHealth = damage player; 
_hungerDeg = [missionConfigFile >> "CfgPlayer", "hungerDegradation",10] call BIS_fnc_returnConfigEntry;
_thirstDeg = [missionConfigFile >> "CfgPlayer", "thirstDegradation",10] call BIS_fnc_returnConfigEntry;
_tick = [missionConfigFile >> "CfgPlayer", "restingTime",10] call BIS_fnc_returnConfigEntry;
_hungerLoop = (ExileLifeClientRestingStartingHunger / _hungerDeg) * _tick;
_thirstLoop = (ExileLifeClientRestingStartingThirst / _thirstDeg) * _tick;
["InfoTitleAndText", 
["NOTE", "You do not have to rest for the entire time.<br/>You may stop resting at any time by moving your character"]] call ExileClient_gui_toaster_addTemplateToast;
cutText ["","BLACK OUT"];
player attachTo [_sleepingBag, [0,0,0]];
player setDir 180;
_hungerLoop min _thirstLoop
