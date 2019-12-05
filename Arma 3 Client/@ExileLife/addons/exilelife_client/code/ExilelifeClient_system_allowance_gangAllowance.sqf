/**
                    * ExilelifeClient_system_allowance_gangAllowance
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_result"];
try
{ 
	if !(ExileLifeClientAllowanceRequest) then 
	{
		throw false;
	};
	ExileLifeClientAllowanceRequest = false;
	if (isNull player) then
	{
		throw false;
	};
	if !(alive player) then
	{
		throw false;
	};	
	if (ExileLifeClientGang isEqualTo "") then 
	{
		throw false;
	};
	if (ExileLifeClientGang isEqualTo "Rogue") then 
	{
		throw false;
	};
	["gangAllowanceRequest",[]] call ExileClient_system_network_send;	
}
catch
{
	_result = _exception;	
};
true
