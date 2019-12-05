/**
                    * ExilelifeClient_gui_xm8_slide_messageManagement_event_onUpdateButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_recipientCtrl","_threadCtrl","_threadName","_recipientSize","_recipients","_removeMyself","_playerName","_i","_pid","_availableContactsCtrl","_threadNameCtrl"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_recipientCtrl = _display displayCtrl 31205;
_threadCtrl =  _display displayCtrl 31209;
_threadName = ctrlText _threadCtrl;
_recipientSize = lbSize _recipientCtrl;
try
{
	if (isNil "ExileLifeSelectedMsg") then
	{
		throw "Error updating message. Please close and reopen message.";
	};
	if ((_recipientSize isEqualTo 0) and (isNil "ExileLifeAssuranceCheck")) then
	{
		ExileLifeAssuranceCheck = True;
		throw "This will delete all messages! Are you sure?";
	};
	_recipients = [];
	_removeMyself = True;
	_playerName = [player] call ExileLifeClient_util_player_name;
	for "_i" from 0 to (_recipientSize - 1) do
	{
		_name = _recipientCtrl lbText _i;
		_pid = _recipientCtrl lbData _i;
		if (_name == _playerName) then
		{
			_removeMyself = False;
		};
		if !(_name isEqualTo "" && _pid isEqualTo "") then
		{
			_recipients pushBack [_name,_pid];
		};
	};
	if (_removeMyself and (isNil "ExileLifeAssuranceCheck")) then
	{
		ExileLifeAssuranceCheck = True;
		throw "This will remove you from this message! Are you sure?"
	};
	if ((_threadName == "") || ((count _threadName) < 1) ) then
	{
		throw "Message name cannot be empty!";
	};
	["updateMessageRequest", [ExileLifeSelectedMsg,_threadName, _recipients]] call ExileClient_system_network_send;
	["messages", 1] call ExileClient_gui_xm8_slide;
	if !(isNil "ExileLifeAssuranceCheck") then
	{
		ExileLifeSelectedMsg = nil;
	};
	ExileLifeAssuranceCheck = nil;
	_recipientCtrl ctrlSetText "";
	_threadCtrl ctrlSetText "";
	lbClear _recipientCtrl;
	lbClear _availableContactsCtrl;
	lbClear _threadNameCtrl;
}
catch
{
	["ErrorTitleAndText", ["Failed send!",_exception]] call ExileClient_gui_toaster_addTemplateToast;
};
true
