/**
                    * ExilelifeClient_action_breakCementShoes_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_target","_result","_tools"];
_target = _this;
_result = "";
try
{
	if (isNull player) then
	{
		throw "You dont exist...";
	};
	if !(alive player) then
	{
		throw "Well that was unfortunate...";
	};
	if (isNull _target) then
	{
		throw "What happened?";
	};
	if !(alive _target) then
	{
		throw "They died...";
	};
	if (_target getVariable ['ExileLifeClientIncapacitated', false]) then
	{
			throw "The victim is in a revive state";
	};
	if !(_target getVariable ['ExileIsHandcuffed', false]) then
	{
		throw "They are not handcuffed!";
	};
	if !(_target getVariable ['ExileLifeIsForcedUp', false]) then
	{
		throw "They need to be standing!";
	};
	if (_target getVariable ['ExileLifeisEscorted', false]) then
	{
		throw "They are currently being escorted!";
	};
	if !(_target getVariable ['ExileLifeCementShoes', false]) then
	{
		throw "They dont have concrete shoes?";
	};
	_tools = [player,"Exile_Item_Hammer"] call ExileLifeClient_util_playercargo_contains;
	if !(_tools) then
	{
		throw false;
	};
}
catch
{
	_result = _exception;
};
_result
