/**
                    * ExileServer_object_vehicle_createPersistentVehicle
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

                    private["_className","_position","_direction","_usePositionATL","_pinCode","_vehicleObject"];
_className = _this select 0;
_position = _this select 1;
_direction = _this select 2;
_usePositionATL = _this select 3;
_pinCode = _this select 4;
_vehicleObject = [_className, _position, _direction, _usePositionATL] call ExileServer_object_vehicle_carefulCreateVehicle;
_vehicleObject setVariable ["ExileIsPersistent", true];
_vehicleObject setVariable ["ExileAccessCode", _pinCode];
_vehicleObject addEventHandler ["GetOut", {_this call ExileServer_object_vehicle_event_onGetOut}];
_vehicleObject addEventHandler ["GetIn", {_this call ExileServer_object_vehicle_event_onGetIn}];
_vehicleObject addMPEventHandler ["MPKilled", { if !(isServer) exitWith {}; _this call ExileServer_object_vehicle_event_onMPKilled;}];
if (getNumber(missionConfigFile >> "CfgSimulation" >> "enableDynamicSimulation") isEqualTo 1) then 
{
	_vehicleObject enableDynamicSimulation true;
}
else
{
	_vehicleObject call ExileServer_system_simulationMonitor_addVehicle;
};
_vehicleObject
