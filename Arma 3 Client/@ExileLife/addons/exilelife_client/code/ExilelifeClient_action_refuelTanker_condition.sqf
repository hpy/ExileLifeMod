/**
                    * ExilelifeClient_action_refuelTanker_condition
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
		throw "Your tanker was destroyed!";
	};
	if (isEngineOn _vehicle) then 
	{
		throw "Turn off the engine first! Are you trying to kill us all?";
	};
	if ((locked _vehicle) isEqualTo 2) then 
	{
		throw "Unlock the vehicle first!";
	};
	if !(local _vehicle) then
	{
		throw "Please get in as driver first.";
	};
	if ((_vehicle distance player) > 20) then 
	{
		throw "Your vehicle is parked too far away!";
	};
}
catch 
{
	_result = _exception;
};
_result