/**
                    * ExileServer_object_animal_network_gutAnimalRequest
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

                    private["_sessionId","_parameters","_netId","_player","_sessionID","_animal","_animalConfig","_lootHolder"];
_sessionId = _this select 0;
_parameters = _this select 1;
_netId = _parameters select 0;
try 
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "Invalid players cannot gut animals!";
	};
	if !(alive _player) then 
	{
		throw "The dead cannot gut animals!";
	};
	_animal = objectFromNetId _netId;
	if (isNull _animal) then 
	{
		throw format ["Cannot gut unknown animal with Net-ID: %1", _netId];
	};
	if (alive _animal) then 
	{
		throw "Cannot gut alive animals!";
	};
	if !(_animal getVariable ["CanBeGutted", false]) then 
	{
		throw "Animal does not support gutting!";
	};
	if (_animal getVariable ["WasGutted", false]) then 
	{
		throw "Cannot gut animals twice!";
	};
	if ((_animal distance _player) > 10) then 
	{
		throw "No long-distance gutting!";
	};
	_animal setVariable ["WasGutted", true];
	_animal setVariable ["CanBeGutted", false, true];
	_animalConfig = configFile >> "CfgVehicles" >> typeOf _animal >> "Exile";
	_lootHolder = createVehicle ["GroundWeaponHolder", (getPosATL _animal), [], 3, "CAN_COLLIDE"];
	_lootHolder setDir (random 360);
	_lootHolder setPosATL (getPosATL _animal);
	{
		_lootHolder addMagazineCargoGlobal [_x select 1, _x select 0];
	}
	forEach getArray (_animalConfig >> "gutItems");
}
catch 
{
	_exception call ExileServer_util_log;
};
