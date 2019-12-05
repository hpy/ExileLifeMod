/**
                    * ExilelifeServer_system_environment_startSound
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

                    private["_soundIndex","_objectnetID","_soundtype","_stopsound","_object","_soundID","_sound","_soundNetID"];
_soundIndex = _this select 0;
_objectnetID = _this select 1;
_soundtype = _this select 2;
_stopsound = true;
try 
{
	_object = objectFromNetId _objectnetID;
	if (isNull _object) then 
	{
		ExileLifeSoundArray deleteAt _soundIndex;
		throw "Unknown object - cannot play this sound!";
	};
	_soundID = _object getVariable ["ExileLifeSoundID", ""];
	if !(_soundID isEqualTo "") then
	{
		_stopsound = [_objectnetID] call ExileLifeServer_system_environment_stopSound;
	};
	if !(_stopsound) then
	{
		throw "Error removing sound";
	};
	_sound = createSoundSource [_soundtype, getPos _object, [], 0];
	_sound attachTo [_object, [0, 0, 0]];	
	_soundNetID = netId _sound;
	_object setVariable ["ExileLifeSoundID", _soundNetID];	
}
catch
{
	format ["stopSound Error - %1",_exception] call ExileServer_util_log;
};