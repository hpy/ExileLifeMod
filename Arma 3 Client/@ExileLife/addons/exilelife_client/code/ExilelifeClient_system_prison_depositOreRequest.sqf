/**
                    * ExilelifeClient_system_prison_depositOreRequest
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
	if (ExileClientIsWaitingForServerTradeResponse) then
	{
		throw false;
	};
	ExileClientIsWaitingForServerTradeResponse = true;
	if (isNull player) then
	{
		throw false;
	};
	if !(alive player) then
	{
		throw false;
	};
	if !(player getVariable ["ExileLifePrisoner",false]) then
	{
		throw false;
	};
	["depositOreRequest",[]] call ExileClient_system_network_send;
}
catch
{
	_response = _exception;
};
_response