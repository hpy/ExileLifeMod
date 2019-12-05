/**
                    * ExilelifeClient_object_player_event_onFired_axe
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

                    private["_treeModelNames","_tree"];
if (ExileLifeShiftState) then
{
	_treeModelNames = getArray(missionConfigFile >> "CfgInteractionModels" >> "WoodSource" >> "models");
	_tree = _treeModelNames call ExileClient_util_model_getLookAt;
	if (!isNull _tree) then
	{
		if (alive _tree) then
		{
			playSound3D ["exilelife_assets\sound\axe_hit.ogg", player, false, getPosASL player, 1, 1, 0];
			["chopTreeRequest", [(netId _tree)]] call ExileClient_system_network_send;
		};
	};
	ExileClientPlayerIsInCombat = false;
	ExileClientPlayerLastCombatAt = 0;
	false call ExileClient_gui_hud_toggleCombatIcon;
	ExileLifeShiftState = false; 
};