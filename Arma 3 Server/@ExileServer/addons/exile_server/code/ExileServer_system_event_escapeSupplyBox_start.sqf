/**
                    * ExileServer_system_event_escapeSupplyBox_start
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

                    private["_config","_markerTime","_dropAltitude","_dropRadius","_minDistance","_boxType","_playAreaPosition","_position","_distance","_direction","_randomPosition","_positionThatArmaThinksIsNice","_marker","_box","_itemClassName","_itemCount","_i","_supplySmoke","_parachute"];
if !(getNumber(configFile >> "CfgSettings" >> "Escape" >> "enableEscape") isEqualTo 1) exitWith {};
if (ExileEscapeHasWinner) exitWith {};
_config = configFile >> "CfgSettings" >> "Events" >> "escapeSupplyBox";
_markerTime = getNumber (_config >> "markerTime");
_dropAltitude = getNumber (_config >> "dropAltitude");
_dropRadius = ((getmarkerSize "ExileFuturePlayArea") select 0) - 20;
_minDistance = 20;
_boxType = selectRandom (getArray (_config >> "types"));
_playAreaPosition = getMarkerPos "ExileFuturePlayArea";
_playAreaPosition set [2, 0];
_position = [];
while {_position isEqualTo []} do 
{
	_distance = _minDistance + (random (_dropRadius - _minDistance));
	_direction = random 360;
	_randomPosition = 
	[
		(_playAreaPosition select 0) + _distance * (cos _direction),
		(_playAreaPosition select 1) + _distance * (sin _direction),
		0
	];
	if !(surfaceIsWater _randomPosition) then 
	{
		_positionThatArmaThinksIsNice = _randomPosition findEmptyPosition [0, 25, "Exile_Container_SupplyBox"];
		if !(_positionThatArmaThinksIsNice isEqualTo []) then 
		{
			if !(surfaceIsWater _positionThatArmaThinksIsNice) then 
			{
				_position = _positionThatArmaThinksIsNice;
			};
		};
	};
};
_position set [2, _dropAltitude];
["toastRequest", ["InfoTitleAndText", ["Supply drop incoming!", "ETA 3 Minutes"]]] call ExileServer_system_network_send_broadcast;
_marker = createMarker [ format["ExileSupplyBox%1", diag_tickTime], _position];
_marker setMarkerType "ExileHeart";
uiSleep (60 * 3);
if (ExileEscapeHasWinner) exitWith {};
["toastRequest", ["InfoTitleAndText", ["Supply drop incoming!", "ETA 1 Minute"]]] call ExileServer_system_network_send_broadcast;
uiSleep (60 * 1);
if (ExileEscapeHasWinner) exitWith {};
_box = createVehicle ["Exile_Container_SupplyBox", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_box setPosATL _position;
_box setDir (random 360);
clearBackpackCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
{
	_itemClassName = _x select 0;
	_itemCount = _x select 1;
	for "_i" from 1 to _itemCount do 
	{
		[_box, _itemClassName] call ExileClient_util_containerCargo_add;
	};
}
forEach (getArray (_config >> "BoxTypes" >> _boxType >> "items"));
_supplySmoke = createVehicle ["Exile_Ammo_SmokeShellOrange", getPos _box, [], 0, "CAN_COLLIDE"];
_supplySmoke attachTo [_box, [0, 0, 0.5]];
_parachute = createVehicle ["O_Parachute_02_F", getPos _box, [], 0, "FLY"];
_parachute setPosATL _position;
_parachute setDir (getDir _box);
_box attachTo [_parachute, [0, 0, -1.2]];
waitUntil { ((getPos _box) select 2) < 1.5 };
detach _supplySmoke;
detach _box;
_parachute disableCollisionWith _box;
_box disableCollisionWith _parachute;
_position = getPos _box;
_position set [2, 0];
_box setPos _position;
_box setVelocity [0, 0, 0];
uiSleep (60 * _markerTime);
deleteMarker _marker;