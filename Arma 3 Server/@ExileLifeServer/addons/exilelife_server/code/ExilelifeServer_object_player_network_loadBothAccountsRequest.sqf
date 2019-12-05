/**
                    * ExilelifeServer_object_player_network_loadBothAccountsRequest
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

                    private["_sessionID","_playerObject","_playerUID","_hasTwoAccounts","_hasGuardAccess","_playerDataChar1","_ExileLifeplayerData1","_playerDataChar2","_ExileLifeplayerData2"];
_sessionID = _this select 0;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player object is null!";
	};
	_playerUID = getPlayerUID _playerObject;
	_name = name _playerObject;
	if (isNil "_playerUID") then
	{
		throw "Player UID is nil!";
	};
	if (_playerUID isEqualTo "") then
	{
		throw "Player UID is an empty string!";
	};
	_hasTwoAccounts = _playerObject getVariable ["ExileLifeDualAccounts",false];
	_hasGuardAccess = _playerObject getVariable ["ExileLifeHasGuardAccess",false];
	_playerDataChar1 = format["loadPlayer:%1:%2", _playerUID, "character1"] call ExileServer_system_database_query_selectSingle;
	_ExileLifeplayerData1 = format["loadPlayerExileLife:%1:%2", _playerUID, "character1"] call ExileServer_system_database_query_selectSingle;
	if(isNil "_playerDataChar1") then
	{
		_playerDataChar1 = ["bambicharacter"];
	};
	_playerDataChar2 = [];
	_ExileLifeplayerData2 = [];
	if (_hasTwoAccounts) then
	{
		_ExileLifeplayerData2 = format["loadPlayerExileLife:%1:%2", _playerUID, "character2"] call ExileServer_system_database_query_selectSingle;
		_playerDataChar2 = format["loadPlayer:%1:%2", _playerUID, "character2"] call ExileServer_system_database_query_selectSingle;
		if (_hasGuardAccess && !((_ExileLifeplayerData2 select 4) isEqualTo "Guard")) then
		{
			format["updatePlayerToGuard:%1",_ExileLifeplayerData2 select 18] call ExileServer_system_database_query_insertSingle;
			_ExileLifeplayerData2 set [4,"Guard"];
		};
		if (isNil "_playerDataChar2") then
		{
			_playerDataChar2 = ["bambicharacter"];
		};
	};
	[_sessionID,"loadBothAccountsResponse",[_playerDataChar1, _playerDataChar2, _ExileLifeplayerData1,_ExileLifeplayerData2]]call ExileServer_system_network_send_to;
}
catch
{
	"loadBothAccountsRequest failed!" call ExileServer_util_log;
	_exception call ExileServer_util_log;
};
