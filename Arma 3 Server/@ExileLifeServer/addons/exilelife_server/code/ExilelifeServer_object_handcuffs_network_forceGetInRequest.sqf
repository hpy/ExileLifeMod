/**
                    * ExilelifeServer_object_handcuffs_network_forceGetInRequest
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

                    private["_sessionID","_parameters","_victimNetID","_vehicleNetID","_ExileLifeNearestAction","_player","_victim","_vehicle","_vehiclecaptives"];
_sessionID = _this select 0;
_parameters = _this select 1;
_victimNetID = _parameters select 0;
_vehicleNetID = _parameters select 1;
_ExileLifeNearestAction = _parameters select 2;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "Unknown player - cannot force them to get in vehicle!";
	};
	if !(alive _player) then
	{
		throw "The dead cannot force others to get in a vehicle!";
	};
	_victim = objectFromNetID _victimNetID;
	if (isNull _victim) then
	{
		throw "Cannot force an unknown victim to get in vehicle!";
	};
	if !(alive _victim) then
	{
		throw "Cannot force the dead to get in a vehicle!";
	};
	if (_victim getVariable ['ExileLifeClientUnconscious',false]) then
	{
		throw "Cannot force in an unconcious player!";
	};
	if (_victim getVariable ['ExileLifeClientIncapacitated',false]) then
	{
		throw "Cannot force in an incapacitated player!";
	};
	if !(_victim getVariable ["ExileIsHandcuffed", false]) then
	{
		throw "Cannot force any kind of non-handcuffed player!";
	};
	if !(_victim getVariable ["ExileLifeisEscorted", false]) then
	{
		throw "Cannot force a non escorted player to get into a vehicle!";
	};
	[_player, "escortRequest", [netId _victim, False]] call ExileServer_system_network_send_to;
	_victim setVariable ["ExileLifeisEscorted", false, true];
	_victim setVariable ["ExileLifeIsForcedUp", false, true];
	_victim setVariable ["ExileLifeIsForcedDown", false, true];
	_victim setVariable ["ExileLifeIsForcedGetIn", true, true];
	_player setVariable ["ExileLifeisEscortingChk", false, true];
	_victim setVariable ["ExileLifeEscort", objNull];
	[_victim, "ForceGetInResponse", [_victimNetID,_vehicleNetID,_ExileLifeNearestAction]] call ExileServer_system_network_send_to;
_vehicle = objectFromNetId _vehicleNetID;
_vehiclecaptives = _vehicle getVariable ["ExileLifeVehicleCaptives", []];
if !(isNil "_vehiclecaptives")  then
{
	_vehiclecaptives pushback _victimNetID;
	_vehicle setVariable ["ExileLifeVehicleCaptives", _vehiclecaptives, true];
}
else
{
	_vehiclecaptives = [_victimNetID];
	_vehicle setVariable ["ExileLifeVehicleCaptives", _vehiclecaptives, true];
};
}
catch
{
	_exception call ExileServer_util_log;
};
