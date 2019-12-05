/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistoryUpdate_event_onItemLBSelChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_listBoxCtrl"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_listBoxCtrl = _display displayCtrl 5316;
ExileLifeSelectedItem = lbCurSel _listBoxCtrl;
true
