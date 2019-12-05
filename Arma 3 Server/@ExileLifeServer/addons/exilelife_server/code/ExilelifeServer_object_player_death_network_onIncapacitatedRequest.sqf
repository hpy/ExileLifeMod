/**
                    * ExilelifeServer_object_player_death_network_onIncapacitatedRequest
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

                    private["_sessionID","_parameters","_targetNetID","_killerNetID","_instigatorNetID","_killer","_instigator","_player","_victim","_response"];
_sessionID = _this select 0;
_parameters = _this select 1;
_targetNetID = _parameters select 0;
_killerNetID = _parameters select 1;
_instigatorNetID = _parameters select 2;
_killer = objectFromNetId _killerNetID;
_instigator = objectFromNetId _instigatorNetID;
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
    if (_player getVariable ['ExileLifeClientIncapacitated', false]) then
    {
        throw "player is already incapacitated!";
    };
    _victim = objectFromNetId _targetNetID;
    if (isNull _victim) then
    {
        throw "victim doesnt exist!";
    };
    if !(alive _victim) then
    {
        throw "victim is already dead!";
    };
    if (_victim getVariable ['ExileLifeClientIncapacitated', false]) then
    {
        throw "victim is already incapacitated!";
    };
    if !((typeOf _victim) isEqualTo "Exile_Unit_Player" || (typeOf _victim) isEqualTo "ExileLife_Unit_Guard") then 
    {
        throw "You can only kill players.";
    };
    if (_player != _victim) then
    {
        throw format["HACK ATTEMPT BY: %1 UID: %2!!! You cannot attempt to incapacitate someone other than yourself!",_player,getPlayerUID _player];
    };
    _response = [_victim,_killer,_instigator] call ExileLifeServer_object_player_death_event_onKilled;
    _victim setVariable ['ExileLifeClientIncapacitated', true];
    ["onIncapacitatedResponse",[_targetNetID]] call ExileLifeServer_system_network_send_broadcastJIP;
    if (_victim getVariable ["ExileIsHandcuffed", false]) then
	{
        [_victim, "freeRequest", [""]] call ExileServer_system_network_send_to;
        _victim setVariable ['ExileLifeCementShoes',false,true];
        _victim setVariable ["ExileIsHandcuffed", false, true];
        _victim setVariable ["ExileHostageTakerNetID", nil];
        _victim setVariable ["ExileHostageTakerUID", nil];
        _victim setVariable ["ExileLifeisEscorted", false, true];
        _victim setVariable ["ExileLifeIsForcedUp", false, true];
        _victim setVariable ["ExileLifeIsForcedDown", false, true];
        _victim setVariable ["ExileLifeIsForcedGetIn", false, true];
	};
}
catch
{
    _exception call ExileServer_util_log;
};
