/**
                    * ExilelifeClient_object_handcuffs_forceDown
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
	if (ExileClientIsHandcuffed) then
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
	if (ExileClientInteractionObject getVariable ['ExileLifeClientUnconscious',false]) then
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
	["forceDownRequest", [netId ExileClientInteractionObject]] call ExileClient_system_network_send;
    call ExileClient_gui_interactionMenu_unhook;
}
catch
{
	_success = _exception;
};
_success
