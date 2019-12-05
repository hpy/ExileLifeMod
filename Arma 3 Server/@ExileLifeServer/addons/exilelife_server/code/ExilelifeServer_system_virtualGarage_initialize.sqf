/**
                    * ExilelifeServer_system_virtualGarage_initialize
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

                    private["_config"];
ExileLifeVGSpawnPoints = [];
{
	_config = missionConfigFile >> "CfgVirtualGarage" >> "SpawnPositions" >> _x;
	ExileLifeVGSpawnPoints pushback
	[
		true,
		getArray(_config >> "spawnPoint"),
		getNumber(_config >> "direction"),
		getArray(_config >> "boundries")
	];
}
forEach ([missionConfigFile >> "CfgVirtualGarage" >> "SpawnPositions"] call ExileLifeClient_util_config_getSubClasses);
call ExileLifeServer_system_virtualGarage_checkSpawnLocations;
