/**
                    * ExilelifeServer_system_environment_stopSound
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

                    private["_objectnetID","_index","_object","_soundnetID","_sound","_tempobjectnetID","_tempindex","_stopsound"];
_objectnetID = _this select 0;
_index =  _this select 1;
try 
{
	_object = objectFromNetId _objectnetID;
	if (isNull _object) then 
	{
		throw "Unknown object - cannot stop sound!";
	};
	_soundnetID = _object getVariable ["ExileLifeSoundID",""];
	_sound = objectFromNetId _soundnetID;
	if (isNull _sound) then 
	{
		throw "Unknown sound object - cannot stop sound!";
	};
	deleteVehicle _sound; 
	_object setVariable ["ExileLifeSoundID",nil];			
	if !(isNil "_index") then
	{
		ExileLifeSoundArray deleteAt _index;
	}
	else
	{
		{
			_tempobjectnetID = _x select 0;
			_tempindex = _forEachIndex;
			if (_tempobjectnetID isEqualTo _objectnetID) then
			{ 
				if (_x select 5) then
				{
					ExileLifeSoundArray deleteAt _tempindex;
				};
			};
		} 
		forEach ExileLifeSoundArray;
	};
	_stopsound = true;
}
catch
{
	format ["stopSound Error - %1",_exception] call ExileServer_util_log;
	_stopsound = false;
};
_stopsound