/**
                    * ExilelifeClient_system_environment_network_switchLightsRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_lightstatus","_position","_distance"];
_this spawn
{
	_lightstatus = _this select 0;
	_position = _this select 1;
	_distance = _this select 2;
	switch (_lightstatus) do
	{
		case 0: {_lightstatus = false}; 
		case 1: {_lightstatus = true};
	};
	{
		[_x,_lightstatus] call BIS_fnc_switchLamp;
		uisleep 0.1;
	} count nearestObjects [ _position,["Lamps_base_F","PowerLines_base_F","PowerLines_Small_base_F"],_distance];
};
