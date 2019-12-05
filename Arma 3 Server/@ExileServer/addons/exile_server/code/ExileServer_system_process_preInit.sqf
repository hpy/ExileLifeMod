/**
                    * ExileServer_system_process_preInit
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

                    private["_MySql"];
ExileLifeServer_Logs_MasterLog = [];
"Server is loading..." call ExileServer_util_log;
call ExileServer_system_rcon_initialize;
finishMissionInit;
ExileSessionIDs = [];
ExileServerGraveyardGroup = grpNull;
ExileServerBreachingCharges = [];
ExileShippingContainers = [];
ExileLifePlayerBloodTypes = [];
independent setFriend [sideEnemy, 1];
call ExileServer_system_process_noobFilter;
_MySql_connection = [] call ExileServer_system_database_connect;
call ExileLifeServer_system_database_delayed_initialize;
call ExileServer_system_network_setupEventHandlers;
if !(getRemoteSensorsDisabled) then
{
	disableRemoteSensors true;
};
PublicServerIsLoaded = false; 
PublicServerVersion = getText(configFile >> "CfgMods" >> "Exile" >> "version");
publicVariable "PublicServerVersion";
