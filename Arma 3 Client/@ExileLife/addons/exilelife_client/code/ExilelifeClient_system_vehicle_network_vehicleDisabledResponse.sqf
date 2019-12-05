/**
                    * ExilelifeClient_system_vehicle_network_vehicleDisabledResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_vehicleID","_vehicle"];
_vehicleID = _this select 0;
_vehicle = objectFromNetId _vehicleID;
if (isNull _vehicle) exitWith{};
if (_vehicle getVariable ["ExileLifeVehicleDisabled",false]) then {
    _vehicle setHit ["engine", 1];
    _vehicle setHit ["motor", 1]; 
    player action ["engineOff", _vehicle];
};
["Vehicle Disabled!"] spawn ExileLifeClient_gui_baguette_show;
