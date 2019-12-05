/**
                    * ExilelifeClient_gui_xm8_slide_messageManagement_event_onAddRecipientButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_availableContactsCtrl","_recipientCtrl","_curSel","_recipientToAddName","_recipientToAddPID","_index"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_availableContactsCtrl = _display displayCtrl 31203;
_recipientCtrl = _display displayCtrl 31205;
_curSel = lbCurSel _availableContactsCtrl;
_recipientToAddName = _availableContactsCtrl lbText _curSel;
_recipientToAddPID = _availableContactsCtrl lbData _curSel;
if !(_recipientToAddName isEqualTo "" || _recipientToAddPID isEqualTo "") then 
{
	_index = _recipientCtrl lbAdd _recipientToAddName;
	_recipientCtrl lbSetData [_index, _recipientToAddPID];
	_availableContactsCtrl lbDelete _curSel;
	lbSort _availableContactsCtrl;
};
true
