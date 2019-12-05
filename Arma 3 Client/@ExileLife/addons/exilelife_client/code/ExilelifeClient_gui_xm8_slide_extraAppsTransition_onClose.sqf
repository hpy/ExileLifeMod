/**
                    * ExilelifeClient_gui_xm8_slide_extraAppsTransition_onClose
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display"];
 [] spawn
 {
 	uiSleep 0.25;
 	disableSerialization;
 	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
 	{
 		ctrlDelete _x;
 	}
 	forEach (_display getVariable ["ExileExtraAppsTransition", []]);
    {
        (_display displayCtrl _x) ctrlShow false;
    }forEach [6100,
    6101,
    6102,
    6103];
 	_display setVariable ["ExileExtraAppsTransition", []];
 };
