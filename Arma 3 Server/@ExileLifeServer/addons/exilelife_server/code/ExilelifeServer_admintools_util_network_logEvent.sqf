/**
                    * ExilelifeServer_admintools_util_network_logEvent
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

                    private["_sessionID","_package","_message","_playerObject","_sessionid","_playerUID","_log"];
_sessionID = _this select 0;
_package = _this select 1;
_message = _package select 0;
_playerObject = _sessionid call ExileServer_system_session_getPlayerObject;
_playerUID = "";
if (isNull _playerObject) then
{
    _playerUID = _sessionid;
}
else
{
    _playerUID = getPlayerUID _playerObject;
};
_log = format ["Admin: %1 (%2) EVENT: %3",name _playerObject,_playerUID,_message];
[_log,"AT_Activity"] call ExileLifeServer_util_A3Log;
ExileLifeLogs_Server_AdminActivity pushBack _log;
