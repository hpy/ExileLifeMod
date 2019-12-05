/**
                    * ExileServer_object_lock_network_hackLockRequest
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

                    private["_sessionID","_parameters","_object","_player","_hackerUID","_hackAttempts","_laptop","_marker"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_object = objectFromNetId (_parameters select 0);
	if (isNull _object) then
	{
		throw "Safe object is null.";
	};
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "Player is null.";
	};
	if ((_player distance _object) > 10) then
	{
		throw "You are too far away.";
	};
	_hackerUID = _object getVariable ["ExileHackerUID", ""];
	if !(_hackerUID isEqualTo (getPlayerUID _player)) then
	{
		throw "You aren't the hacker!";
	};
	if !("Exile_Item_Laptop" in (magazines _player)) then
	{
		throw "You do not have a laptop.";
	};
	_object setVariable ["ExileIsLocked", 0, true];
	_object call ExileServer_object_container_database_update;
	_object setVariable ["ExileAccessDenied", false];
	_object setVariable ["ExileAccessDeniedExpiresAt", 0];
	_hackAttempts = (_object getVariable ["ExileHackAttempts", 0]) + 1;
	_object setVariable ["ExileHackAttempts", _hackAttempts, true];
	_object setVariable ["ExileHackerUID", "", true];
	_player setVariable ["ExileIsHacking", false, true];
	_laptop = _object getVariable ["ExileHackerLaptop", objNull];
	if !(isNull _laptop) then
	{
		deleteVehicle _laptop;
	};
	_marker = _object getVariable ["ExileHackingMarker", nil];
	if !(isNil "_marker") then
	{
		deleteMarker _marker;
	};
	_object animate ['DoorRotation', 1];
	[_sessionID, "lockResponse", ["Safe Hacked!", true, _parameters select 0, (_object getVariable ["ExileAccessCode","000000"]), 0]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Hacking failed!", _exception]]] call ExileServer_system_network_send_to;
};
