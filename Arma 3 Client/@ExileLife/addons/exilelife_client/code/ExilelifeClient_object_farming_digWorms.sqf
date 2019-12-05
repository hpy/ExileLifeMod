/**
                    * ExilelifeClient_object_farming_digWorms
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    _this setVariable ['ExileLifeSearched',1,true]; 
if ((floor(random 7)) > 3) then 
{
	if([player, "ExileLife_Item_Worm", 1] call ExileLifeClient_util_playerCargo_addorDrop) then 
    {
        systemchat "You found a worm!";
    }
    else
    {
        systemchat "You found a worm but your bags are full. Its on the ground somewhere...";
    };
};
