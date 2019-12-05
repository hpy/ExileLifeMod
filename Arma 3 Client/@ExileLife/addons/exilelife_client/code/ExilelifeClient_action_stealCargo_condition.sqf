/**
                    * ExilelifeClient_action_stealCargo_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_vehicle","_jobClassname","_result"];
_vehicle = _this select 0;
_jobClassname = _this select 1;
_result = "";
try
{
	if (isNull player) then
	{
		throw "You dont exist?";
	};
	if !(alive player) then
	{
		throw "You are dead!";
	};
	if (isNull _vehicle) then
	{
		throw "Where is the vehicle?";
	};
    if !(alive _vehicle) then
	{
		throw "The cargo is destroyed!";
	};
	if ((_vehicle distance player) > 10) then
	{
		throw "You are too far from the vehicle!";
	};
    if (_jobClassname == "") then
    {
            throw "The cargo is missing?";
    };
}
catch
{
	_result = _exception;
};
_result
