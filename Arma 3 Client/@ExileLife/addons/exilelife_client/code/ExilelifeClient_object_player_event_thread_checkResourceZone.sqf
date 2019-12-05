/**
                    * ExilelifeClient_object_player_event_thread_checkResourceZone
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

                    if !(ExileLifeClientResourceZone) then 
{
	if ((position (vehicle player)) call ExileLifeClient_util_world_isInResourceZone) then 
	{
		[] call ExileLifeClient_object_player_event_onEnterResourcezone; 
	};
	ExileLifeClientPlayerLastResourceZoneCheckAt = diag_tickTime;
}
else 
{
	if (diag_tickTime - ExileLifeClientPlayerLastResourceZoneCheckAt >= 30) then
	{
		if !(position(vehicle player) call ExileLifeClient_util_world_isInResourceZone) then 
		{
			[] call ExileLifeClient_object_player_event_onLeaveResourcezone; 
		};
		ExileLifeClientPlayerLastResourceZoneCheckAt = diag_tickTime;
	};
};