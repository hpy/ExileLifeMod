/**
                    * ExilelifeClient_object_player_save
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
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
			ExileClientPlayerAttributes select 6
		]
	] call ExileClient_system_network_send;
};
true