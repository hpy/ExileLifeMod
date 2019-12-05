/**
                    * ExilelifeClient_action_lockpick_house_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_house","_door","_result"];
_house = _this select 0;
_door = _this select 1;
_result = "";
try
{ 
	if (ExileClientPlayerIsInCombat) then
	{
		throw "You are in combat!";
	};
	if (isNull _house) then
	{
		throw "No can do.";
	};
	if !(_house isKindOf "House_F") then
	{
		throw "This is not a house!";
	};
	if !([_house, _door, 1] call ExileLifeClient_util_housing_doorStatusRequest) then 
	{
		throw "This door is not locked!";
	};
	if !("Exile_Item_Knife" in (magazines player)) then
	{
		throw "You need a knife!";
	};
	if ((_house distance player) > 20) then 
	{
		throw "You are too far away!";
	};
}
catch
{
	_result = _exception;
};
_result