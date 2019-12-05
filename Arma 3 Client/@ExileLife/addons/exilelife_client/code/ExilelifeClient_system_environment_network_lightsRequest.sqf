/**
                    * ExilelifeClient_system_environment_network_lightsRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_lightstatus","_position","_distance","_delay","_timetoremove"];
_lightstatus = _this select 0;
_position = _this select 1;
_distance = _this select 2;
_delay = _this select 3;	
_timetoremove = _this select 4; 
try
{
	if (isNull player) then 
	{
		throw "Unknown player!";
	};
	if !(alive player) then 
	{
		throw "Your Dead!"; 
	};
	["lightsRequest",[_lightstatus,_position,_distance,_delay,_timetoremove]] call ExileClient_system_network_send;
}
catch
{
	["ErrorTitleOnly", [_exception]] call ExileClient_gui_toaster_addTemplateToast;
};
