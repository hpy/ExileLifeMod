/**
                    * ExilelifeClient_gui_xm8_slide_messages_network_updateMessagesResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_msgData","_msg"];
ExileLifeMessages = _this select 0;
_msgData = nil;
_msg = nil;
if !(isNil "ExileLifeSelectedMsg") then
{
        if !(isNil "ExileLifeSelectedMsgData") then
        {
            {
                if ( ExileLifeSelectedMsg == (_x select 0)) exitWith
                {
                    _msg = _x select 0;
                    _msgData = _x;
                };
            } forEach ExileLifeMessages;
        };
};
call ExileLifeClient_gui_xm8_slide_messages_onOpen;
ExileLifeSelectedMsg = _msg;
ExileLifeSelectedMsgData = _msgData;
ExileLifeSelectedMsg call ExileLifeClient_gui_xm8_slide_messages_event_showMessages;
