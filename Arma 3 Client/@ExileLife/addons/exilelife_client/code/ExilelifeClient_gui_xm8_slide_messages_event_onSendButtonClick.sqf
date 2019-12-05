/**
                    * ExilelifeClient_gui_xm8_slide_messages_event_onSendButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_message","_msgLength"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_message = ctrlText (_display displayCtrl 31110);
try
{
    if ((ExileLifeSelectedMsg == nil) || (count ExileLifeSelectedMsg < 6)) then
    {
        throw "Please Select a Msg First!";
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
	["sendMessageRequest", [ExileLifeSelectedMsg, _message]] call ExileClient_system_network_send;
    (_display displayCtrl 31110) ctrlSetText "";
}
catch
{
	["ErrorTitleAndText", ["Failed send!",_exception]] call ExileClient_gui_toaster_addTemplateToast;
};
true
