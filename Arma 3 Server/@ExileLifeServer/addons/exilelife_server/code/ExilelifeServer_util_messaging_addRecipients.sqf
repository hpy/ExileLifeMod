/**
                    * ExilelifeServer_util_messaging_addRecipients
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

                    private["_msgID","_newRecipients","_messageThread","_mRecipients","_cntRecipients","_activeRecipients","_id","_pid","_recipientSessionID","_recipientObject","_dbPID","_storePID","_recipientThreads","_threadID","_recipientPID","_recipients"];
_msgID= _this select 0;
_newRecipients = _this select 1;
_messageThread = (_msgID call ExileLifeServer_util_messaging_buildMessage) select 1;
if (count _messageThread == 0) exitWith{nil};
_mRecipients = _messageThread select 3;
_cntRecipients = count _mRecipients;
_activeRecipients = [];
{
    _id = _x select 0;
    _pid = _id call ExileLifeServer_system_session_createPrisonerID;
    _recipientSessionID = _pid call ExileLifeServer_system_session_getIDfromPID;
    if !(_recipientSessionID isEqualTo "") then
    {
        _recipientObject = _recipientSessionID call ExileServer_system_session_getPlayerObject;
        if (!isNull _recipientObject) then
        {
            _activeRecipients pushBack [_recipientSessionID, _recipientObject];
        };
    };
}forEach _mRecipients;
{
    _mRecipients pushBackUnique _x ;
} forEach _newRecipients;
if (_cntRecipients == (count _mRecipients)) exitWith{[]};
{
    _pid = _x;
    _recipientSessionID = _pid call ExileLifeServer_system_session_getIDfromPID;
    if (_recipientSessionID isEqualTo "") then
    {
        _dbPID = _pid call ExileLifeServer_util_player_getPIDfromPID;
        _storePID append ([_dbPID]) ;
        _recipientThreads = format["getPlayerMessages:%1", _dbPID] call ExileServer_system_database_query_selectSingleField;
        _recipientThreads pushback _threadID;
        format["updatePlayerMessages:%1:%2",  _recipientThreads,_dbPID] call ExileServer_system_database_query_fireAndForget;
    }
    else
    {
        _recipientObject = _recipientSessionID call ExileServer_system_session_getPlayerObject;
        if (!isNull _recipientObject) then
        {
            _activeRecipients pushBack [_recipientSessionID, _recipientObject];
            _recipientThreads = _recipientObject getVariable ["ExileLifeMessages", []];
            _recipientThreads pushback _threadID;
            _recipientPID = _recipientObject getVariable ["ExileLifePID", -1];
            _storePID append ([_recipientPID]) ;
            format["updatePlayerMessages:%1:%2", _recipientThreads, _recipientPID] call ExileServer_system_database_query_fireAndForget;
        };
    };
}forEach _recipients;
missionNameSpace setVariable
[
    format["ExileLifeMessage:%1", _msgID],
    _messageThread
];
format["updateRecipients:%1:%2",_mRecipients,_msgID] call ExileServer_system_database_query_fireAndForget;
_activeRecipients
