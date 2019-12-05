/**
                    * ExilelifeClient_system_prisonRecords_jailPlayerRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_prisoner","_mineAmountRequired","_timeToComplete","_result"];
_prisoner = _this select 0;
_mineAmountRequired = _this select 1; 
_timeToComplete = _this select 2; 
_result = false;
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
	if !(ExileLifeGuard) then
	{
		throw false;
	};
	if (isNull _prisoner) then
	{
		throw false;
	};
	if !(alive _prisoner) then
	{
		throw false;
	};
	["jailPlayerRequest",[netID _prisoner,_mineAmountRequired,_timeToComplete]] call ExileClient_system_network_send;
	_result = true;
}
catch
{
	_result = _exception;
};
_result
