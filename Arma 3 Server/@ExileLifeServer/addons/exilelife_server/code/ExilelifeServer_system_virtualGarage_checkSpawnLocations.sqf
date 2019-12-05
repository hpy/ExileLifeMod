/**
                    * ExilelifeServer_system_virtualGarage_checkSpawnLocations
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

                    private["_nearbyVeh","_boundries","_index","_tl","_br","_pos","_posX","_posY"];
{
	_nearbyVeh = nearestObjects [_x select 1,["LandVehicle"],15];
	if !(_nearbyVeh isEqualTo []) then
	{
		_boundries = _x select 3;
		_index = _forEachIndex;
		_boundries params ["_tl","_br"];
		{
			_pos = getPos _x;
			_pos params ["_posX", "_posY",""];
			if
			(
				(
			 		(_tl select 0) > _posX
			 		&&
			 		_posX > (_br select 0)
			 	)
			 	&&
			 	(
			 		(_tl select 1) < _posY
			 		&&
			 		_posY < (_br select 1)
			 	)
			)
			exitWith
			{
				(ExileLifeVGSpawnPoints select _index) set [0,false];
			};
			(ExileLifeVGSpawnPoints select _index) set [0,true];
		}
		forEach _nearbyVeh;
	};
}
forEach ExileLifeVGSpawnPoints;