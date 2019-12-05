/**
                    * ExilelifeClient_gui_xm8_slide_messageNew_onClose
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_availableContactsCtrl","_recipientCtrl","_threadNameCtrl","_messageCtrl"];
disableSerialization;
ExileLifeSelectedMsg = nil;
ExileLifeSelectedMsgData = nil;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_availableContactsCtrl = _display displayCtrl 31122;
_recipientCtrl = _display displayCtrl 31124;
_threadNameCtrl = _display displayCtrl 31128;
_messageCtrl = _display displayCtrl 31130;
lbClear _availableContactsCtrl;
lbClear _recipientCtrl;
lbClear _threadNameCtrl;
lbClear _messageCtrl;
