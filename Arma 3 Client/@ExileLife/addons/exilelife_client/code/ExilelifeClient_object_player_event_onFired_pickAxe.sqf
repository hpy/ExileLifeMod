/**
                    * ExilelifeClient_object_player_event_onFired_pickAxe
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

                    private["_rockModelNames","_rock"];
if (ExileLifeShiftState) then
{
	_rockModelNames = getArray(missionConfigFile >> "CfgInteractionModels" >> "StoneSource" >> "models");
	_rock = _rockModelNames call ExileClient_util_model_getLookAt;
	if (!isNull _rock) then
	{
		playSound3D ["exilelife_assets\sound\pickaxe_hit.ogg", player, false, getPosASL player, 1, 1, 0];
		if (ExileLifeClientResourceZone) then
		{
			[2] call ExileLifeClient_resources_mine_chop;
		};
	};
	ExileClientPlayerIsInCombat = false;
	ExileClientPlayerLastCombatAt = 0;
	false call ExileClient_gui_hud_toggleCombatIcon;	
	ExileLifeShiftState = false; 
};
