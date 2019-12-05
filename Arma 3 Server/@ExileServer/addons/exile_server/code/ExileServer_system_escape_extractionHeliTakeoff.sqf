/**
                    * ExileServer_system_escape_extractionHeliTakeoff
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

                    private["_heli","_targetLocation","_flyHeight","_direction","_distance","_targetPosition","_endPosition","_waypoint"];
'Extraction heli - Taking off...' call ExileServer_util_log;
_heli = _this select 0;
_group = group _heli;
_targetLocation = getMarkerPos "ExileLanding";
_flyHeight = 300;
_direction = random 360;
_distance = worldSize * 0.75;
_targetPosition = 
[
	_targetLocation select 0, 
	_targetLocation select 1, 
	_flyHeight
];
_endPosition = 
[
	(_targetPosition select 0) - (sin _direction) * _distance,
	(_targetPosition select 1) - (cos _direction) * _distance,
	_flyHeight
];
_heli enableAI "MOVE";
_waypoint = _group addWaypoint [_endPosition, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 100;
_waypoint setWaypointStatements ["true", "'Extraction heli - Reached end...' call ExileServer_util_log; { deleteVehicle (vehicle _x); deleteVehicle _x; } forEach thisList;"];
true