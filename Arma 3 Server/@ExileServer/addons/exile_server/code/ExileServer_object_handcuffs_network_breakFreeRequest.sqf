/**
                    * ExileServer_object_handcuffs_network_breakFreeRequest
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

                    private["_sessionID","_victim","_hostageTakerNetID","_hostageTaker","_switchmoveaction","_respect","_newScore"];
_sessionID = _this select 0;
try
{
	_victim = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _victim) then
	{
		throw "Unknown player cannot break free!";
	};
	if !(alive _victim) then
	{
		throw "The dead cannot break free!";
	};
	if (_victim getVariable ['ExileLifeClientIncapacitated', false]) then
	{
		throw "The dead cannot break free!";
	};
	if (_victim getVariable ['ExileLifeClientIncapacitated', false]) then
	{
		throw "The unconscious cannot break free!";
	};
	if !(_victim getVariable ["ExileIsHandcuffed", false]) then
	{
		throw "Cannot break free if not handcuffed!";
	};
	if !(_victim call ExileClient_object_handcuffs_hasFreeItems) then
	{
		throw "Missing tools to break free!";
	};
	_hostageTakerNetID = _victim getVariable ["ExileHostageTakerNetID", ""];
	_hostageTaker = objectFromNetId _hostageTakerNetID;
	if !(isNull _hostageTaker) then
	{
		if ((_victim distance _hostageTaker) < 20) then
		{
			throw "Hostage taker is too close!";
		};
	};
	if (_victim getVariable ["ExileLifeIsForcedUp", false]) then
	{
		_switchmoveaction = "";
	};
	if (_victim getVariable ["ExileLifeIsForcedDown", false]) then
	{
		_switchmoveaction = "Acts_AidlPsitMstpSsurWnonDnon_out";
	};
	_victim setVariable ["ExileIsHandcuffed", false, true];
	_victim setVariable ["ExileHostageTakerNetID", nil];
	_victim setVariable ["ExileHostageTakerUID", nil];
	_victim setVariable ["ExileLifeisEscorted", false, true];
	_victim setVariable ["ExileLifeIsForcedUp", false, true];
	_victim setVariable ["ExileLifeIsForcedDown", false, true];
	_victim setVariable ["ExileLifeIsForcedGetIn", false, true];
	["switchMoveRequest", [netId _victim, "Acts_AidlPsitMstpSsurWnonDnon_out"]] call ExileServer_system_network_send_broadcast;
	_respect = getNumber (configFile >> "CfgSettings" >> "Respect" >> "Handcuffs" >> "breakingFree");
	[_victim, "breakFreeResponse", [str _respect]] call ExileServer_system_network_send_to;
	_newScore = _victim getVariable ["ExileScore", 0];
	_newScore = _newScore + _respect;
	_victim setVariable ["ExileScore", _newScore];
	format["setAccountScore:%1:%2", _newScore, _victim getVariable ["ExileLifePID", -1]] call ExileServer_system_database_query_fireAndForget;
	format
    [
        "setPlayerMoney:%1:%2",
        _victim getVariable ["ExileMoney", 0],
        _victim getVariable ["ExileDatabaseID", 0]
    ] call ExileServer_system_database_query_fireAndForget;
}
catch
{
	_exception call ExileServer_util_log;
};
