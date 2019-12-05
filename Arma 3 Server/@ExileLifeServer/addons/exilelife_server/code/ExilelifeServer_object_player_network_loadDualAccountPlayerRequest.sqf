/**
                    * ExilelifeServer_object_player_network_loadDualAccountPlayerRequest
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

                    private["_sessionID","_parameters","_choice","_playerObject","_playerUID","_playerDataChar","_ExileLifeplayerData"];
_sessionID = _this select 0;
_parameters = _this select 1;
_choice = _parameters select 0;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player object is null!";
	};
	_playerUID = getPlayerUID _playerObject;
	if (isNil "_playerUID") then
	{
		throw "Player UID is nil!";
	};
	if (_playerUID isEqualTo "") then
	{
		throw "Player UID is an empty string!";
	};
	if (isNil "_choice") then
	{
		throw "Character Selection is nil!";
	};
	if (_choice isEqualTo "") then
	{
		throw "Character Selection is an empty string!";
	};
	_playerObject setVariable ["ExileLifeClientSpawnChoice", _choice];
	_playerDataChar = format["loadPlayer:%1:%2", _playerUID,_choice] call ExileServer_system_database_query_selectSingle;
	_ExileLifeplayerData = format["loadPlayerExileLife:%1:%2", _playerUID, _choice] call ExileServer_system_database_query_selectSingle;
	[_playerDataChar, _playerObject, _playerUID, _sessionID, _ExileLifeplayerData] call ExileServer_object_player_database_load;
}
catch
{
	"loadDualAccountPlayerRequest failed!" call ExileServer_util_log;
	format["loadDualAccountPlayerRequest: %1",_exception] call ExileServer_util_log;
};
true