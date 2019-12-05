/**
                    * ExileServer_system_escape_thread_spawn
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

                    private["_config","_minimumPlayersOnline","_totalPlayers","_playersNeeded","_message"];
_config = configFile >> "CfgSettings" >> "Escape";
if (!(ExileEscapeGameStarted) && (servertime < 10000)) then
{
	_minimumPlayersOnline = getNumber (_config >> "minimumPlayersOnline");
	_totalPlayers = {alive _x} count allPlayers;
	if (_totalPlayers >= _minimumPlayersOnline) then 
	{
		ExileEscapeGameStarted = true;
		"Exile Escape starting..." call ExileServer_util_log;
		[] call ExileServer_system_escape_startGame;
	}
	else
	{
		_playersNeeded = _minimumPlayersOnline - _totalPlayers;
		if (_playersNeeded isEqualTo 1) then 
		{
			_message = "One player needed to start.";
		}
		else 
		{
			_message = format ["%1 players needed to start.",_playersNeeded];
		};
		["baguetteRequest", [_message]] call ExileServer_system_network_send_broadcast;
	};
};
if (ExileEscapeGameStarted) then
{
	_minimumPlayersOnline = getNumber (_config >> "minimumPlayersOnline");
	_totalPlayers = count allPlayers;
	if (_totalPlayers < _minimumPlayersOnline) then
	{
		[] call ExileServer_system_escape_waitForPlayers;
	};
};
true