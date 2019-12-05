/**
                    * ExilelifeClient_util_world_chkSurfaceType
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

                    private["_surfacetype","_object","_distance","_result","_attempts","_randomPositionnearplayer"];
_surfacetype = _this select 0;
_object = _this select 1;
_distance = _this select 2;
_result = false;
try
{
	if !((surfacetype getPosATL _object) isEqualTo _surfacetype) then
	{
		_attempts = 0;
		while {_attempts < 100} do
		{
			_randomPositionnearplayer = [(getPosATL _object), _distance] call ExileClient_util_math_getRandomPositionInCircle;
			if ((surfacetype _randomPositionnearplayer) isEqualTo _surfacetype) exitWith
			{
				throw true;
			};
			_attempts = _attempts + 1;
		};
	}
	else
	{
		throw true;
	};
}
catch
{
	_result = _exception;
};
_result