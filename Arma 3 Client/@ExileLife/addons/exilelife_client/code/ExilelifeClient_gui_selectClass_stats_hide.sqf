/**
                    * ExilelifeClient_gui_selectClass_stats_hide
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeSelectClassDialog", displayNull];
[_display,0,1,[748507,748508,748509,748510,748511,748512,748513,748514,748515,748516,748519],1] spawn ExileLifeClient_gui_util_fade;
	_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
