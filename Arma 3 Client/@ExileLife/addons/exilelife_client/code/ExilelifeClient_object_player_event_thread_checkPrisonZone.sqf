/**
                    * ExilelifeClient_object_player_event_thread_checkPrisonZone
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

                    if !(ExileLifeClientPrisonZone) then 
{
	if (player call ExileLifeClient_util_world_isInPrison) then 
	{
		[] call ExileLifeClient_object_player_event_onEnterPrisonZone; 
	};
	ExileLifeClientPlayerLastPrisonZoneCheckAt = diag_tickTime;
}
else 
{
	if (diag_tickTime - ExileLifeClientPlayerLastPrisonZoneCheckAt >= 30) then
	{
		if !(player call ExileLifeClient_util_world_isInPrison) then 
		{
			[] call ExileLifeClient_object_player_event_onLeavePrisonZone; 
		};
		ExileLifeClientPlayerLastPrisonZoneCheckAt = diag_tickTime;
	};
};