/**
                    * ExilelifeServer_system_farming_network_plantGardenRequest
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

                    private["_sessionID","_parameters","_gardenNetID","_player","_garden","_gardenID","_delay"];
_sessionID = _this select 0;
_parameters = _this select 1;
_gardenNetID = _parameters select 0;
try
{
    _player = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _player) then
    {
        throw "player doesnt exist!";
    };
    if !(alive _player) then
    {
        throw "player is dead!";
    };
	_garden = objectFromNetId _gardenID;
    if (isNull _garden) then
    {
        throw "Garden doesnt Exist!";
    };
    _delay = 10 + ExileSystemMainTimer; 
	ExileLifeFarmingArray pushBack [_gardenNetID,_delay]; 
}
catch
{
    format ["plantGardenRequest: %1",_exception] call ExileServer_util_log;
};
