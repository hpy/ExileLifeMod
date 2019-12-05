/*
	Author: Nelson Duarte

	Description:
	Spawns an ambient air unit, makes it move and deletes it when it reaches destination
	Vehicle will never engage and will be flagged as captive
	Good for simple creation of ambient fly by's

	Parameter(s):
	_this select 0:	ARRAY - The position where vehicle will spawn
	_this select 1:	ARRAY - The end position of the vehicle, it will be deleted here
	_this select 2:	NUMBER - The spawn and flight height of the vehicle
	_this select 3:	STRING - The speed the vehicle will move ("LIMITED", "NORMAL", "FULL")
	_this select 4:	STRING - The classname of the vehicle to spawn
	_this select 5:	SIDE - The side the vehicle belongs
	
	Returns:
	BOOL - true on success
*/

//Params
private ["_start", "_end", "_height", "_speed", "_class", "_side"];
_start 		= [_this, 0, [0,0,0], [[]]] call BIS_fnc_param;
_end 		= [_this, 1, [100,100,100], [[]]] call BIS_fnc_param;
_height 	= [_this, 2, 100, [0]] call BIS_fnc_param;
_speed		= [_this, 3, "NORMAL", [""]] call BIS_fnc_param;
_class 		= [_this, 4, "B_Heli_Light_01_F", [""]] call BIS_fnc_param;
_side		= [_this, 5, WEST, [WEST]] call BIS_fnc_param;

//Set spawn height
_start set [2, _height];

//The starting direction of the vehicle
private "_direction";
_direction = [_start, _end] call BIS_fnc_dirTo;

//Spawn the vehicle
private ["_vehicleContainer", "_vehicle", "_vehicleCrew", "_vehicleGroup"];
_vehicleContainer	= [_start, _direction, _class, _side] call BIS_fnc_spawnVehicle;
_vehicle 		= _vehicleContainer select 0;
_vehicleCrew		= _vehicleContainer select 1;
_vehicleGroup		= _vehicleContainer select 2;

//The vehicle/group should ignore it's surroundings
_vehicle disableAi "TARGET";
_vehicle disableAi "AUTOTARGET";
_vehicle setCaptive true;
_vehicleGroup allowFleeing 0;

//Fly height
_vehicle flyInHeight _height;

//Add waypoint
private "_waypoint";
_waypoint = _vehicleGroup addWaypoint [_end, 0];

//Set waypoint properties
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointSpeed _speed;

//The waypoint statements
//Once unit completes waypoint we clean up crew/vehicle/group
_waypoint setWaypointStatements [
	"true",
	"private ['_group', '_vehicle']; _group = group this; _vehicle = vehicle this; { deleteVehicle _x } forEach units _group; deleteVehicle _vehicle; deleteGroup _group;"
];

//Valid
if (!isNull _vehicle) then {
	//Log
	["Ambient flyby %1 (%2) spawned at %3 and will move to %4 with a height of %5 and with %6 speed, of %7 side", _class, _vehicle, _start, _end, _height, _speed, _side] call BIS_fnc_logFormat;
	
	//Return value
	true;
} else {
	//Log
	"Ambient flyby failed to create vehicle, consider making sure the wanted side center exists" call BIS_fnc_error;
	
	//Return value
	false;
};
