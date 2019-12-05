/**
                    * ExileServer_object_lock_network_startHackRequest
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

                    private["_sessionID","_parameters","_safe","_playerObject","_lappyToppy","_marker","_territory","_serverTime","_target","_cooldown"];
_sessionID = _this select 0;
_parameters = _this select 1;
_safe = objectFromNetID(_parameters select 0);
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "Player is null";	
	};
	if (isNull _safe) then 
	{
		throw "Safe is null";
	};
	_lappyToppy = createVehicle ["Exile_Construction_Laptop_Static", _playerObject modelToWorld [0.1,0.55,0], [], 0, "CAN_COLLIDE"];
	_lappyToppy attachTo [_playerObject, [0.1,0.55,0]];
	_lappyToppy setDir -90;
	_lappyToppy animate ['LaptopLidRotation', 1];
	_safe setVariable ["ExileHackerLaptop", _lappyToppy];
	_safe setVariable ["ExileHackerUID", getPlayerUID _playerObject, true];
	if (getNumber(missionConfigFile >> "CfgHacking" >> "showMapIcon") isEqualTo 1) then 
	{
		_marker = createMarker [format["ExileHacking%1", diag_tickTime], getPos _safe];
		_marker setMarkerType "ExileHackingIcon";
		_safe setVariable ["ExileHackingMarker", _marker];
	};
	_territory = _safe call ExileClient_util_world_getTerritoryAtPosition;
	_serverTime = time;
	if !(isNull _territory) then 
	{
		if(_serverTime > ((_territory getVariable ["ExileXM8MobileNotifiedTime",-1800]) + 1800))then
		{
			_territory call ExileServer_system_xm8_sendBaseRaid;
			_territory setVariable ["ExileXM8MobileNotifiedTime", _serverTime];
		};
	};
	if (getNumber(missionConfigFile >> "CfgHacking" >> "notifyServer") isEqualTo 1) then
	{
		_target = [_safe, _territory] select !(isNull _territory);
		_cooldown = getNumber(missionConfigFile >> "CfgHacking" >> "notificationCooldown") * 60;
		if (_serverTime > ((_target getVariable ["ExileHackNotifiedTime", (_cooldown * -1)]) + _cooldown)) then 
		{
			["baguetteRequest", ["Warning! Safe hack in progress!"]] call ExileServer_system_network_send_broadcast;
			_target setVariable ["ExileHackNotifiedTime", _serverTime];
		};
	};
}
catch
{
	if !(isNull _safe) then 
	{
		_safe setVariable ["ExileHackerUID", "", true];
	};
	_exception call ExileServer_util_log;
};
true