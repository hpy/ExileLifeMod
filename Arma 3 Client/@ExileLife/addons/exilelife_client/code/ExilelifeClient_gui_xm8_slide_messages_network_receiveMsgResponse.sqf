/**
                    * ExilelifeClient_gui_xm8_slide_messages_network_receiveMsgResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_msgID","_msg","_msgTitle"];
_msgID = _this select 0;
ExileLifeMessages = _this select 1;
_msg = ExileLifeSelectedMsg;
_msgTitle = "";
{
    if(_x select 0 == _msgID) exitWith{
        _msgTitle = _x select 1 select 2;
    };
}forEach ExileLifeMessages;
if (player getVariable ["ExileXM8IsOnline", false]) then
{
    ["SuccessTitleOnly", [format["You have a new msg: %1",_msgTitle]]] call ExileClient_gui_toaster_addTemplateToast;
};
call ExileLifeClient_gui_xm8_slide_messages_onOpen;
_msg call ExileLifeClient_gui_xm8_slide_messages_event_showMessages;
ExileLifeSelectedMsg = _msg;
