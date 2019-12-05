/**
                    * ExilelifeClient_gui_xm8_slide_messageManagement_onOpen
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_availableContactsCtrl","_recipientCtrl","_threadNameCtrl","_currentName","_currentRecipients","_currentRecipientsConvictsId","_convictID","_convictName","_index","_isGuard","_contactIsGuard","_xm8Online"];
disableSerialization;
if (isNil "ExileLifeSelectedMsgData") exitWith {};
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_availableContactsCtrl = _display displayCtrl 31203;
_recipientCtrl = _display displayCtrl 31205;
_threadNameCtrl = _display displayCtrl 31209;
lbClear _recipientCtrl;
lbClear _availableContactsCtrl;
lbClear _threadNameCtrl;
_currentName = ExileLifeSelectedMsgData select 1 select 2;
_currentRecipients = ExileLifeSelectedMsgData select 1 select 3;
_currentRecipientsConvictsId = [];
ExileLifeSelectedMsg = ExileLifeSelectedMsgData select 0;
{
	_convictID = (_x select 0) call ExileLifeClient_util_player_createPrisonerId;
	_convictName = _x select 1;
	_currentRecipientsConvictsId pushBackUnique _convictID;
	_index = _recipientCtrl lbAdd _convictName;
	_recipientCtrl lbSetData [_index, _convictID];
}forEach _currentRecipients;
lbSort _recipientCtrl;
_isGuard = player getVariable ["ExileLifeClient:Guard", false];
{
	_convictID = _x getVariable ["ExileLifePrisonerID", -1];
	_contactIsGuard = _x getVariable ["ExileLifeClient:Guard", false];
	_xm8Online = _x getVariable ["ExileXM8IsOnline", false];
	if !( _convictID in _currentRecipientsConvictsId ) then
	{
		if (_xm8Online) then
		{
			if ((!_isGuard && !_contactIsGuard) || (_isGuard && _contactIsGuard)) then {
				_index = _availableContactsCtrl lbAdd ([_x] call ExileLifeClient_util_player_name);
				_availableContactsCtrl lbSetData [_index, _convictID];
			};
		};
	}
}forEach (allPlayers);
lbSort _availableContactsCtrl;
_threadNameCtrl ctrlSetText format["%1",_currentName];
