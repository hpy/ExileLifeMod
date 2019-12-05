/**
                    * ExilelifeServer_system_messaging_network_sendMessageRequest
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_sessionID","_package","_msgID","_message","_playerObject","_messageThread","_activeRecipients","_playerPID","_id","_recipientSessionID","_recipientObject","_rMsgList","_sMsgList"];
_sessionID = _this select 0;
_package = _this select 1;
_msgID= _package select 0;
_message = _package select 1;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player is null";
	};
	if (_msgID isEqualTo "") then
	{
		throw "Msg Id cannot be blank";
	};
	if (_message isEqualTo "") then
	{
		throw "Message cannot be blank!";
	};
	if ((count _message)>280) then
	{
		throw "Message cannot exceed 280 characters!";
	};
    _messageThread = [_msgID,_playerObject,_message] call ExileLifeServer_util_messaging_addMessage;
	if(isNil "_messageThread") then
	{
		throw "Error Adding Message - Message ID does not exist";
	};
	_activeRecipients = [];
	_playerPID =  _playerObject getVariable ["ExileLifePID", -1];
	{
		_id = _x select 0;  
		_recipientSessionID = _id call ExileLifeServer_system_session_getIDfromDBID;
		if !(_recipientSessionID isEqualTo "") then
		{
			if !(_recipientSessionID ==_sessionID )then
			{
				_recipientObject = _recipientSessionID call ExileServer_system_session_getPlayerObject;
				if !(isNull _recipientObject) then
				{
					_rMsgList = _recipientObject call ExileLifeServer_util_messaging_buildMessageList;
					[_recipientSessionID,"receiveMsgResponse",[_msgID,_rMsgList]] call ExileServer_system_network_send_to;
	            };
			};
		};
	}forEach (_messageThread select 3);
	_sMsgList = _playerObject call ExileLifeServer_util_messaging_buildMessageList;
	[_sessionID, "sendMsgResponse", [_msgID, _sMsgList]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileLifeServer_util_log;
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to send new xm8 message!", _exception]]] call ExileServer_system_network_send_to;
};
true
