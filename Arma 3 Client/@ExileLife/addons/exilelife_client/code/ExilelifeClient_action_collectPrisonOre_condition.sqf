/**
                    * ExilelifeClient_action_collectPrisonOre_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_vehicleNetID","_result","_vehicle"];
_vehicleNetID = _this;
_result = "";
_vehicle = objectFromNetId _vehicleNetID;
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
		throw "You need the cargo transport to move the ore!";
	};
	if (isEngineOn _vehicle) then
	{
		throw "Please turn off the vehicles engine first!";
	};
	if ((locked _vehicle) isEqualTo 2) then
	{
		throw "Please unlock the vehicle first!";
	};
	if !(local _vehicle) then
	{
		throw "Please get in as driver first and retry. Only the driver is permitted to start this process!";
	};
	if ((_vehicle distance player) > 10) then
	{
		throw "Your vehicle is parked too far away!";
	};
}
catch
{
	_result = _exception;
};
_result
