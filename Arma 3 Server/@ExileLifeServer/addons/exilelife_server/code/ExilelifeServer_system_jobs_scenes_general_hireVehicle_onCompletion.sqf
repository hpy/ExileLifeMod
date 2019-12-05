/**
                    * ExilelifeServer_system_jobs_scenes_general_hireVehicle_onCompletion
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

                    private["_sessionID","_playerObject","_result","_vehicleNetID","_vehicle"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_result = "";
_vehicleNetID = _playerObject getVariable ["ExileLifeJobVehicle",""];
_vehicle = objectfromNetID _vehicleNetID;
deleteVehicle _vehicle;
_playerObject setVariable ["ExileLifeJobVehicle","",true];
_result
