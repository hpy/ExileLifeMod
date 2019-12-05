/**
                    * ExilelifeServer_system_messaging_network_updateMessageRequest
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

                    private["_sessionID","_package","_msgID","_msgTitle","_recipients","_success","_playerObject","_allRecipients","_id","_recipientSessionID","_recipientObject"];
_sessionID = _this select 0;
_package = _this select 1;
_msgID = _package select 0;
_msgTitle = _package select 1;
_recipients = _package select 2;
_success = false;
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
	if (_msgTitle isEqualTo "") then
	{
		throw "Chat name cannot be blank";
	};
	if  !([_msgID,_msgTitle] call ExileLifeServer_util_messaging_changeTitle) then
	{
		throw "Error Changing Msg Title";
	};
	_allRecipients = [_msgID,_recipients] call ExileLifeServer_util_messaging_changeRecipients;
	if (count _allRecipients == 0) then
	{
		throw "Error Changing Msg Recipients";
	};
	{
		_id = _x select 0;  
		_recipientSessionID = _id call ExileLifeServer_system_session_getIDfromDBID;
		if !(_recipientSessionID isEqualTo "") then
		{
			_recipientObject = _recipientSessionID call ExileServer_system_session_getPlayerObject;
			if (!isNull _recipientObject) then
			{
					[_id,_recipientSessionID,_recipientObject] call ExileLifeServer_util_messaging_getMessages;
			};
		};
	} forEach _allRecipients;
}
catch
{
	if !(_success) then
	{
		_exception call ExileLifeServer_util_log;
		[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed apply updates to XM8 message!", _exception]]] call ExileServer_system_network_send_to;
	};
};
true
