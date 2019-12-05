/**
                    * ExileServer_system_escape_extractionHeli
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

                    private["_centerOfPlay","_playAreaRadius","_vehicleClass","_targetLocation","_flyHeight","_speed","_direction","_targetPosition","_distance","_startPosition","_pilot","_heli","_seats","_i","_crew","_heliPad","_waypoint"];
_group = createGroup independent;
_centerOfPlay =  getMarkerPos "ExilePlayArea";
_playAreaRadius = (getMarkerSize "ExilePlayArea") select 0;
_vehicleClass = "Exile_Chopper_Huey_Green";
_targetLocation = _centerOfPlay findEmptyPosition [0, _playAreaRadius, _vehicleClass];
createMarker ["ExileLanding", _targetLocation];
"ExileLanding" setMarkerType "ExileMissionCapturePointIcon";
_flyHeight = 150;
_speed = 150;
_direction = random 360;
_targetPosition = 
[
	_targetLocation select 0, 
	_targetLocation select 1, 
	_flyHeight
];
_distance = 1000;
_startPosition = 
[
	(_targetPosition select 0) + (sin _direction) * _distance,
	(_targetPosition select 1) + (cos _direction) * _distance,
	800 
];
_pilot = _group createUnit ["I_helicrew_F", _startPosition, [], 100, "PRIVATE"];
_pilot setSkill 1;
[_pilot] joinSilent _group;
_heli = createVehicle [_vehicleClass, _startPosition, [], 100, "FLY"];
_heli allowDamage false;
_seats = count (fullCrew [_heli, "", true]);
clearBackpackCargoGlobal _heli;
clearWeaponCargoGlobal _heli;
clearMagazineCargoGlobal _heli;
clearItemCargoGlobal _heli;
_heli setVehicleAmmo 0;
_heli setFuel 1;
_heli enableCopilot false;
_pilot assignAsDriver _heli;
_pilot moveInDriver _heli;
_pilot allowDamage false;
for "_i" from 0 to (_seats - 3) do
{
	_crew = _group createUnit ["I_helicrew_F", _startPosition, [], 100, "PRIVATE"];
	_crew moveincargo _heli;
	_crew allowDamage false;
	[_crew] joinSilent _group;
};
_heli flyInHeight _flyHeight;
_heli disableAI "TARGET";
_heli disableAI "AUTOTARGET";
_heli setDir _direction;
_heli setVelocity [(sin _direction) * _speed, (cos _direction) * _speed, 0];
_heli addEventHandler ["GetIn", "[_this select 2, 'GetIn'] spawn ExileServer_system_escape_winning; [_this select 0] spawn ExileServer_system_escape_extractionHeliTakeoff; (format ['Winner by GetIn - %1', _this select 2]) call ExileServer_util_log;"];
_group allowFleeing 0;
_group setBehaviour "CARELESS";
_group setSpeedMode "FULL";
_group setFormation "WEDGE";
_group setCombatMode "BLUE";
_heliPad = "Land_HelipadEmpty_F" createVehicle _targetLocation;
_waypoint = _group addWaypoint [_targetLocation, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 100;
_waypoint setWaypointStatements ["true", "_heli = vehicle this; _heli land 'GET IN'; this spawn ExileServer_system_escape_extractionHeliHover; 'Extraction heli - Reached land zone...' call ExileServer_util_log;"];
["baguetteRequest", ["Extraction heli in route!"]] call ExileServer_system_network_send_broadcast;
true