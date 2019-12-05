/**
                    * ExilelifeServer_util_messaging_addMessage
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

                    private["_msgID","_player","_newMsg","_messageThread","_mCount","_mDate","_mTitle","_mRecipients","_mMsgs","_messageBlock"];
_msgID= _this select 0;
_player = _this select 1;
_newMsg = _this select 2;
_messageThread = (_msgID call ExileLifeServer_util_messaging_buildMessage) select 1;
if (count _messageThread == 0) exitWith{nil};
_mCount = _messageThread select 0;
_mDate = _messageThread select 1;
_mTitle = _messageThread select 2;
_mRecipients = _messageThread select 3;
_mMsgs = _messageThread select 4;
_mDate = call ExileServer_util_time_currentTime;
_messageBlock = [([_player] call ExileLifeClient_util_player_name), _newMsg];
if ((count _mMsgs) == 20) then
{
    _mMsgs deleteAt 0;
};
_mMsgs pushBack _messageBlock;
_messageThread set [0,_mCount+1];
missionNameSpace setVariable
[
    format["ExileLifeMessage:%1", _msgID],
    _messageThread
];
format["addMessage:%1:%2:%3",_mMsgs,_mDate,_msgID] call ExileServer_system_database_query_fireAndForget;
_messageThread
