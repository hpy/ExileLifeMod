/**
                    * ExilelifeClient_system_allowance_prisonAllowanceRetrieveRequest
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
	if (ExileLifeClientAllowanceRequest) then 
	{
		throw false;
	};
	ExileLifeClientAllowanceRequest = true;
	ExileLifeClientPrisonAllowance = -1;
	if (isNull player) then
	{
		throw false;
	};
	if !(alive player) then
	{
		throw false;
	};	
	if (ExileLifeClientGang isEqualTo "Guard") then 
	{
		throw false;
	};
	["prisonAllowanceRetrieveRequest",[]] call ExileClient_system_network_send;	
}
catch
{
	_result = _exception;	
};
true
