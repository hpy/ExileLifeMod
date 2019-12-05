/**
                    * ExilelifeClient_object_player_event_handleReload
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_emptyMagName"];
if !((currentWeapon player) in [ExileLifePrimaryWeaponJammed, ExileLifeHandgunWeaponJammed]) then 
{		
	if ((needReload player) isEqualTo 1) then 
	{
		if !(ExileLifeReloadInProgress) then 
		{
			ExileLifeReloadInProgress = true;
			[2, {ExileLifeReloadInProgress = false}, [], false, "Reload Reset"] call ExileClient_system_thread_addTask;
			_emptyMagName = getText(configFile >> "CfgMagazines" >> (currentMagazine player) >> "ExileLife" >> "emptyMag");
			if !(_emptyMagName isEqualTo "") then 
			{
				[player, _emptyMagName] call ExileClient_util_playerCargo_add;
			};
		};
	};
};