/**
                    * ExileServer_system_escape_3dzone_create
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

                    private["_centerPosition","_radius","_color","_key","_simpleObjects","_circumference","_steps","_anglePerStep","_i","_angle","_position","_object"];
params ["_centerPosition", "_radius", "_color"];
_key = format ["ExileEscapeServer3dZoneObjects%1", _color];
_simpleObjects = [];
_circumference = 2 * pi * _radius;
_steps = _circumference / 40;
_anglePerStep = 360 / _steps;
for "_i" from 0 to _steps do 
{
	_angle = _i * _anglePerStep;
	_position = 
	[
		(_centerPosition select 0) + (cos _angle) * _radius,
		(_centerPosition select 1) + (sin _angle) * _radius,
		0
	];
	if !(surfaceIsWater _position) then 
	{
		_object = createSimpleObject ["exile_assets\model\exile_zonemarker_" + _color + ".p3d", ATLToASL _position];
		_object setDir (-_angle + 90);
		_simpleObjects pushBack _object;
	};
};
missionNamespace setVariable [_key, _simpleObjects];