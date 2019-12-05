/**
                    * ExileServer_object_player_network_tagSpectateRequest
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

                    private["_sessionID","_parameters","_friendNetID","_player","_friend"];
_sessionID = _this select 0;
_parameters = _this select 1;
_friendNetID = _parameters select 0;
try 
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "Unknown player cannot allow spectating!";
	};
	if !(alive _player) then 
	{
		throw "The dead cannot allow spectating!"; 
	};
	_friend = objectFromNetID _friendNetID;
	if (isNull _friend) then 
	{
		throw "Cannot tag unknown player!"; 
	};
	[_friend, "spectateRequest", [_player, name _player]] call ExileServer_system_network_send_to;
	[_player, "spectateResponse", [getPlayerUID _friend, name _friend]] call ExileServer_system_network_send_to;
}
catch 
{
	_exception call ExileServer_util_log;
};