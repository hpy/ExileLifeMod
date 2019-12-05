/**
                    * ExilelifeClient_gui_xm8_slide_messages_event_showMessages
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_msgID","_listBoxCtrl","_msgBoxCtrl","_msgCnt","_date","_chatTitle","_recipients","_chatMsgs","_text","_numRecipients","_msgContactIndex","_chatMsgsSender","_colours","_i","_chatMsgsContents","_index","_userColour"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileXM8",displayNull];
_msgID = _this;
{
    if ( _msgID == (_x select 0)) exitWith
    {
        ExileLifeSelectedMsgData = _x;
    };
} forEach ExileLifeMessages;
if (count ExileLifeSelectedMsgData < 1) exitWith{};
_listBoxCtrl = _display displayCtrl 31103;
_msgBoxCtrl = _display displayCtrl 31109;
ExileLifeSelectedMsg = _msgID;
_msgCnt = ExileLifeSelectedMsgData select 1 select 0;
_date = ExileLifeSelectedMsgData select 1 select 1;
_chatTitle = ExileLifeSelectedMsgData select 1 select 2;
_recipients = ExileLifeSelectedMsgData select 1 select 3;
_chatMsgs = ExileLifeSelectedMsgData select 1 select 4;
_text = "";
_numRecipients = (count _recipients) - 1;
_msgContactIndex = [];
{
	_chatMsgsSender = _x select 0;
	_msgContactIndex pushBackUnique _chatMsgsSender;
} foreach _chatMsgs;
_msgContactIndex deleteAt (_msgContactIndex find ([player] call ExileLifeClient_util_player_name));
_colours = ["cc6633","006600","00ccff","00cc00","6600cc","9933ff","99ccff", "cc99cc","000fff","ff9999","ffccff","99ff66"];
if(_numRecipients>11) then
{
	for "_i" from 12 to _numRecipients do
	{
		_colours append (call ExileLifeClient_util_array_hexColour);
	};
};
{
	_chatMsgsSender = _x select 0;
	_chatMsgsContents = _x select 1;
	_index = _msgContactIndex find _chatMsgsSender;
	if (_index < 0) then
	{
		_text = _text + format["<t shadow='0' align='right' size='0.7'><t color='#ff0000' size='0.9'>%1</t>",_chatMsgsSender];
	}
	else
	{
		_userColour = _colours select _index;
		_text = _text + format["<t shadow='0' align='left' size='0.7'><t color='#%1' size='0.9'>%2</t>",_userColour,_chatMsgsSender];
	};
	_text = _text + format["<br/>%1<br/><br/>",_chatMsgsContents];
} foreach _chatMsgs;
_msgBoxCtrl ctrlSetStructuredText parseText (_text + "</t>");
_msgBoxCtrl call BIS_fnc_ctrlTextHeight;
true
