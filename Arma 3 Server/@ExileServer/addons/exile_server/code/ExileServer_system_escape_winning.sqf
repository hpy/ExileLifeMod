/**
                    * ExileServer_system_escape_winning
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

                    private["_winner","_winType","_message","_respectBonus","_currentRespect"];
if (ExileEscapeHasWinner) exitWith {};
_winner = _this select 0;
_winType = _this select 1;
ExileEscapeHasWinner = true;
"ExilePlayArea" setMarkerSize [worldSize,worldSize];
"ExilePlayArea" setMarkerAlpha 0;
format["addAccountWin:%1", getPlayerUID _winner] call ExileServer_system_database_query_fireAndForget;
[_winner, "baguetteRequest", ["You have won! Congratulations!"]] call ExileServer_system_network_send_to;
_message = format ["Player %1 won!", name _winner];
["baguetteRequest", [_message]] call ExileServer_system_network_send_broadcast;
[ExileEscapePlayerCountThreadID] call ExileServer_system_thread_removeTask;
[ExileEventThreadID] call ExileServer_system_thread_removeTask;
if !((vehicle player) isEqualTo player) then 
{
	[_winner, "youWonMate", []] call ExileServer_system_network_send_to;
};
switch (_winType) do
{
	case "Kill" : {_respectBonus = getNumber (configFile >> "CfgSettings" >> "Escape" >> "respectWinKill"); };
	case "GetIn" : {_respectBonus = getNumber (configFile >> "CfgSettings" >> "Escape" >> "respectWinGetIn"); };
	case "Suicide" : {_respectBonus = getNumber (configFile >> "CfgSettings" >> "Escape" >> "respectWinSuicide"); };
	default {_respectBonus = getNumber (configFile >> "CfgSettings" >> "Escape" >> "respectWinSuicide"); };
};
_currentRespect = _winner getVariable ["ExileScore", 0];
_currentRespect = _currentRespect + _respectBonus;
_winner setVariable ["ExileScore", _currentRespect];
format["setAccountScore:%1:%2", _currentRespect, getPlayerUID _winner] call ExileServer_system_database_query_fireAndForget;
format["setMatchWinner:%1:%2:%3", getPlayerUID _winner, _winType, ExileEscapeMatchID] call ExileServer_system_database_query_fireAndForget;
ExileEscapeGameEndAt = serverTime + 60;
publicVariable "ExileEscapeGameEndAt";
uiSleep 60;
"#shutdown" call ExileServer_system_rcon_event_sendCommand;
//"#restartserver" call ExileServer_system_rcon_event_sendCommand;