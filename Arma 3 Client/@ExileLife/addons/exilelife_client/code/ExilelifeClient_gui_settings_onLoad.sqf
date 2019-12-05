/**
                    * ExilelifeClient_gui_settings_onLoad
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
_display = uiNamespace getVariable ['RscExileLifeSettings', displayNull];
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
call ExileLifeClient_gui_settings_tab_keybinding_onLoad;
