/**
                    * ExileServer_system_escape_playerStart
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

                    private["_centerOfPlay","_areaOfPlay","_spawnPositions","_playerUIDS"];
[ExileEscapeThreadSpawnID] call ExileServer_system_thread_removeTask;
[ExileEscapeTeleportID] call ExileServer_system_thread_removeTask;
call ExileServer_system_event_initialize;
[] call ExileServer_system_escape_weaponBoxes;
"Moving players." call ExileServer_util_log;
"ExileFuturePlayArea" setMarkerAlpha 0;
_centerOfPlay = getMarkerPos "ExileFuturePlayArea";
_areaOfPlay = (getMarkerSize "ExileFuturePlayArea") select 0;
[_centerOfPlay, _areaOfPlay] call ExileServer_system_escape_spawnLoot;
_centerOfPlay call ExileServer_system_escape_randomizeWeather;
_spawnPositions = [_centerOfPlay, _areaOfPlay, count allPlayers, 150] call ExileServer_system_escape_findSafePositions;
_playerUIDS = [];
{
	[_x, "playerStart", ""] call ExileServer_system_network_send_to;
	format["addAccountMatches:%1", getPlayerUID _x] call ExileServer_system_database_query_fireAndForget;
	_playerUIDS pushBackUnique (getPlayerUID _x);
	(vehicle _x) setPos (_spawnPositions select _forEachIndex);
	(vehicle _x) setDir (random 360);
}
forEach allPlayers;
ExileEscapeMatchID = format["createMatch:%1:%2", _playerUIDS, count _playerUIDS] call ExileServer_system_database_query_insertSingle;
"ExilePlayArea" setMarkerPos _centerOfPlay;
"ExilePlayArea" setMarkerSize [_areaOfPlay, _areaOfPlay];
"ExilePlayArea" setMarkerColor "ColorPink";
"ExilePlayArea" setMarkerShape "ELLIPSE";
"ExilePlayArea" setMarkerBrush "Border";
ExileEscapePlayStarted = true;
ExileEscapeGameEndAt = serverTime + (ExileEscapeTotalRounds * ExileEscapeMinPerRound * 60);
publicVariable "ExileEscapeGameEndAt";
ExileEscapeTotalPlayers = {alive _x} count allPlayers;
[] spawn ExileServer_system_escape_updateArea;
ExileEscapePlayerCountThreadID = [30, ExileServer_system_escape_playerCountCheck, [], true, "Escape Player Count"] call ExileServer_system_thread_addtask;
deleteMarker "ExileStartingZone";
true
