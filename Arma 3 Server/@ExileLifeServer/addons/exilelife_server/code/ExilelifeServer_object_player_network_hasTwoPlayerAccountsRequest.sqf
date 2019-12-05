/**
                    * ExilelifeServer_object_player_network_hasTwoPlayerAccountsRequest
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

                    private["_sessionID","_player","_hasDualAccountAccess","_hasGuardAccess"];
_sessionID = _this select 0;
_player = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (isNull _player) then
	{
		throw "Player object is null!";
	};
	_uid = getPlayerUID _player;
	if (isNil "_uid") then
	{
		throw "getPlayerUID returned nil!";
	};
	if (_uid isEqualTo "") then
	{
		throw "getPlayerUID returned an empty string!";
	};
	_hasDualAccountAccess = format["hasDualAccountStatus:%1", _uid] call ExileServer_system_database_query_selectSingleField;
	_hasGuardAccess = format["hasGuardAccess:%1", _uid] call ExileServer_system_database_query_selectSingleField;
	_player setVariable ["ExileLifeDualAccounts",_hasDualAccountAccess];
	_player setVariable ["ExileLifeHasGuardAccess",_hasGuardAccess];
	[_sessionID, "hasTwoPlayerAccountsResponse", [_hasDualAccountAccess,_hasGuardAccess]] call ExileServer_system_network_send_to;
}
catch
{
	"hasTwoPlayerRequest failed!" call ExileServer_util_log;
	_exception call ExileServer_util_log;
};
true
