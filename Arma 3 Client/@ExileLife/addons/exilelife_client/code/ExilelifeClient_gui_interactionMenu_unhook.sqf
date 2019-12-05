/**
                    * ExilelifeClient_gui_interactionMenu_unhook
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if !(isNull ExileLifeClientInteractionObject) then
{
	{
		ExileLifeClientInteractionObject removeAction _x;
	}
	forEach ExileLifeClientInteractionHandles;
	ExileLifeClientInteractionObject = objNull;
	ExileLifeClientInteractionHandles = [];
	ExileLifeClientInteractionName = "";
};