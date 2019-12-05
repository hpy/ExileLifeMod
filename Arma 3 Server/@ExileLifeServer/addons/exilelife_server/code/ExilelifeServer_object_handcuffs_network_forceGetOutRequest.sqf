/**
                    * ExilelifeServer_object_handcuffs_network_forceGetOutRequest
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

                    private["_sessionID","_parameters","_vehicleNetID","_player","_vehicle","_vehiclecaptives","_victimNetID","_victim"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleNetID = _parameters select 0;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "Unknown player - cannot force them to get out of a vehicle!";
	};
	if !(alive _player) then
	{
		throw "The dead cannot force others to get out of a vehicle!";
	};
	_vehicle = objectFromNetId _vehicleNetID;
	_vehiclecaptives = _vehicle getVariable ["ExileLifeVehicleCaptives", []];
	if !(isNil "_vehiclecaptives")  then
	{
		{
			scopeName "captives_start";
			_victimNetID = _x;
			_victim = objectFromNetID _victimNetID;
			if (isNull _victim) exitWith
			{
				breakTo "captives_start"; 
			};
			if !(_victim getVariable ["ExileIsHandcuffed", false]) exitWith
			{
				breakTo "captives_start"; 
			};
			_victim setVariable ["ExileLifeisEscorted", false, true];
			_victim setVariable ["ExileLifeIsForcedUp", true, true];
			_victim setVariable ["ExileLifeIsForcedDown", false, true];
			_victim setVariable ["ExileLifeIsForcedGetIn", false, true];
			_victim setVariable ["ExileLifeEscort", objNull];
			[_victim, "ForceGetOutResponse", [_victimNetID,_vehicleNetID]] call ExileServer_system_network_send_to;
		}forEach _vehiclecaptives;
	_vehicle setVariable ["ExileLifeVehicleCaptives", nil, true];
	_player setVariable ["ExileLifeisEscortingChk", false, true];
	};
}
catch
{
	_exception call ExileServer_util_log;
};
