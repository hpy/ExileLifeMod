/**
                    * ExileClientOverwrites_object_player_thread_bleedToDeath
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

                    private["_secondsRemaining","_transition"];
_secondsRemaining = ExileClientBleedOutCountDownEnd - time;
if (_secondsRemaining <= 0) then
{
	"bleedToDeath - Killing player..." call ExileClient_util_log;
	closeDialog 1;
	if(!alive player)then{
		call ExileClient_object_player_death_forceRespawn;
	}else{
			player allowDamage true;
			player setDamage 1;
	};
}
else
{
	_transition = 1 - (_secondsRemaining / ExileClientBleedOutCountDownDuration);
	if (_secondsRemaining < 20) then
	{
		if (_secondsRemaining < 10) then
		{
			[_transition * 10] call BIS_fnc_bloodEffect;
            player setVariable ['ExileLifeClientReviveState', 3,true];
		};
		if (!ExileClientBleedOutHeartbeatPlaying) then
		{
			ExileClientBleedOutHeartbeatPlaying = true;
			missionnamespace setvariable ["RscRespawnCounter_colorID", 2];
			playSound ["SndExileHeartbeatStopping", true]; 
			_secondsRemaining fadeSound 0;
		};
	};
	if (!ExileClientBleedOutHeartbeatPlaying) then
	{
		playSound ["SndExileHeartbeatSlowSingle", true]; 
	};
};
