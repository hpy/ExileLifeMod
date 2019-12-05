/**
                    * ExilelifeClient_gui_xm8_slide_messages_network_sendMsgResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_msgID","_display","_ctrl","_foreachIndex"];
disableSerialization;
_msgID = _this select 0;
ExileLifeMessages = _this select 1;
call ExileLifeClient_gui_xm8_slide_messages_onOpen;
ExileLifeSelectedMsg = _msgID;
_msgID call ExileLifeClient_gui_xm8_slide_messages_event_showMessages;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_ctrl = _display displayCtrl 31103;
{
    if(_x select 0 == _msgID) exitWith{
        _ctrl lbSetCurSel _foreachIndex;
    };
}
forEach ExileLifeMessages;
