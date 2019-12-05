/**
                    * ExilelifeClient_action_drawBlood_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_targetType","_cancel","_target"];
_targetType = _this;
_cancel = "";
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
	if !(_target getVariable ['ExileLifeClientForce', false]) then
	{
		_target setVariable ['ExileLifeClientForce', true, true];
		_target setVariable ['ExileLifeClientForcedBy',netId player,true];
	};
	if (_target getVariable ['ExileLifeClientForcedBy', ""] != netId player) then
	{
		throw "Someone else is already forcing this player to drink!";
	};
	if !([player,"ExileLife_Item_BloodDrawKit"] call ExileLifeClient_util_playercargo_contains) then 
	{
		throw "You don't have a blood draw kit";
	};
	if !([player,"ExileLife_Item_BloodVial_Empty"] call ExileLifeClient_util_playercargo_contains) then 
	{
		throw "You don't have an empty blood vial";
	};
	if !([player, "ExileLife_Item_BloodVial_O_Pos_01"] call ExileClient_util_playerCargo_canAdd) then 
	{
		throw "You do not have enough room in your inventory";
	};
}
catch 
{
	_cancel = _exception;
};
_cancel