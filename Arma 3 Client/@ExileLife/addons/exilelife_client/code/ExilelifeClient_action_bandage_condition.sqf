/**
                    * ExilelifeClient_action_bandage_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_player","_result"];
_player = _this;
_result = "";
try
{
	if (isNull _player) then
	{
		throw "They dont exist...";
	};
	if (isNull player) then
	{
		throw "You dont exist...";
	};
	if !(alive _player) then
	{
		throw "They died! :(";
	};
	if (_player getVariable ['ExileLifeClientIncapacitated', false]) then
	{
			throw "The victim is in a revive state";
	};
	if !(alive player) then
	{
		throw "You died! :(";
	};
	if !(_player getVariable ['ExileLifeClientBleeding',false]) then
	{
		throw "It appears the bleeding has stopped!";
	};
	if !([player, 'Exile_Item_Bandage'] call ExileLifeClient_util_playerCargo_contains) then
	{
		throw "You dont have a bandage on you!";
	};
}
catch
{
	_result = _exception;
};
_result
