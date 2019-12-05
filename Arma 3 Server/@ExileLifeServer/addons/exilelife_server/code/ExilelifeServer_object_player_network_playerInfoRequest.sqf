/**
                    * ExilelifeServer_object_player_network_playerInfoRequest
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

                    private["_sessionID","_package","_playerObject","_info","_pid","_prisonerID"];
_sessionID = _this select 0;
_package = _this select 1;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player object is null!";
	};
	_info = format["getPlayerInfo:%1:%2",getPlayerUID _playerObject, _package select 0] call ExileServer_system_database_query_selectSingle;
	_pid = _info select 4;
	_info deleteAt 4;
	_prisonerID = _pid call ExileLifeServer_system_session_createPrisonerID;
	[_sessionID, "playerInfoResponse", [_info,_prisonerID]] call ExileServer_system_network_send_to;
}
catch
{
	"playerInfoRequest failed!" call ExileLifeServer_util_log;
	_exception call ExileLifeServer_util_log;
};
true
