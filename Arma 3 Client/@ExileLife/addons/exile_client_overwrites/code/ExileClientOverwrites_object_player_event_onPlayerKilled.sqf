/**
                    * ExileClientOverwrites_object_player_event_onPlayerKilled
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

                    private["_respawnDelay"];
if (!(isMultiplayer)) exitWith {};
setPlayerRespawnTime 10e10;
if (ExileClientIsHandcuffed) then
{
  disableUserInput false;
  disableUserInput true;
  disableUserInput false;
};
if (ExilePlayerInSafezone) then
{
	call ExileClient_object_player_event_onLeaveSafezone;
};
ExilePlayerInSafezone = false; 
call ExileClient_gui_toaster_removeAllToasts;
if (ExileClientBleedOutThread isEqualTo -1) then
{
    if(player getVariable ['ExileLifeClientIncapacitated', false])exitWith{
        call ExileClient_object_player_death_forceRespawn;
    };
    _respawnDelay = _this select 3;
    _respawnDelay call ExileClient_object_player_death_startBleedingOut;
}else{
    call ExileClient_object_player_death_forceRespawn;
};
true
