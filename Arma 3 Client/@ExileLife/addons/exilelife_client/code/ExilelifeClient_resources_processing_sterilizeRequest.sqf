/**
                    * ExilelifeClient_resources_processing_sterilizeRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_container","_containerNetID","_containernetID","_success"];
_container = _this;
try 
{
	if (isNull player) then
	{
		throw false; 
	};
	if !(alive player) then
	{
		throw false; 
	};
	if (isNull _container) then
	{
		throw false;
	};	
	if ((player distance _container) > 10) then 
	{
		throw false;
	};
	[player, "ExileLife_Item_bleach"] call ExileClient_util_playerCargo_remove;
	_containerNetID = netID _container;
	["sterilizeRequest",[_containernetID]] call ExileClient_system_network_send;
}
catch
{
	_success = _exception;
};
_success
