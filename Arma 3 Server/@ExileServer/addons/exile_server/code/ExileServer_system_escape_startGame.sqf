/**
                    * ExileServer_system_escape_startGame
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

                    private["_centerPosition","_roundZoneRadius","_initialSize","_canUseThisArea","_position","_locations","_timeBeforeStart","_message","_timesSeconds"];
"Creating play area.." call ExileServer_util_log;
_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_roundZoneRadius = getArray (configFile >> "CfgSettings" >> "Escape" >> "roundZoneRadius");
_initialSize =  _roundZoneRadius select 0;
ExileEscapeMinPerRound = getNumber (configFile >> "CfgSettings" >> "Escape" >> "minutesPerRound");
ExileEscapeCurrentRound = 1;
ExileEscapeTotalRounds = count _roundZoneRadius;
_canUseThisArea = false;
while {_canUseThisArea isEqualTo false} do
{
	_position = [_centerPosition, 25, worldSize, 5, 0 , 10 , 0 ] call BIS_fnc_findSafePos;
	_locations = nearestLocations [_position, ["NameCityCapital", "NameCity", "NameVillage"], _initialSize * 0.5];
	_canUseThisArea = (count _locations) > 0;
};
createMarker ["ExileFuturePlayArea", _position];
"ExileFuturePlayArea" setMarkerSize [_initialSize,_initialSize];
"ExileFuturePlayArea" setMarkerColor "ColorGreen";
"ExileFuturePlayArea" setMarkerShape "ELLIPSE";
"ExileFuturePlayArea" setMarkerBrush "Border";
[_position, _initialSize, "red"] call ExileServer_system_escape_3dzone_create;
format ["Play area created at %1..", _position] call ExileServer_util_log;
_timeBeforeStart = getNumber (configFile >> "CfgSettings" >> "Escape" >> "timeBeforeStart");
_message = format ["Game will start in %1 minutes!", _timeBeforeStart];
["baguetteRequest", [_message]] call ExileServer_system_network_send_broadcast;
_timesSeconds = _timeBeforeStart * 60;
ExileEscapeGameStartAt = serverTime + _timesSeconds;
publicVariable "ExileEscapeGameStartAt";
_timesSeconds = _timeBeforeStart * 60;
ExileEscapePlayerStartThreadID = [_timesSeconds, ExileServer_system_escape_playerStart, [], false] call ExileServer_system_thread_addtask;
[(_timesSeconds - 60), ExileServer_system_escape_lockServer, [], false] call ExileServer_system_thread_addtask;
true
