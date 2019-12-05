/**
                    * ExilelifeServer_system_garbageCollector_unscheduled_deleteGroundVehicleHolders
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

                    private["_lifeTime","_spawnedAt"];
_lifeTime = 60 * getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Ingame" >> "GroundVehicleHolder" >> "lifeTime");
{
	{
		_spawnedAt = _x getVariable ["ExileLifeSpawnedAt", -1];
		if (_spawnedAt isEqualTo -1) then 
		{
			_x setVariable ["ExileLifeSpawnedAt", time];
		}
		else 
		{
			if ((time - _spawnedAt) >= _lifeTime) then
			{
				deleteVehicle _x;
			};
		};
	}
	forEach (allMissionObjects _x);
}
forEach ["ExileLife_Sack","ExileLife_Leaf_Cannabis","ExileLife_Farming_DirtPile"]; 
