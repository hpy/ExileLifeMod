/**
                    * ExilelifeServer_system_environment_network_playSoundRequest
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

                    private["_sessionID","_parameters","_objectnetID","_soundtype","_timedelete","_loop","_delay","_player","_object"];
_sessionID = _this select 0;
_parameters = _this select 1;
_objectnetID = _parameters select 0;
_soundtype = _parameters select 1;
_timedelete = _parameters select 2; 
_loop = _parameters select 3;
_delay = _parameters select 4;
try 
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "player doesnt exist!"; 
	};
	_object = objectFromNetId _objectnetID;
	if (isNull _object) then 
	{
		throw "Unknown object - cannot play a sound!";
	};
	if (_soundtype isEqualTo "") then
	{
		throw "Invalid sound!";	
	};
	if (_timedelete <= 0) then
	{
		if (isText((ConfigFile >> "CfgVehicles" >> _soundtype >> "sound"))) then 
		{
			_timedelete = getNumber((ConfigFile >> "CfgVehicles" >> _soundtype >> "time"));
			_timedelete = _timedelete + ExileSystemMainTimer;
		};
	}
	else
	{
		_timedelete = _timedelete + ExileSystemMainTimer + _delay; 
	};
	_delay = _delay + ExileSystemMainTimer;
	ExileLifeSoundArray pushBack [_objectnetID,_soundtype,_loop,_delay,_timedelete,false];
}
catch
{
	format ["Playsound: %1",_exception] call ExileServer_util_log;
};
