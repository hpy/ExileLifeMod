/**
                    * ExilelifeClient_system_prison_retrieveOreRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_response"];
_response = true;
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
	if (player getVariable ["ExileLifePrisoner",false]) then
	{
		throw false;
	};
	if !(ExileLifeGuard) then
	{
		throw false;
	};
	["retrieveOreRequest",[]] call ExileClient_system_network_send;	
}
catch
{
	_response = _exception;
};
_response