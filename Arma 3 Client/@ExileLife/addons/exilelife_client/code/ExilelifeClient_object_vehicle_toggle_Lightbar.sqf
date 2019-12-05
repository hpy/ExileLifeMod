/**
                    * ExilelifeClient_object_vehicle_toggle_Lightbar
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_veh","_toggle","_lightbar"];
_veh = _this select 0;
_toggle = _this select 1;
if (_toggle) then 
{
	_lightbar = "ExileLife_LightObject" createVehicle [0,0,100];
	_lightbar attachTo [_veh,[0,0,0],"light_attach_pos"];
	_veh setVariable ["ExileLifeLights", _lightbar];
} else {
	_lightbar = _veh getVariable ["ExileLifeLights", ""];
	deleteVehicle _lightbar;
};