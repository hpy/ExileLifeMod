/**
                    * ExileServer_object_lock_network_grindNotificationRequest
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

                    private["_sessionID","_parameters","_door","_playerObject","_soundSource","_territory","_serverTime","_cooldown"];
_sessionID = _this select 0;
_parameters = _this select 1;
_door = objectFromNetID(_parameters select 0);
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "Player is null";	
	};
	if (isNull _door) then 
	{
		throw "Door is null";
	};
	_door setVariable ["ExileGrinderUID", getPlayerUID _playerObject, true];
	_soundSource = createSoundSource ["Exile_Sound_Grinding", getPos _door, [], 0];
	_door setVariable ["ExileGrinderSound", _soundSource, true];
	_territory = _door call ExileClient_util_world_getTerritoryAtPosition;
	_serverTime = time;
	if (getNumber(missionConfigFile >> "CfgHacking" >> "notifyServer") isEqualTo 1) then
	{
		_cooldown = getNumber(missionConfigFile >> "CfgGriding" >> "notificationCooldown") * 60;
		if (_serverTime > ((_territory getVariable ["ExileGridingNotifiedTime", (_cooldown * -1)]) + _cooldown)) then 
		{
			["baguetteRequest", ["Warning! Lock grinding in progress!"]] call ExileServer_system_network_send_broadcast;
			_territory setVariable ["ExileGridingNotifiedTime", _serverTime];
		};
	};
	if (_serverTime > ((_territory getVariable ["ExileXM8MobileNotifiedTime",-1800]) + 1800)) then
	{
		_territory call ExileServer_system_xm8_sendBaseRaid;
		_territory setVariable ["ExileXM8MobileNotifiedTime", _serverTime];
	};
}
catch
{
	_exception call ExileServer_util_log;
};
true