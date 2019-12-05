/**
                    * ExilelifeServer_system_jobs_scenes_prison_onFailure
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

                    private["_sessionID","_playerObject","_result","_worldConfig","_prisonLocation","_spawnPosition"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_result = "";
[_sessionID,"beatup",[0.5]] call ExileServer_system_network_send_to;
_playerObject call ExileClient_util_playerCargo_clear;
_worldConfig = missionConfigFile >> "cfgExileLifeWorld" >> worldName;
_prisonLocation = getArray(_worldConfig >> "prisonFreeLocation");
_spawnPosition = _prisonLocation findEmptyPosition [5,70];
_playerObject setposATL _spawnPosition;
_playerObject setVariable ["ExileLifePrisoner",false,true];
 _playerObject setVariable ["ExileLifePrisonerMineAmount",nil];
[_playerObject,"Exile_Item_XM8"] call ExileClient_util_playerEquipment_add;
[_playerObject,"itemMap"] call ExileClient_util_playerEquipment_add;
_result