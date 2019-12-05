/**
                    * ExilelifeServer_system_environment_soundChk
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

                    private["_objectnetID","_sound","_loop","_delay","_timetoremove","_soundstarted","_index"];
if !(ExileLifeSoundArray isEqualTo []) then
{
	{
		if (ExileSystemMainTimer >= (_x select 3)) then
		{
			_objectnetID = _x select 0;
			_sound = _x select 1;
			_loop = _x select 2;
			_delay = _x select 3;
			_timetoremove = _x select 4; 
			_soundstarted = _x select 5; 
			_index = _forEachIndex;
			if !(_soundstarted) then
			{
				_x set [5, true];
				[_index,_objectnetID,_sound] spawn ExileLifeServer_system_environment_startSound;
			};
			if (_loop) then
			{
				if (ExileSystemMainTimer >= _timetoremove) then
				{
					[_objectnetID,_index] spawn ExileLifeServer_system_environment_stopSound;
				};
			}
			else
			{
				if (ExileSystemMainTimer >= _timetoremove) then
				{
					[_objectnetID,_index] spawn ExileLifeServer_system_environment_stopSound;
				};
			};
		};
	} 
	forEach ExileLifeSoundArray;
};
