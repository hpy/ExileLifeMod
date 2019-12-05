/**
                    * ExilelifeClient_system_environment_network_playSoundRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_object","_soundtype","_timedelete","_loop","_delay","_objectnetID"];
_object = _this select 0; 
_soundtype = _this select 1; 
_timedelete = _this select 2;
_loop = _this select 3;
_delay = _this select 4;
try
{
	if (isNull player) then 
	{
		throw "Unknown player - cannot play a sound!";
	};
	if !(alive player) then 
	{
		throw "The dead cannot play sounds!"; 
	};
	if (isNull _object) then 
	{
		throw "Unknown object - cannot play a sound!";
	};
	_objectnetID = netID _object;
	["playSoundRequest",[_objectnetID,_soundtype,_timedelete,_loop,_delay]] call ExileClient_system_network_send;
}
catch
{
	["ErrorTitleOnly", [_exception]] call ExileClient_gui_toaster_addTemplateToast;
};
