/**
                    * ExileServer_system_escape_waitForPlayers
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

                    ExileEscapeGameStarted = false;
"Putting game on hold.." call ExileServer_util_log;
deleteMarker "ExileFuturePlayArea";
"red" call ExileServer_system_escape_3dzone_destroy;
format ["Play area deleted"] call ExileServer_util_log;
["baguetteRequest", ["More players needed to start."]] call ExileServer_system_network_send_broadcast;
ExileEscapeGameStartAt = nil;
publicVariable "ExileEscapeGameStartAt";
"#unlock" call ExileServer_system_rcon_event_sendCommand;
[ExileEscapePlayerStartThreadID] call ExileServer_system_thread_removeTask;
true