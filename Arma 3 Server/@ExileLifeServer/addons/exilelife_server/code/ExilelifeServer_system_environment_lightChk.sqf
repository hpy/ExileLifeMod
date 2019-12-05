/**
                    * ExilelifeServer_system_environment_lightChk
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

                    private["_position","_distance","_delay","_timetoremove","_lightstarted","_index"];
if !(ExileLifeLightArray isEqualTo []) then
{
	{
		if (ExileSystemMainTimer >= (_x select 2)) then
		{
			_position = _x select 0;
			_distance = _x select 1;
			_delay = _x select 2;
			_timetoremove = _x select 3; 
			_lightstarted = _x select 4; 
			_index = _forEachIndex;
			if (_lightstarted isEqualTo 0) then
			{
				_x set [4, 1];
				[1,_position,_distance] call ExileLifeServer_system_environment_event_lights;
			};
			if (ExileSystemMainTimer >= _timetoremove) then
			{
				[0,_position,_distance] call ExileLifeServer_system_environment_event_lights;
				ExileLifeLightArray deleteAt _index;
			};
		};
	} 
	forEach ExileLifeLightArray;
};
