/**
                    * ExileClientOverwrites_gui_interactionMenu_unhook
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

                    if !(isNull ExileClientInteractionObject) then
{
    if (ExileLifeClientSpecialInteractionObject) then 
    {
        {
            player removeAction _x;
        }
        forEach ExileClientInteractionHandles;
        ExileLifeClientSpecialInteractionObject = false;
    }
    else
    {
        {
            ExileClientInteractionObject removeAction _x;
        }
        forEach ExileClientInteractionHandles;
    };
    ExileClientInteractionObject = objNull;
    ExileClientInteractionHandles = [];
};