/**
                    * ExilelifeClient_object_handcuffs_cementShoes
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_success"];
_success = false;
try
{
	if !(alive player) then
	{
		throw false;
	};
	if (ExileClientInteractionObject isEqualTo player) then
	{
		throw false;
	};
	if !(isPlayer ExileClientInteractionObject) then
	{
		throw false;
	};
	if !(alive ExileClientInteractionObject) then
	{
		throw false;
	};
    if (ExileClientInteractionObject getVariable ['ExileLifeClientIncapacitated', false]) then
    {
        throw false;
    };
	if !(ExileClientInteractionObject getVariable ["ExileIsHandcuffed", false]) then
	{
		throw false;
	};
	if ((player distance ExileClientInteractionObject) > 5) then
	{
		throw false;
	};
	if (ExileClientInteractionObject getVariable ['ExileLifeCementShoes', false]) then
	{
		throw false;
	};
	["cementShoes", ExileClientInteractionObject] call ExileClient_action_execute;
    call ExileClient_gui_interactionMenu_unhook;
}
catch
{
	_success = _exception;
};
_success
