/**
                    * ExileServer_object_vehicle_event_onGetOut
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

                    private["_vehicleObject"];
_vehicleObject = _this select 0;
if (_vehicleObject getVariable ["ExileIsPersistent", false]) then
{
	_vehicleObject call ExileServer_system_vehicleSaveQueue_addVehicle;
};
true