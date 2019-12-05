/**
                    * ExilelifeClient_gui_xm8_slide_gangManagement_onOpen
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
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
//Check player has permission to open this app - else close