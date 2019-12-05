/**
                    * ExileServer_system_escape_playerCountCheck
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

                    private["_alivePlayers","_winner"];
_alivePlayers = {alive _x} count allPlayers;
if (_alivePlayers isEqualTo 1) then
{
	_winner = playableUnits select 0;
	(format ["Winner by default - %1", _winner]) call ExileServer_util_log;
	[_winner, "Default"] spawn ExileServer_system_escape_winning;
};
if ((_alivePlayers isEqualTo 0) || (servertime >= ExileEscapeGameEndAt)) then
{
	uiSleep 60;
	"#shutdown" call ExileServer_system_rcon_event_sendCommand;
};