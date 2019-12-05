/**
                    * ExileServer_system_escape_extractionHeliHover
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

                    private["_heli","_heliZ","_stopZ","_pitchBank","_pitch","_bank","_newSpeedX","_newSpeedY","_heliSpeed","_speedX","_speedY","_speedZ","_newSpeedZ","_Pitch","_Bank"];
_heli = vehicle _this;
_heliZ = (getPosATL _heli) select 2;
_stopZ = 6;
while {_heliZ > _stopZ} do 
{
	_heliZ = (getPosATL _heli) select 2;
	sleep 0.3;
};
_heli land "NONE";
_heli disableAI "MOVE";
_pitchBank = _heli call BIS_fnc_getPitchBank;
_pitch = _pitchBank select 0;
_bank = _pitchBank select 1;
_newSpeedX = 0;
_newSpeedY = 0;
if (_pitch > -5 ) then {_pitch = _pitch - 0.1} else {_pitch = _pitch + 0.1};
if (_bank  > 0  ) then {_bank = _bank - 0.1} else {_bank = _bank + 0.1};
_heliSpeed =  velocity _heli;
_speedX = _heliSpeed select 0;
_speedY = _heliSpeed select 1;
_speedZ = _heliSpeed select 2;
if (_speedX > 0) then {_newSpeedX = _speedX / 1.01;};
if (_speedY > 0) then {_newSpeedY = _speedY / 1.01;};
if (_speedZ > 0) then {_newSpeedZ = _speedZ / 1.0001;};
[_heli, _Pitch,_Bank] call BIS_fnc_setPitchBank;
_heli setVelocity [_newSpeedX,_newSpeedY,_speedZ];
'Extraction heli - Hovering...' call ExileServer_util_log;
true