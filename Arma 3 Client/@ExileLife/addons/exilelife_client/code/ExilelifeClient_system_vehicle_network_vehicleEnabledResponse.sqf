/**
                    * ExilelifeClient_system_vehicle_network_vehicleEnabledResponse
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
if !(_vehicle getVariable ["ExileLifeVehicleDisabled",false]) then {
    _vehicle setHit ["engine", 0];
    _vehicle setHit ["motor", 0]; 
    player action ["engineOn", _vehicle];
};
