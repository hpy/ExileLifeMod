/**
                    * ExileClientOverwrites_object_player_save
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

                    if (ExileClientPlayerIsSpawned) then
{
	[
		"savePlayerRequest", 
		[
			ExileClientPlayerAttributes select 2, 
			ExileClientPlayerAttributes select 3, 
			ExileClientPlayerAttributes select 4,
			ExileClientPlayerAttributes select 5,
			ExileClientPlayerAttributes select 6,
			ExileClientPlayerAttributes select 7
		]
	] call ExileClient_system_network_send;
};
true