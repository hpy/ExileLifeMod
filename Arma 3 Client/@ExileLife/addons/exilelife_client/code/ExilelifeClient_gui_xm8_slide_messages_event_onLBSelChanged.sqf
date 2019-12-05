/**
                    * ExilelifeClient_gui_xm8_slide_messages_event_onLBSelChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_listBoxCtrl","_index","_data"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileXM8",displayNull];
_listBoxCtrl = _display displayCtrl 31103;
_index = _this select 1;
_data = _listBoxCtrl lbData _index;
(_data call ExileLifeClient_gui_xm8_slide_messages_event_showMessages)
