/**
                    * ExilelifeServer_util_ai_spawnGroup
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

                    private["_position","_numberofAI","_skill","_customGear","_behaviour","_waypoints","_distanceToWander","_typeofwaypoint","_gang","_combatMode","_formation","_i","_countWaypoints","_numberWaypoints","_stepAmount","_waypointPosition","_waypoint"];
_position = _this select 0;
_numberofAI = _this select 1;
_skill = _this param [2,"medium"];
_customGear = _this param [3,[]]; 
_behaviour = _this param [4,"SAFE"]; 
_waypoints = _this param [5,true];
_distanceToWander = _this param [6,20];
_typeofwaypoint = _this param [7,"LOITER"];
_gang = _this param [8,"guard"]; 
_combatMode = _this param [9,"Red"]; 
_formation = _this param [10,"WEDGE"]; 
_group = createGroup independent;
for "_i" from 1 to _numberofAI do
{
	[_position,_group,_customGear,_skill] call ExileLifeServer_util_ai_spawnSoldier;
};
_group selectLeader ((units _group) select 0);
_group setFormation "WEDGE";
_group setCombatMode _combatMode;
_group setBehaviour _behaviour;
if (_waypoints) then 
{
	_countWaypoints = count (waypoints _group);
	if (_countWaypoints > 1) then 
	{
		for "_i" from _countWaypoints to 1 step -1 do
		{
			deleteWaypoint ((waypoints _group) select _i);
		};
	};
	_numberWaypoints = 3;	
	if (_distanceToWander > 40) then 
	{
		_numberWaypoints = 4;			
		if (_distanceToWander > 70) then 
		{
			_numberWaypoints = 6;			
			if (_distanceToWander > 100) then 
			{
				_numberWaypoints = 8;
			};
		};
	};
	_stepAmount = 360/_numberWaypoints;
	for "_i" from 0 to 359 step _stepAmount do
	{
		_waypointPosition = _position getPos [_distanceToWander,_i];
		_waypoint = _group addWaypoint [_waypointPosition,5];
		_waypoint setWaypointType "MOVE";
	};
	_waypoint = _group addWaypoint [_position,0];
	_waypoint setWaypointType "CYCLE";
}
else
{
	_waypoint = _group addWaypoint [_position,0];
	_waypoint setWaypointType _typeofwaypoint;
};
_group