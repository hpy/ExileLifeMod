/**
                    * ExilelifeClient_gui_xm8_slide_messageManagement_onClose
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_availableContactsCtrl","_recipientCtrl","_threadNameCtrl"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_availableContactsCtrl = _display displayCtrl 31203;
_recipientCtrl = _display displayCtrl 31205;
_threadNameCtrl = _display displayCtrl 31209;
lbClear _recipientCtrl;
lbClear _availableContactsCtrl;
lbClear _threadNameCtrl;
ExileLifeSelectedMsg = nil;
ExileLifeSelectedMsgData = nil;
