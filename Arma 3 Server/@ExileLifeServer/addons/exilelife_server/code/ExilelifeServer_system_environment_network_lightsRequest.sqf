/**
                    * ExilelifeServer_system_environment_network_lightsRequest
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

                    private["_sessionID","_parameters","_lightstatus","_position","_distance","_delay","_timetoremove","_player","_locationName","_lightstarted"];
_sessionID = _this select 0;
_parameters = _this select 1;
_lightstatus = _parameters select 0; 
_position = _parameters select 1; 
_distance = _parameters select 2; 
_delay = _parameters select 3;	
_timetoremove = _parameters select 4; 
try 
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (_player isEqualTo objNull) then
	{
		throw "Unknown player is attempting to run this!";
	};
	if !(alive _player) then
	{
		throw format ["Player %1 is not alive!",_player];
	};
	if (isNil "_delay")then
	{
		throw "no delay parameter set!";
	};
	if (isNil "_timetoremove")then
	{
		throw "no timetoremove parameter set!";
	};
	if (_distance isEqualto -1) then
	{
		_locationName = [_position] call ExileClient_util_world_getNearestLocationName;
		if (isNumber(missionConfigFile >> "CfgJobs" >> "CfgGenerators" >> "CfgElectricalGrid" >> _locationName)) then
		{
			_distance = getNumber(missionConfigFile >> "CfgJobs" >> "CfgGenerators" >> "CfgElectricalGrid" >> _locationName);
		}
		else
		{	
			_distance = getNumber(missionConfigFile >> "CfgJobs" >> "CfgGenerators" >> "CfgElectricalGrid" >> "defaultdistance");
		};
	};
	if (_lightstatus isEqualTo 0) then
	{
		_lightstarted = 1; 
	}
	else
	{
		_lightstarted = 0; 
	};
	_timetoremove = _timetoremove + ExileSystemMainTimer + _delay; 
	_delay = _delay + ExileSystemMainTimer;
	ExileLifeLightArray pushBack [_position,_distance,_delay,_timetoremove,_lightstarted];
}
catch
{
	format ["Lights Request: %1",_exception] call ExileServer_util_log;
};
