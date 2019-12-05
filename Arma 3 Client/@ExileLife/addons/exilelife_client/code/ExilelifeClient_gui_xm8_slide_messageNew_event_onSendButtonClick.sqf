/**
                    * ExilelifeClient_gui_xm8_slide_messageNew_event_onSendButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_recipientCtrl","_msgCtrl","_threadCtrl","_message","_threadName","_recipientSize","_recipients","_i","_pid","_msgLength"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_recipientCtrl = _display displayCtrl 31124;
_msgCtrl = _display displayCtrl 31130;
_threadCtrl = _display displayCtrl 31128;
_message = ctrlText _msgCtrl;
_threadName = ctrlText _threadCtrl;
_recipientSize = lbSize _recipientCtrl;
try
{
	if (_recipientSize isEqualTo 0) then
	{
		throw "Please add recipients";
	};
	_recipients = [];
	for "_i" from 0 to (_recipientSize - 1) do
	{
		_name = _recipientCtrl lbText _i;
		_pid = _recipientCtrl lbData _i;
		if !(_name isEqualTo "" && _pid isEqualTo "") then
		{
			_recipients pushBack [_name,_pid];
		};
	};
	if (_recipients isEqualTo []) then
	{
		throw "Please add recipients";
	};
	if ((_threadName == "") || ((count _threadName) < 1) ) then
	{
		throw "Message name cannot be empty!";
	};
	_msgLength = count _message;
	if ((_message == "") || (_msgLength< 1)) then
	{
		throw "Message cannot be empty!";
	};
	if (_msgLength>280) then
	{
		throw "Message cannot exceed 280 characters!";
	};
	["newMessageRequest", [_threadName, _recipients, _message]] call ExileClient_system_network_send;
	_msgCtrl ctrlSetText "";
	_threadCtrl ctrlSetText "";
	["messages", 1] call ExileClient_gui_xm8_slide;
}
catch
{
	["ErrorTitleAndText", ["Failed send!",_exception]] call ExileClient_gui_toaster_addTemplateToast;
};
true
