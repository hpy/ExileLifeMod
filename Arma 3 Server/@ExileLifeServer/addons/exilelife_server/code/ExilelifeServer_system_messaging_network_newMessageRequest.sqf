/**
                    * ExilelifeServer_system_messaging_network_newMessageRequest
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

                    private["_sessionID","_package","_threadName","_recipients","_message","_playerObject","_threadID","_playerThreads","_activeRecipients","_playerPID","_storePID","_senderName","_strPID","_dbPID","_recipientSessionID","_recipientThreads","_recipientObject","_lastUpdated","_messageBlock","_messageThread","_sid","_rObj","_rMsgList","_sMsgList"];
_sessionID = _this select 0;
_package = _this select 1;
_threadName = _package select 0;
_recipients = _package select 1;
_message = _package select 2;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player is null";
	};
	if (_threadName isEqualTo "") then
	{
		throw "Thread Name cannot be blank";
	};
	if (_message isEqualTo "") then
	{
		throw "Message cannot be blank!";
	};
	if ((count _message)>280) then
	{
		throw "Message cannot exceed 280 characters!";
	};
	_threadID = call ExileLifeServer_system_messaging_createMessageID;
	_playerThreads = _playerObject getVariable ["ExileLifeMessages", []];
	_playerThreads pushback _threadID;
	_playerObject setVariable ["ExileLifeMessages", _playerThreads];
	format["updatePlayerMessages:%1:%2",  _playerThreads,(_playerObject getVariable ["ExileLifePID", -1])] call ExileServer_system_database_query_fireAndForget;
	_activeRecipients = [];
	_playerPID =  _playerObject getVariable ["ExileLifePID", -1];
	_storePID = [];
	_senderName = [_playerObject] call ExileLifeClient_util_player_name;
	_storePID pushBackUnique ([_playerPID,_senderName]);
	{
		_name = _x select 0;
		_strPID = _x select 1;
		_dbPID = _strPID call ExileLifeServer_util_player_getPIDfromPID;
		_recipientSessionID = _dbPID call ExileLifeServer_system_session_getIDfromDBID;
		_storePID pushBackUnique ([_dbPID,_name]) ;
		if (_recipientSessionID isEqualTo "") then
		{
			_recipientThreads = format["getPlayerMessages:%1", _dbPID] call ExileServer_system_database_query_selectSingleField;
			_recipientThreads pushback _threadID;
			format["updatePlayerMessages:%1:%2",  _recipientThreads,_dbPID] call ExileServer_system_database_query_fireAndForget;
		}
		else
		{
			_recipientObject = _recipientSessionID call ExileServer_system_session_getPlayerObject;
			if (_recipientSessionID !=_sessionID) then
			{
				_activeRecipients pushBack _recipientSessionID;
			};
			_recipientThreads = _recipientObject getVariable ["ExileLifeMessages", []];
			_recipientThreads pushback _threadID;
			format["updatePlayerMessages:%1:%2", _recipientThreads, _dbPID] call ExileServer_system_database_query_fireAndForget;
		};
	}forEach _recipients;
	_lastUpdated = call ExileServer_util_time_currentTime;
	_messageBlock =
	[
		[
			_senderName,
			_message
		]
	];
	_messageThread =
	[
		1,
		_lastUpdated,
		_threadName,
		_storePID,
		_messageBlock
	];
	missionNameSpace setVariable
	[
		format["ExileLifeMessage:%1", _threadID],
		_messageThread
	];
	format["createNewThread:%1:%2:%3:%4:%5",_threadID,_threadName,_storePID,_messageBlock,_lastUpdated] call ExileServer_system_database_query_fireAndForget;
	{
		_sid = _x;
		_rObj = _sid call ExileServer_system_session_getPlayerObject;
		_rMsgList = _rObj call ExileLifeServer_util_messaging_buildMessageList;
		[_sid,"receiveMsgResponse",[_threadID,_rMsgList]] call ExileServer_system_network_send_to;
	}
	forEach _activeRecipients;
	_sMsgList = _playerObject call ExileLifeServer_util_messaging_buildMessageList;
	[_sessionID, "sendMsgResponse", [_threadID, _sMsgList]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileLifeServer_util_log;
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to create new xm8 msg thread!", _exception]]] call ExileServer_system_network_send_to;
};
true
