/**
                    * ExilelifeClient_object_player_event_onFired_fishingRod
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

                    if (ExileLifeShiftState) then
{
	if (surfaceIsWater getPos player) then
	{
		[] spawn ExileLifeClient_object_player_action_fishing;
	};
	ExileClientPlayerIsInCombat = false;
	ExileClientPlayerLastCombatAt = 0;
	false call ExileClient_gui_hud_toggleCombatIcon;	
	ExileLifeShiftState = false; 
};
