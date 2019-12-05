#include "script.h"
private ["_scancode", "_scancode_sw", "_keybind"];
_scancode = _this select 1;
_keybind = ["Task Force Radio", "SWTransmit"] call ExileLifeClient_system_keybinding_get;
if !(_keybind isEqualTo []) then {
	_scancode_sw = (_keybind) select 0;
	if (_scancode == _scancode_sw) then {
		call TFAR_fnc_onSwTangentReleased;
	};
};
false