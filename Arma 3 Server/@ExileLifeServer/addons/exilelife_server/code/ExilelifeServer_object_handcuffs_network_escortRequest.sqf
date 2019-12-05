/**
                    * ExilelifeServer_object_handcuffs_network_escortRequest
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

                    private["_sessionID","_parameters","_victimNetID","_player","_victim"];
_sessionID = _this select 0;
_parameters = _this select 1;
_victimNetID = _parameters select 0;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "Unknown player - you cannot escort them!";
	};
	if !(alive _player) then
	{
		throw "The dead cannot escort others! Not afraid of no ghost!";
	};
	_victim = objectFromNetID _victimNetID;
	if (isNull _victim) then
	{
		throw "Cannot escort an unknown victim!";
	};
    if !(alive _victim) then
    {
        throw "Cannot force the dead to to be escorted!";
    };
    if (_victim getVariable ['ExileLifeClientUnconscious',false]) then
    {
        throw "Cannot escort an unconcious player!";
    };
    if (_victim getVariable ['ExileLifeClientIncapacitated',false]) then
    {
        throw "Cannot escort an incapacitated player!";
    };
	if !(_victim getVariable ["ExileIsHandcuffed", false]) then
	{
		throw "Cannot escort a non-handcuffed player!";
	};
	if (_victim getVariable ["ExileLifeIsForcedDown", false]) then
	{
		throw "Cannot escort a seated player!";
	};
    _victim setVariable ["ExileLifeEscort", _player];
	_victim setVariable ["ExileLifeisEscorted", true, true];
	_victim setVariable ["ExileLifeIsForcedUp", true, true];
	_victim setVariable ["ExileLifeIsForcedDown", false, true];
	_player setVariable ["ExileLifeIsEscorting", _victimNetID, true];
	_player setVariable ["ExileLifeisEscortingChk", true, true];
	[_player, "escortRequest", [netId _victim, True]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileServer_util_log;
};
