/**
                    * ExilelifeClient_gui_xm8_slide_messageManagement_event_onRemoveRecipientButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_availableContactsCtrl","_recipientCtrl","_curSel","_recipientToRemoveName","_recipientToRemovePID","_index"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_availableContactsCtrl = _display displayCtrl 31203;
_recipientCtrl = _display displayCtrl 31205;
_curSel = lbCurSel _recipientCtrl;
_recipientToRemoveName = _recipientCtrl lbText _curSel;
_recipientToRemovePID = _recipientCtrl lbData _curSel;
if !(_recipientToRemoveName isEqualTo "" || _recipientToRemovePID isEqualTo "") then 
{
	_index = _availableContactsCtrl lbAdd _recipientToRemoveName;
	_availableContactsCtrl lbSetData [_index, _recipientToRemovePID];
	_recipientCtrl lbDelete _curSel;
	lbSort _availableContactsCtrl;
};
true
