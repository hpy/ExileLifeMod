/**
                    * ExilelifeClient_object_lock_hack
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_object","_door","_result"];
_object = _this select 0;
_door = _this select 1;
_result = "";
try
{ 
	if (ExileLifeHackCheck) then
	{
		throw "Hacking in progress...";
	};
	if (ExileClientPlayerIsInCombat) then
	{
		throw "You are in combat!";
	};
	if !("ExileLife_Item_HashCatXL" in (magazines player)) then
	{
		throw "You need the HashCat!";
	};
	if !("Exile_Item_Laptop" in (magazines player)) then
	{
		throw "You need a laptop!";
	};	
	if !(ExileLifeClientClass == "Thief") then
	{
		throw "Only Thieves know how to use this!";
	};	
	if ((_object distance player) > 20) then 
	{
		throw "You are too far away!";
	};
	if ((_this select 1) > -1) then
	{
		throw "The software doesnt work on these locks!";
	}
	else
	{
		switch (locked _object) do 
		{
			case 0:	{ throw "Vehicle is not locked!"; };
			case 1:	{ throw "Vehicle does not have a lock!"; };
		};
		if (isNull ExileClientInteractionObject) then 
		{
			throw "Object doesnt exist";
		};
		ExileLifeHackCheck = true;
		["hackCodeLockRequest", [netId ExileClientInteractionObject]] call ExileClient_system_network_send;
	};
}
catch
{
	_result = _exception;
};
