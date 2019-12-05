/**
                    * ExileServer_system_escape_deleteVehicles
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

                    private["_startingPosition","_startingAreaRadius","_distance"];
"Escape - deleting spawn area vehicles.." call ExileServer_util_log;
_startingPosition = getArray (configFile >> "CfgSettings" >> "Escape" >> worldName >> "startingLocation");
_startingAreaRadius = getNumber (configFile >> "CfgSettings" >> "Escape" >> worldName >> "startingAreaRadius");
{
	_distance = _x distance2D _startingPosition;
	if (_distance < (_startingAreaRadius * 2)) then
	{
		deleteVehicle _x;
	};
} forEach vehicles;
