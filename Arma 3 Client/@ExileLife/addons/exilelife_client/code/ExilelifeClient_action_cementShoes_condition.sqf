/**
                    * ExilelifeClient_action_cementShoes_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_target","_result","_ingredients"];
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
		throw "What happened to your Prisoner?";
	};
	if !(alive _target) then
	{
		throw "Your meant to kill him AFTER you finish making the concrete shoes!";
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
	if (_target getVariable ['ExileLifeCementShoes', false]) then
	{
		throw "They already have concrete shoes!";
	};
	_ingredients = [player,[["Exile_Item_Cement",1],["Exile_Item_Sand",1],["Exile_Item_WaterCanisterDirtyWater",1]]] call ExileLifeClient_util_containerCargo_checkContents;
	if !(_ingredients) then
	{
		throw "You dont have the required supplies!";
	};
}
catch
{
	_result = _exception;
};
_result
