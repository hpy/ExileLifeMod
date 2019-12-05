/**
                    * ExilelifeServer_system_blackmarket_initialize
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

                    "Blackmarket module is loading..." call ExileLifeServer_util_log;
call ExileLifeServer_system_blackmarket_database_restock;
BlackMarketInventory = [];
BlackMarketInventory = "getBlackMarketInventory" call ExileServer_system_database_query_selectFull;
BlackMarketInventory = [BlackMarketInventory, [], {_x select 0}, "DESCEND"] call BIS_fnc_sortBy;
"Blackmarket module is loaded!" call ExileLifeServer_util_log;
