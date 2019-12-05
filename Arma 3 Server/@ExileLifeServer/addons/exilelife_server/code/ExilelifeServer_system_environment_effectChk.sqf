/**
                    * ExilelifeServer_system_environment_effectChk
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

                    private["_position","_effect","_delay","_timetoremove","_effectstarted","_objectsarray","_index"];
if !(ExileLifeEffectArray isEqualTo []) then
{
	{
		if (ExileSystemMainTimer >= (_x select 2)) then
		{
			_position = _x select 0;
			_effect = _x select 1;
			_delay = _x select 2;
			_timetoremove = _x select 3;
			_effectstarted = _x select 4;
			_objectsarray = _x select 5;
			_index = _forEachIndex;
			if !(_effectstarted) then
			{
				_x set [4, true];
				[_position,_effect,_index] spawn ExileLifeServer_system_environment_startEffect;
			}
			else
			{
				if (ExileSystemMainTimer >= _timetoremove) then
				{
					{
						deleteVehicle (objectfromNetID _x);
					} forEach _objectsarray;
					ExileLifeEffectArray deleteAt _index;
				};
			};
		};
	}
	forEach ExileLifeEffectArray;
};
