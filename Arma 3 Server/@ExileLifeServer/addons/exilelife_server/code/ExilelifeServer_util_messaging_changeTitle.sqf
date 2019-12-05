/**
                    * ExilelifeServer_util_messaging_changeTitle
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

                    private["_msgID","_newTitle","_messageThread","_mTitle"];
_msgID= _this select 0;
_newTitle = _this select 1;
_messageThread = (_msgID call ExileLifeServer_util_messaging_buildMessage) select 1;
if (count _messageThread == 0) exitWith{false};
_mTitle = _messageThread select 2;
if (_newTitle == _mTitle) exitWith {true};
format["updateName:%1:%2",_newTitle,_msgID] call ExileServer_system_database_query_fireAndForget;
_messageThread set [2,_newTitle];
missionNameSpace setVariable
[
    format["ExileLifeMessage:%1", _msgID],
    _messageThread
];
true
