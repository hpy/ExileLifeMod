/**
                    * ExileServer_system_escape_findSafePositions
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

                    private["_center","_radius","_numberOfPositions","_minimumDistance","_foundPositions","_searchDistance","_i","_position","_distance","_direction","_randomPosition","_positionThatArmaThinksIsNice"];
params ["_center", "_radius", "_numberOfPositions", "_minimumDistance"];
_foundPositions = [];
_searchDistance = _radius - 25;
for "_i" from 0 to _numberOfPositions - 1 do 
{
	_position = [];
	while {_position isEqualTo []} do 
	{
		_distance = random _searchDistance;
		_direction = random 360;
		_randomPosition = 
		[
			(_center select 0) + _distance * (cos _direction),
			(_center select 1) + _distance * (sin _direction),
			0
		];
		try 
		{
			_positionThatArmaThinksIsNice = _randomPosition findEmptyPosition [0, 25];
			if (_positionThatArmaThinksIsNice isEqualTo []) then 
			{
				throw false;
			};
			if (surfaceIsWater _positionThatArmaThinksIsNice) then
			{
				throw false;
			};
			{
				if ((_positionThatArmaThinksIsNice distance2D _x) < _minimumDistance) exitWith
				{
					throw false;
				};
			}
			forEach _foundPositions;
			_position = _positionThatArmaThinksIsNice;
			_position set [2, 0];
			_foundPositions pushBack _position;
		}
		catch 
		{
		};
	};
};
_foundPositions