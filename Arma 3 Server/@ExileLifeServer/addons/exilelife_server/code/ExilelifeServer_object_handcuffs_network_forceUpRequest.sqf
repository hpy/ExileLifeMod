/**
                    * ExilelifeServer_object_handcuffs_network_forceUpRequest
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

                    private["_sessionID","_parameters","_victimNetID","_player","_victim"];
_sessionID = _this select 0;
_parameters = _this select 1;
_victimNetID = _parameters select 0;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "Unknown player - cannot force them to stand up!";
	};
	if !(alive _player) then
	{
		throw "The dead cannot force others to stand up!";
	};
	_victim = objectFromNetID _victimNetID;
	if (isNull _victim) then
	{
		throw "Cannot force up an unknown victim!";
	};
	if !(alive _victim) then
	{
		throw "Cannot force up a dead player!";
	};
	if (_victim getVariable ['ExileLifeClientUnconscious',false]) then
	{
		throw "Cannot force up an unconcious player!";
	};
	if (_victim getVariable ['ExileLifeClientIncapacitated',false]) then
	{
		throw "Cannot force up an incapacitated player!";
	};
	if !(_victim getVariable ["ExileIsHandcuffed", false]) then
	{
		throw "Cannot force up a non-handcuffed player!";
	};
	if (_victim getVariable ["ExileLifeisEscorted", false]) exitWith
	{
		[_player, "escortRequest", [netId _victim, False]] call ExileServer_system_network_send_to;
		_victim setVariable ["ExileLifeisEscorted", false, true];
		_victim setVariable ["ExileLifeIsForcedUp", true, true];
		_victim setVariable ["ExileLifeIsForcedDown", false, true];
		_player setVariable ["ExileLifeisEscortingChk", false, true];
		_victim setVariable ["ExileLifeEscort", objNull];
	};
	if (_victim getVariable ["ExileLifeIsForcedUp", false]) then
	{
		throw "Cannot force up an already standing player!";
	};
	if !(_victim getVariable ["ExileLifeIsForcedDown", false]) then
	{
		throw "Cannot force up an already standing player!";
	};
	["switchMoveRequest", [netId _victim, "Acts_AidlPsitMstpSsurWnonDnon_out"]] call ExileServer_system_network_send_broadcast; 
	[_victim, "forceUpResponse", [""]] call ExileServer_system_network_send_to;
	_victim setVariable ["ExileLifeisEscorted", false, true];
	_victim setVariable ["ExileLifeIsForcedUp", true, true];
	_victim setVariable ["ExileLifeIsForcedDown", false, true];
	_victim setVariable ["ExileLifeEscort", objNull];
}
catch
{
	_exception call ExileServer_util_log;
};
