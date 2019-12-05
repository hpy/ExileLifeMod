/**
                    * ExilelifeServer_system_rewards_network_claimItemRequest
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

                    private["_sessionID","_parameters","_itemClassName","_containerType","_containerNetID","_playerObject","_vehicleObject","_rewardsData","_index","_current","_amt","_playerUID","_logging","_rewardsLogging","_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_itemClassName = _parameters select 0;
_containerType = _parameters select 1;
_containerNetID = _parameters select 2;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (_playerObject getVariable ["ExileMutex",false]) then
	{
		throw 12;
	};
	_playerObject setVariable ["ExileMutex",true];
	_vehicleObject = objNull;
	if (_containerType isEqualTo 2) then
	{
		_vehicleObject = objectFromNetID(_containerNetID);
	};
	if (isNull _playerObject) then
	{
		throw 1;
	};
	if !(alive _playerObject) then
	{
		throw 2;
	};
	_rewardsData = _playerObject getVariable ["ExileLifeClientPlayerRewards", []];
	_index = [_rewardsData,_itemClassName] call ExileLifeServer_util_searchArray;
	if(_index == -1) then {
		throw 3;
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
	[_sessionID, "claimItemResponse", [0, _itemClassName, _containerType, _containerNetID,_rewardsData]] call ExileServer_system_network_send_to;
	_logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "traderLogging");
	_rewardsLogging = getNumber(configFile >> "CfgRewards" >> "Logging" >> "rewardsLogging");
	if (_logging isEqualTo 1 || _rewardsLogging  isEqualTo 1) then
	{
		format ["PLAYER: ( %1 ) %2 CLAIMED ITEM %3 FROM CLAIM VENDOR",getPlayerUID _playerObject,_playerObject,_itemClassName] call ExileLifeServer_util_debugLog;
	};
	if !(_vehicleObject isEqualTo objNull) then
	{
		_vehicleObject call ExileServer_object_vehicle_database_update;
	}
	else
	{
		_playerObject call ExileServer_object_player_database_update;
	};
}
catch
{
	_responseCode = _exception;
	[_sessionID, "claimItemResponse", [_responseCode, "", 0, "",_rewardsData]] call ExileServer_system_network_send_to;
};
_playerObject setVariable ["ExileMutex",false];
true
