/**
                    * ExileClientOverwrites_object_player_death_forceRespawn
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

                    private["_layer"];
if (alive player) then
{
	player allowDamage true;
	player setDamage 1;
}
else
{
	"Respawning..." call ExileClient_util_log;
	_layer = "BIS_fnc_respawnCounter" call bis_fnc_rscLayer;
	_layer cutText ["", "plain"];
	call ExileLifeClient_gui_revive_event_onUnload;
	if !(ExileClientBleedOutThread isEqualTo -1) then
	{
		"Removing bleed out thread..." call ExileClient_util_log;
		[ExileClientBleedOutThread] call ExileClient_system_thread_removeTask;
		ExileClientBleedOutThread = -1;
	};
	if (ExileLifeClientPlayerIsUnconscious) then
	{
		ExileLifeClientPlayerIsUnconscious = false;
		player setVariable ["ExileLifeClientUnconscious",false,true];
	};
	cutText ["", "BLACK OUT", 1];
	showChat true;
	[] spawn
	{
		uiSleep 3;
		[] call ExileLifeClient_system_process_resetVar;
		uiSleep 1;
        [] call ExileLifeClient_system_keybinding_initialize;
        uiSleep 1;
		[] execFSM "exilelife_client\fsm\login.fsm";
		uiSleep 3;
	};
};
