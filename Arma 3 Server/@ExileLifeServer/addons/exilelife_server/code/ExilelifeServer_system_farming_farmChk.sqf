/**
                    * ExilelifeServer_system_farming_farmChk
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

                    private["_gardenID","_timeToUpdate","_index"];
if (ExileLifeServerSunMoonCycle isEqualTo 1) then 
{
	if !(ExileLifeFarmingArray isEqualTo []) then
	{
		{
			if (ExileSystemMainTimer >= (_x select 1)) then
			{
				_gardenID = _x select 0;
				_timeToUpdate = _x select 1;
				_index = _forEachIndex;
				_x set [1, (ExileSystemMainTimer + 240)]; 
				[_gardenID,_index] spawn ExileLifeServer_system_farming_gardenUpdate; 
			};
		} 
		forEach ExileLifeFarmingArray;
	};
};
