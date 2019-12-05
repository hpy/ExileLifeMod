/**
                    * ExileClientOverwrites_gui_escape_suicide
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

                    private["_result","_display"];
disableSerialization;
_result = ["Do you really want to end your life?", "Confirm", "Yes", "Nah"] call BIS_fnc_guiMessage;
waitUntil { !isNil "_result" };
if (_result) then
{
	_display = findDisplay 49;
	if !(isNull _display) then
	{
		_display closeDisplay 2; 
	};
    player setVariable ['ExileLifeClientReviveState', 5,true];
	player allowDamage true;
	player setDamage 1;
	call ExileClient_object_player_death_forceRespawn;
};
true
