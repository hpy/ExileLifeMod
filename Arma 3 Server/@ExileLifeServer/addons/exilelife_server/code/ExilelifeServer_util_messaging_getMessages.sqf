/**
                    * ExilelifeServer_util_messaging_getMessages
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

                    private["_dbPID","_sid","_player","_messageIds","_messageList"];
    _dbPID = _this select 0;
	_sid = _this select 1;
	_player = _this select 2;
    if (isNull _player) exitWith {};
    _messageIds = format["getPlayerMessages:%1", _dbPID] call ExileServer_system_database_query_selectSingleField;
    _player setVariable ["ExileLifeMessages", _messageIds];
	_messageList = _player call ExileLifeServer_util_messaging_buildMessageList;
	[_sid,"updateMessagesResponse",[_messageList]] call ExileServer_system_network_send_to;
