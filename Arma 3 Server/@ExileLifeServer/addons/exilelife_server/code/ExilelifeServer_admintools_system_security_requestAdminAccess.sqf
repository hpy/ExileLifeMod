/**
                    * ExilelifeServer_admintools_system_security_requestAdminAccess
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

                    private["_sessionID","_requestingAdminObject","_tempObject","_playerUID","_playerName","_accessCheck","_permissionLevel","_locked","_disabled","_permissions","_displayName","_log"];
_sessionID = _this select 0;
_requestingAdminObject = _this select 1;
try
{
    _tempObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _tempObject) then
    {
        throw [2];
    };
    if (isNull _requestingAdminObject) then
    {
        throw [2];
    };
    _playerUID = _requestingAdminObject getVariable ["ExileOwnerUID", ""];
    _playerName = _requestingAdminObject getVariable ["ExileName",""];
    [format["Player %1 (%2) requesting access to admin tools... Processing...",_playerName,_playerUID],"AT_Logins"] call ExileLifeServer_util_A3Log;
    if (_requestingAdminObject getVariable ["ExileLifeTools_AlreadyReceived",false]) then
    {
        throw [5];
    };
    _accessCheck = format["getAdmin:%1",_playerUID] call ExileServer_system_database_query_selectSingle;
    if (isNil "_accessCheck") then
    {
        throw [1,"Player does not have access to our tools"];
    };
    _accessCheck params ["_permissionLevel","_locked","_disabled"];
    if (_disabled isEqualTo 1) then
    {
        throw [4];
    };
    if (_locked isEqualTo 1) then
    {
        throw [0];
    };
    _permissions = _permissionLevel call ExileLifeServer_admintools_util_permissions_compile;
    if !(count(_permissions) isEqualTo 3) then
    {
        throw [3];
    };
    if
    (
        (_permissions select 0) isEqualTo []
        ||
        (_permissions select 1) isEqualTo []
        ||
        (_permissions select 2) isEqualTo []
    ) then
    {
        throw [6];
    };
    _displayName = getText (configFile >> "CfgExileLifePermissions" >> _permissionLevel >> "displayName");
    [format["%1 %2 (%3) has been cleared for access",_displayName,_playerName,_playerUID],"AT_Logins"] call ExileLifeServer_util_A3Log;
    ExileLife_AT_MainCode = {};
    (owner _tempObject) publicVariableClient "ExileLife_AT_MainCode";
    _requestingAdminObject setVariable ["ExileLifeTools_Logged_In",false,true];
    _requestingAdminObject setVariable ["ExileLifeTools_Currently_Locked",0];
    _requestingAdminObject setVariable ["ExileLifeTools_AlreadyReceived",true];
    _requestingAdminObject setVariable ["ExileLifeTools_FunctionNames",_permissions select 2];
    [_displayName,_permissions] remoteExec ["ExileLife_AT_MainCode",owner _tempObject];
    ExileLifeLogs_Server_AdminLogin pushBack format["%1 %2 (%3) has been cleared for access",_displayName,_playerName,_playerUID];
}
catch
{
    _log = "";
    switch (_exception select 0) do
    {
        case 0:
        {
            _requestingAdminObject setVariable ["ExileLifeTools_Currently_Locked",1];
            _log = format ["Player %1 (%2) has a lock on their account. Access denied",_playerName,_playerUID];
            [_log,"AT_Logins"] call ExileLifeServer_util_A3Log;
            [_sessionID,"toastRequest",["ErrorTitleAndText",["Exile Life Tools","You are locked out of your tools. Contact an System Admin if you believe this is a mistake!"]]] call ExileServer_system_network_send_to;
        };
        case 1:
        {
            [{ player setDamage 666 }, owner _requestingAdminObject] call ExileLifeServer_admintools_system_remoteCall;
            format ["#exec ban %1", str(_playerUID)] call ExileServer_system_rcon_event_sendCommand;
            _log = format ["%1 (%2) banned! [BANNED BY 'SYSTEM' (666)] Reason: '%3'",_playerName,_playerUID, _exception select 1];
            [_log,"AT_Ban"] call ExileLifeServer_util_A3Log;
            _log = format ["Player %1 (%2) tried to log into our tools. Message: '%3'",_playerName,_playerUID, _exception select 1];
            [_log,"AT_HackAttempts"] call ExileLifeServer_util_A3Log;
        };
        case 2:
        {
            _log = format ["Player object requesting admin access is null. SessionID: %1", _sessionID];
        };
        case 3:
        {
            _log = format["%1 (%2) requested a permission level (%3) that doesn't exist in CfgExileLifePermissions",_playerName,_playerUID, _permissionLevel];
        };
        case 4:
        {
            _log = format["%1 (%2) is disabled, check this out because we shouldn't be getting this error!",_playerName,_playerUID];
        };
        case 6:
        {
            _log = format["%1 (%2) has fucked up permissions... Check this out! %3",_playerName,_playerUID,_permissions];
        };
    };
    [_log,"AT_Logins"] call ExileLifeServer_util_A3Log;
};
ExileLife_AT_MainCode = nil;