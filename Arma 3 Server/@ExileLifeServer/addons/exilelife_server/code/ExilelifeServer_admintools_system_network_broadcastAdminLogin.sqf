/**
                    * ExilelifeServer_admintools_system_network_broadcastAdminLogin
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

                    private["_sessionID","_package","_powerLevel","_playerObject","_log"];
_sessionID = _this select 0;
_package = _this select 1;
_name = _package select 0;
_powerLevel = _package select 1;
_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
if (!isNull _playerObject) then
{
    _playerObject setVariable ["ExileLife_AT_Logged_In",true,true];
    ["systemChatRequest",[format["%1 %2 has logged into their admin tools!",_powerLevel, _name]]] call ExileServer_system_network_send_broadcast;
    _log = format ["%1 %2 (%3) has logged into their tools",_powerLevel,_name,getPlayerUID _playerObject];
    [_log,"AT_Logins"] call ExileLifeServer_util_A3Log;
    ExileLifeToolsLog_AdminLogin pushBack _log;
};
