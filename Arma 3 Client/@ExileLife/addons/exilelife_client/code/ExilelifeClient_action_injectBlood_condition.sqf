/**
                    * ExilelifeClient_action_injectBlood_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_targetType","_item","_target","_result"];
_targetType = _this select 0;
_item = _this select 1;
switch(_targetType)do{
	case 0:{
		_target = player;
	};
	case 1:{
		_target = ExileClientInteractionObject;
	};
	default {
		_target = player;
	};
};
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
	if (player getVariable ['ExileLifeClientIncapacitated', false]) then
	{
		throw "You are in a revive state";
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
		throw "You dont have a blood vial on you!";
	};
	if !([player, "ExileLife_Item_AutoInjector"] call ExileLifeClient_util_playerCargo_contains) then
	{
		throw "You dont have an autoInjector on you!";
	};
}
catch
{
	_result = _exception;
};
_result
