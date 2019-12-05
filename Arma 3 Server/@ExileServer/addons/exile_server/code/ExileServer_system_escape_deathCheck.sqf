/**
                    * ExileServer_system_escape_deathCheck
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

                    private["_killer","_victim","_killType","_playerCount","_alivePlayers","_winner","_messages","_playerNumber","_message"];
_killer = _this select 0;
_victim = _this select 1;
_killType = _this select 2;
_playerCount = {alive _x} count allPlayers;
if ((_playerCount isEqualTo 1) && !(isNil "ExileEscapeGameStartAt")) then
{
	if ((_killType isEqualTo 1) || !(alive _killer)) then 
	{
		_alivePlayers = [];
		{
			if (alive _x) then
			{
				_alivePlayers pushback _x;
			};
		}
		forEach allPlayers;
		_winner = _alivePlayers select 0;
		(format ["Winner by suicide - %1", name _winner]) call ExileServer_util_log;
		[_winner, "Suicide"] spawn ExileServer_system_escape_winning;
	}
	else
	{
		(format ["Winner by kill - %1", name _killer]) call ExileServer_util_log;
		[_killer, "Kill"] spawn ExileServer_system_escape_winning;
	};
}
else
{	
	if (isNil "ExileEscapeGameStartAt") then 
	{
		_messages = 
		[
			"The game hasn't even started yet...",
			"Died before the game could start",
			"You win! Just kidding."
		];
		[_victim, "baguetteRequest", [selectRandom _messages]] call ExileServer_system_network_send_to;
	}
	else
	{
		_playerNumber = _playerCount + 1;
		_message = format ["You were player %1/%2", _playerNumber, ExileEscapeTotalPlayers];
		[_victim, "baguetteRequest", [_message]] call ExileServer_system_network_send_to;
		uiSleep 30;
		[_victim, "kickClient", ""] call ExileServer_system_network_send_to;
	};
};
true