/**
                    * ExilelifeClient_system_environment_network_lightsResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_lightstatus","_position","_distance","_lights","_lighthealth","_i","_light"];
_lightstatus = _this select 0;
_position = _this select 1;
_distance = _this select 2;
switch (_lightstatus) do 
{
	case 0: {_lightstatus = false};
	case 1: {_lightstatus = true};
};
_lights = nearestObjects [
_position, 
[
"Land_LightHouse_F",
"Land_Lighthouse_small_F",
"Land_LampAirport_F",
"Land_LampDecor_F",
"Land_LampHalogen_F",
"Land_LampHarbour_F",
"Land_LampShabby_F",
"Land_LampSolar_F",
"Land_LampStreet_F",
"Land_LampStreet_small_F",
"Land_FloodLight_F",
"Land_PortableLight_single_F",
"Land_PortableLight_double_F",
"Land_PowerPoleWooden_L_F"
], 
_distance];
switch (_lightstatus) do 
{
	case 0: {_lighthealth = 0.97};
	case 1: {_lighthealth = 0};
};
if (count _lights > -1) then
{
	for "_i" from 0 to ((count _lights) - 1) step 1 do
	{	
		_light = _lights select _i;
		if ((damage _light) < 0.98) then
		{
			_light setHit ["light_1_hitpoint", _lighthealth]; 	
			_light setHit ["light_2_hitpoint", _lighthealth];
			_light setHit ["light_3_hitpoint", _lighthealth];
			_light setHit ["light_4_hitpoint", _lighthealth];	
		};
	};
};
