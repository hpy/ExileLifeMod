/**
                    * ExilelifeServer_object_player_network_updatePlayerInfoRequest
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

                    private["_sessionID","_package","_playerObject","_charFName","_charLName","_charAge","_charReason","_charNumber"];
_sessionID = _this select 0;
_package = _this select 1;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player object is null!";
	};
	_charFName = _package select 0;
	_charLName = _package select 1;
	_charAge = _package select 2;
	_charReason = _package select 3;
	_charNumber = _package select 4;
	if ((_charFName isEqualTo "") || (_charLName isEqualTo "")) then
	{
		throw format["%1 (%2) managed to set their name as blank",name _playerObject, getPlayerUID _playerObject];
	};
	if (_charAge isEqualTo "") then
	{
		throw format["%1 (%2) managed to set their age as blank",name _playerObject, getPlayerUID _playerObject];
	};
	if (_charReason isEqualTo "") then
	{
		throw format["%1 (%2) managed to set their reason as blank",name _playerObject, getPlayerUID _playerObject];
	};
	if (!(_charNumber isEqualTo "character1") && !(_charNumber isEqualTo "character2")) then
	{
		throw format["%1 (%2) is requesting update for %3",name _playerObject, getPlayerUID _playerObject, _charNumber];
	};
	format["updatePlayerInfo:%1:%2:%3:%4:%5:%6",_charFName,_charLName,_charAge,_charReason,getPlayerUID _playerObject,_charNumber] call ExileServer_system_database_query_fireAndForget;
}
catch
{
	"updatePlayerInfoRequest failed!" call ExileLifeServer_util_log;
	_exception call ExileLifeServer_util_log;
};
true