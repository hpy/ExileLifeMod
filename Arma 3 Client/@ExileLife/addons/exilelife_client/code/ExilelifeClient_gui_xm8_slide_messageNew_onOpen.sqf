/**
                    * ExilelifeClient_gui_xm8_slide_messageNew_onOpen
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_availableContactsCtrl","_recipientCtrl","_threadNameCtrl","_messageCtrl","_isGuard","_contactIsGuard","_xm8Online","_index"];
disableSerialization;
ExileLifeSelectedMsg = nil;
ExileLifeSelectedMsgData = nil;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_availableContactsCtrl = _display displayCtrl 31122;
_recipientCtrl = _display displayCtrl 31124;
_threadNameCtrl = _display displayCtrl 31128;
_messageCtrl = _display displayCtrl 31130;
_isGuard = player getVariable ["ExileLifeClient:Guard", false];
lbClear _availableContactsCtrl;
{
	_contactIsGuard = _x getVariable ["ExileLifeClient:Guard", false];
	_xm8Online = _x getVariable ["ExileXM8IsOnline", false];
	if (_xm8Online) then
	{
			if ((!_isGuard && !_contactIsGuard) || (_isGuard && _contactIsGuard)) then {
				_index = _availableContactsCtrl lbAdd ([_x] call ExileLifeClient_util_player_name);
				_availableContactsCtrl lbSetData [_index, (_x getVariable ["ExileLifePrisonerID", -1])];
			};
	};
}
forEach (allPlayers - [player]);   
lbSort _availableContactsCtrl;
lbClear _recipientCtrl;
_threadNameCtrl ctrlSetText "";
_messageCtrl ctrlSetText "";
