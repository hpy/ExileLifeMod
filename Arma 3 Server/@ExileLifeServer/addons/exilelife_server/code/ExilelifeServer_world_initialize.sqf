/**
                    * ExilelifeServer_world_initialize
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

                    "Initializing game world..." call ExileServer_util_log;
call ExileServer_World_loadAllClans;
call ExileServer_World_loadAllTerritories;
call ExileServer_world_loadAllDatabaseConstructions;
call ExileServer_world_loadAllDatabaseVehicles;
call ExileServer_world_loadAllDatabaseContainers;
call ExileServer_system_xm8_sendProtectionMoneyDue;
call ExileServer_world_spawnSpawnZoneVehicles;
call ExileServer_world_spawnVehicles;
 "Initializing ExileLife game world..." call ExileServer_util_log;
call ExileLifeServer_world_gangInitialize;
ExileLifeServerOffloadtoClientThread = [1, ExileLifeServer_system_process_OffloadtoClient, [], true,"Function Offloader"] call ExileServer_system_thread_addTask;
format ["LocalClient Check Thread Started: %1",diag_ticktime] call ExileServer_util_log;
"Game world initialized! Let the fun begin!" call ExileServer_util_log;
true
