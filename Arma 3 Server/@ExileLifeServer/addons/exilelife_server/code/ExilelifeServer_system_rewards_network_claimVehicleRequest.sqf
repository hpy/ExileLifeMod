/**
                    * ExilelifeServer_system_rewards_network_claimVehicleRequest
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

                    private["_sessionID","_parameters","_vehicleClass","_pinCode","_playerObject","_rewardsData","_index","_current","_amt","_playerUID","_position","_vehicleObject","_logging","_rewardsLogging","_itemClassName","_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleClass = _parameters select 0;
_pinCode = _parameters select 1;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw 1;
	};
	if !(alive _playerObject) then
	{
		throw 2;
	};
	if (_playerObject getVariable ["ExileMutex",false]) then
	{
		throw 12;
	};
	_playerObject setVariable ["ExileMutex", true];
	if !((count _pinCode) isEqualTo 4) then
	{
		throw 11;
	};
	_rewardsData = _playerObject getVariable ["ExileLifeClientPlayerRewards", []];
	_index = [_rewardsData,_vehicleClass] call ExileLifeServer_util_searchArray;
	if(_index == -1) then {
		throw 5;
	};
	_current = _rewardsData select _index;
	_amt = (_current select 1)-1;
	if(_amt <= 0) then {
		_rewardsData deleteAt _index;
	} else {
		_rewardsData set [_index, [(_current select 0),_amt]];
	};
	_playerObject setVariable ["ExileLifeClientPlayerRewards", _rewardsData];
	_playerUID = _playerObject getVariable ["ExileOwnerUID", -1];
	format["setPlayerRewards:%1:%2", _rewardsData, _playerUID] call ExileServer_system_database_query_fireAndForget;
	if (_vehicleClass isKindOf "Ship") then
	{
		_position = [(getPosATL _playerObject), 100, 20] call ExileClient_util_world_findWaterPosition;
		_vehicleObject = [_vehicleClass, _position, (random 360), false, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
	}
	else
	{
		_position = (getPos _playerObject) findEmptyPosition [10, 250, _vehicleClass];
		if (_position isEqualTo []) then
		{
			throw 13;
		};
		_vehicleObject = [_vehicleClass, _position, (random 360), true, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
	};
	_vehicleObject setVariable ["ExileOwnerUID", (getPlayerUID _playerObject)];
	_vehicleObject setVariable ["ExileLifeOwnerPID",_playerObject getVariable ["ExileLifePID",-1]];
	_vehicleObject setVariable ["ExileIsLocked",0];
	_vehicleObject lock 0;
	_vehicleObject call ExileServer_object_vehicle_database_insert;
	_vehicleObject call ExileServer_object_vehicle_database_update;
	[_sessionID, "claimVehicleResponse", [0, netId _vehicleObject,_rewardsData]] call ExileServer_system_network_send_to;
	_logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "traderLogging");
	_rewardsLogging = getNumber(configFile >> "CfgRewards" >> "Logging" >> "rewardsLogging");
	if (_logging isEqualTo 1 || _rewardsLogging  isEqualTo 1) then
	{
		format ["PLAYER: ( %1 ) %2 CLAIMED ITEM %3 FROM CLAIM VENDOR",getPlayerUID _playerObject,_playerObject,_itemClassName] call ExileLifeServer_util_debugLog;
	};
}
catch
{
	_responseCode = _exception;
	[_sessionID, "claimVehicleResponse", [_responseCode, "",_rewardsData]] call ExileServer_system_network_send_to;
};
if !(isNull _playerObject) then
{
	_playerObject setVariable ["ExileMutex", false];
};
true
