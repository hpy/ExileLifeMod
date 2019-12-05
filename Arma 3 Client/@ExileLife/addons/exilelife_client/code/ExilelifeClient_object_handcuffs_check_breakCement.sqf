/**
                    * ExilelifeClient_object_handcuffs_check_breakCement
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_result","_tools"];
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
	if !(ExileClientInteractionObject getVariable ['ExileIsHandcuffed', false]) then
	{
		throw false;
	};
	if (ExileClientInteractionObject getVariable ['ExileLifeisEscorted', false]) then
	{
		throw false;
	};
	if !(ExileClientInteractionObject getVariable ['ExileLifeCementShoes', false]) then
	{
		throw false;
	};
	_tools = [player,"Exile_Item_Hammer"] call ExileLifeClient_util_playercargo_contains;
	if !(_tools) then
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
