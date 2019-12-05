/**
                    * ExileServer_object_lock_network_grindLockRequest
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

                    private["_sessionID","_parameters","_door","_playerObject","_grinderUID","_databaseID","_soundSource"];
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
		throw "Lock is null";
	};
	if !(isNumber(configFile >> "CfgVehicles" >> (typeOf _door) >> "exileIsDoor")) then 
	{
		throw "Really no can do.";
	};
	if ((_playerObject distance _door) > 10) then 
	{
		throw "You are too far away."; 
	};
	_grinderUID = _door getVariable ["ExileGrinderUID", ""];
	if !(_grinderUID isEqualTo (getPlayerUID _playerObject)) then 
	{
		throw "You aren't the grinder!";	
	};
	if !("Exile_Item_Grinder" in (magazines _playerObject)) then 
	{
		throw "You do not have a grinder."; 
	};
	if !("Exile_Magazine_Battery" in (magazines _playerObject)) then 
	{
		throw "You do not have a battery."; 
	};
	if ((_door animationPhase 'DoorRotation') > 0.5) then 
	{
		throw "Please close the door first.";
	};
	_databaseID = _door getVariable ["ExileDatabaseID",0];
	if(_databaseID isEqualTo 0) then 
	{
		throw "Something went goof";
	};
	_soundSource = _door getVariable ["ExileGrinderSound", objNull];
	if !(isNull _soundSource) then 
	{
		deleteVehicle _soundSource;
	};
	_playerObject removeItem "Exile_Magazine_Battery";
	_door setVariable ["ExileIsLocked", "", true];
	_door setVariable ["ExileAccessCode", "000000"];
	_door setVariable ["ExileGrindTime", 0, true];
	_door setVariable ["ExileGrinderUID", "", true];
	format["removeDoorLock:%1", _databaseID] call ExileServer_system_database_query_fireAndForget;
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Door is now unlocked!"]]] call ExileServer_system_network_send_to;
}
catch 
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to grind lock!", _exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};