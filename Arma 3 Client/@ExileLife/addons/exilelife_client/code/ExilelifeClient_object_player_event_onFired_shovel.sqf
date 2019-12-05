/**
                    * ExilelifeClient_object_player_event_onFired_shovel
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
	playSound3D ["exilelife_assets\sound\shoveldig.ogg", player, false, getPosASL player, 1, 1, 0];
	call ExileLifeClient_object_player_action_digging;
	ExileClientPlayerIsInCombat = false;
	ExileClientPlayerLastCombatAt = 0;
	false call ExileClient_gui_hud_toggleCombatIcon;			
	ExileLifeShiftState = false; 
};