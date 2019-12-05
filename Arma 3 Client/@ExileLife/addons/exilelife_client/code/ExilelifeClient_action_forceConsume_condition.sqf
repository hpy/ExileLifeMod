/**
                    * ExilelifeClient_action_forceConsume_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_target","_item","_result"];
_target = _this select 0;
_item = _this select 1;
_result = "";
try
{
	if (isNull _target) then
	{
		throw "They dont exist...";
	};
	if (isNull player) then
	{
		throw "You dont exist...";
	};
	if !(alive _target) then
	{
		throw "They died! :(";
	};
	if !(alive player) then
	{
		throw "You died! :(";
	};
	if (_target getVariable ['ExileLifeClientIncapacitated', false]) then
	{
		throw "The victim is in a revive state";
	};
	if (player getVariable ['ExileLifeClientIncapacitated', false]) then
	{
		throw "You are in a revive state";
	};
	if (player == _target) then{
		throw "You cant force yourself to do anything - you are weak!";
	};
	if !(_target getVariable ['ExileLifeClientForce', false]) then
	{
		_target setVariable ['ExileLifeClientForce', true, true];
		_target setVariable ['ExileLifeClientForcedBy',netId player,true];
	};
	if (_target getVariable ['ExileLifeClientForcedBy', ""] != netId player) then
	{
		throw "Someone else is already forcing this player!";
	};
	if !([player, _item] call ExileLifeClient_util_playerCargo_contains) then
	{
		throw format["You dont have a %1 on you!",_item];
	};
}
catch
{
	_result = _exception;
};
_result
