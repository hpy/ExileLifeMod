/**
                    * ExilelifeServer_object_lock_network_hackCodeLockRequest
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

                    private["_sessionID","_parameters","_object","_player","_pinCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_object = objectFromNetId (_parameters select 0);
	if (isNull _object) then
	{
	diag_log "1";
		throw "ERROR";
	};
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		diag_log "2";
		throw "ERROR";
	};
	if ((_player distance _object) > 10) then
	{
		diag_log "3";
		throw "ERROR";
	};
	if !("ExileLife_Item_HashCatXL" in (magazines _player)) then
	{	diag_log "4";
		throw "ERROR";
	};
	if !("Exile_Item_Laptop" in (magazines _player)) then
	{	diag_log "5";
		throw "ERROR";
	};
	if (_object call ExileClient_util_world_isInTraderZone) then
	{	diag_log "6";
		throw "ERROR";
	};
	_pinCode = _object getVariable ["ExileAccessCode", "0000"];
	throw _pinCode;
}
catch
{
	[_sessionID, "hackCodeLockResponse", [_exception]] call ExileServer_system_network_send_to;
};
