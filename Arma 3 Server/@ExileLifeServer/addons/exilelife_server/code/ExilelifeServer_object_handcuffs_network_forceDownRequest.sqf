/**
                    * ExilelifeServer_object_handcuffs_network_forceDownRequest
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
 _this spawn
 {
	_sessionID = _this select 0;
	_parameters = _this select 1;
	_victimNetID = _parameters select 0;
	try
	{
		_player = _sessionID call ExileServer_system_session_getPlayerObject;
		if (isNull _player) then
		{
			throw "Unknown player - cannot force them to sit down!";
		};
		if !(alive _player) then
		{
			throw "The dead cannot force others to sit down!";
		};
		_victim = objectFromNetID _victimNetID;
		if (isNull _victim) then
		{
			throw "Cannot force down an unknown victim!";
		};
    	if !(alive _victim) then
    	{
    		throw "Cannot force the dead down!";
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
			throw "Cannot force down a non-handcuffed player!";
		};
		if (_victim getVariable ["ExileLifeisEscorted", false]) then
		{
			throw "Cannot force down an escorted player!";
		};
		if (_victim getVariable ["ExileLifeIsForcedDown", false]) then
		{
			throw "Cannot force down an already sitting player!";
		};
		if !(_victim getVariable ["ExileLifeIsForcedUp", false]) then
		{
			throw "Cannot force down an already sitting player!";
		};
		_victim setVariable ["ExileLifeisEscorted", false, true];
		_victim setVariable ["ExileLifeIsForcedUp", false, true];
		_victim setVariable ["ExileLifeIsForcedDown", true, true];
		_player setVariable ["ExileLifeisEscortingChk", false, true];
        _victim setVariable ["ExileLifeEscort", objNull];
		uisleep 0.1;
		[_victim, "forceDownRequest", [""]] call ExileServer_system_network_send_to;
		uisleep 0.1;
		["switchMoveRequest", [_victimNetID, "Acts_AidlPsitMstpSsurWnonDnon_loop"]] call ExileServer_system_network_send_broadcast;
	}
	catch
	{
		_exception call ExileServer_util_log;
	};
};
