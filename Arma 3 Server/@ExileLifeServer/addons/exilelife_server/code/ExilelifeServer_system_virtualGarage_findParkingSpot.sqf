/**
                    * ExilelifeServer_system_virtualGarage_findParkingSpot
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

                    private["_vehicleClassname","_maxCounter","_counter","_posArr","_spawnPoint","_pos"];
_vehicleClassname = _this select 0;
call ExileLifeServer_system_virtualGarage_checkSpawnLocations;
_maxCounter = count(ExileLifeVGSpawnPoints);
_counter = 0;
_posArr = [];
{
	if (_x select 0) exitWith
	{
		(ExileLifeVGSpawnPoints select _forEachIndex) set [0,false];
		_counter = _forEachIndex;
	};
	_counter = _counter + 1;
}
forEach ExileLifeVGSpawnPoints;
if (_counter < _maxCounter) then
{
	_spawnPoint = ExileLifeVGSpawnPoints select _counter;
	_pos = [_spawnPoint select 1, _spawnPoint select 2];
}
else
{
	_pos = [[13854.8,18478,0] findEmptyPosition [10, 250, _vehicleClassname], random(360)];
};
_pos