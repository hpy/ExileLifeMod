/**
                    * ExileClientOverwrites_object_handcuffs_breakfree
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    try
{
	if !(ExileClientIsHandcuffed) then
	{
		throw "You are not handcuffed!";
	};
	if (player getVariable ['ExileLifeClientIncapacitated',false]) then
    {
        throw "You are already dead!";
    };
	if !(isNull ExileClientHostageTaker) then
	{
		if ((player distance ExileClientHostageTaker) < 20) then
		{
			throw "Your hostage taker is nearby!";
		};
	};
	if (ExileClientInteractionObject getVariable ['ExileLifeCementShoes', false]) then
	{
		throw "Your legs seems to be encased in cement...";
	};
	if !(player call ExileClient_object_handcuffs_hasFreeItems) then
	{
		throw "Missing tools!";
	};
	["breakFreeRequest", []] call ExileClient_system_network_send;
}
catch
{
	["ErrorTitleOnly", [_exception]] call ExileClient_gui_toaster_addTemplateToast;
};
