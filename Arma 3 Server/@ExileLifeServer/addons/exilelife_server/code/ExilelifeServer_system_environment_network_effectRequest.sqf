/**
                    * ExilelifeServer_system_environment_network_effectRequest
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

                    private["_sessionID","_parameters","_positions","_timedelete","_effect","_delay","_smoke","_fire","_player"];
_sessionID = _this select 0;
_parameters = _this select 1;
_positions = _parameters select 0; 
_timedelete = _parameters select 1; 
_effect = _parameters select 2;
_delay = _parameters select 3;
_smoke = "";
_fire = "";
try
{
    _player = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _player) then
    {
        throw "player doesnt exist!"; 
    };
    if (_effect isEqualTo "") then
    {
        throw "Invalid effect!"; 
    };
     _timedelete = _timedelete + ExileSystemMainTimer + _delay; 
    _delay = _delay + ExileSystemMainTimer;
    {
        ExileLifeEffectArray pushBack [_x,_effect,_delay,_timedelete,false,[]];
    }forEach _positions;
}
catch
{
    format ["EffectRequest: %1",_exception] call ExileServer_util_log;   
};
//