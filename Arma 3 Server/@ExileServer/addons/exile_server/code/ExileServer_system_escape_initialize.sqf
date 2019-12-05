/**
                    * ExileServer_system_escape_initialize
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

                    private["_centerPosition","_startingPosition","_startingAreaRadius"];
"Escape - initializing thread.." call ExileServer_util_log;
ExileEscapeGameStarted = false;
ExileEscapePlayStarted = false;
ExileEscapeHasWinner = false;
_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
createMarker ["ExilePlayArea", _centerPosition];
"ExilePlayArea" setMarkerSize [worldSize,worldSize];
_startingPosition = getArray(configFile >> "CfgSettings" >> "Escape" >> worldName >> "startingLocation");
_startingAreaRadius = getNumber (configFile >> "CfgSettings" >> "Escape" >> worldName >> "startingAreaRadius");
createMarker ["ExileStartingZone", _startingPosition];
"ExileStartingZone" setMarkerSize [_startingAreaRadius,_startingAreaRadius];
"ExileStartingZone" setMarkerType "ExileTraderZone";
"ExileStartingZone" setMarkerAlpha 0;
[] spawn
{
	uiSleep (60 * 60);
	while {true} do
	{
		if (ExileEscapeGameStarted) exitWith {};
		if ((count allPlayers) == 0) then
		{
			"Shutting down server due to inactivity..." call ExileServer_util_log;
			"#shutdown" call ExileServer_system_rcon_event_sendCommand;
		};
		uiSleep 60;
	};
};
ExileEscapeSpectateUIDS = getArray(configFile >> "CfgSettings" >> "Escape" >> "spectatorUIDs");
publicVariable "ExileEscapeSpectateUIDS";
[] call ExileServer_system_escape_deleteVehicles;
ExileEscapeThreadSpawnID = [60, ExileServer_system_escape_thread_spawn, [], true, "Escape SpawnID"] call ExileServer_system_thread_addtask;
ExileEscapeTeleportID = [0.5, ExileServer_system_escape_teleport, [], true, "Escape TeleportID"] call ExileServer_system_thread_addtask;
true
