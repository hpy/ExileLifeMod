/**
                    * ExilelifeClient_gui_settings_event_save
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    call ExileLifeClient_gui_settings_tab_keybinding_event_save;
["SuccessTitleOnly", ["Save successful!"]] call ExileClient_gui_toaster_addTemplateToast;
closeDialog 1;