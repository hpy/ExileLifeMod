/**
                    * ExilelifeClient_gui_hud_toggleBleedingIcon
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_icon"];
disableSerialization;
_display = uiNamespace getVariable "RscExileHUD";
_icon = _display displayCtrl 1001;
_icon ctrlShow _this;
