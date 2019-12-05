/**
                    * ExileServer_system_vehicleSaveQueue_initialize
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

                    ExileServerVehicleSaveQueue = [];
[15, ExileServer_system_vehicleSaveQueue_thread_saveVehicles, [], true, "Vehicle Save"] call ExileServer_system_thread_addTask;
true