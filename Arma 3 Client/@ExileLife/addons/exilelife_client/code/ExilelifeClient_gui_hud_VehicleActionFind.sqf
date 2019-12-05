/**
                    * ExilelifeClient_gui_hud_VehicleActionFind
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if !(ExileLifeNearestAction isEqualTo []) then
{	
	if (player getVariable ['ExileLifeisEscortingChk', false]) then
	{
		call ExileLifeClient_object_handcuffs_forceGetIn;
	}
	else
	{
		[ExileLifeNearestAction,ExileClientInteractionObject] call ExileLifeClient_gui_hud_VehicleActionSel;
	};
};
