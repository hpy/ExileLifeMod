/**
                    * ExilelifeClient_object_handcuffs_check_cementShoes
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_result","_ingredients"];
_result = true;
try
{
    if !(alive player) then
    {
        throw false;
    };
    if !(alive ExileClientInteractionObject) then
    {
        throw false;
    };
    if (ExileClientIsHandcuffed) then
    {
        throw false;
    };
    if (ExileClientInteractionObject isEqualTo player) then
    {
        throw false;
    };
    if (ExileClientInteractionObject getVariable ['ExileLifeClientIncapacitated', false]) then
    {
            throw false;
    };
	if (ExileClientInteractionObject getVariable ['ExileLifeClientUnconscious',false]) then
	{
		throw false;
	};
	if !(ExileClientInteractionObject getVariable ['ExileIsHandcuffed', false]) then
	{
		throw false;
	};
	if !(ExileClientInteractionObject getVariable ['ExileLifeIsForcedUp', false]) then
	{
		throw false;
	};
	if (ExileClientInteractionObject getVariable ['ExileLifeisEscorted', false]) then
	{
		throw false;
	};
	if (ExileClientInteractionObject getVariable ['ExileLifeCementShoes', false]) then
	{
		throw false;
	};
	_ingredients = [player,[["Exile_Item_Cement",1],["Exile_Item_Sand",1],["Exile_Item_WaterCanisterDirtyWater",1]]] call ExileLifeClient_util_containerCargo_checkContents;
	if !(_ingredients) then
	{
		throw false;
	};
    if ((player distance ExileClientInteractionObject) > 2) then
    {
        throw false;
    };
}
catch
{
	_result = _exception;
};
_result
