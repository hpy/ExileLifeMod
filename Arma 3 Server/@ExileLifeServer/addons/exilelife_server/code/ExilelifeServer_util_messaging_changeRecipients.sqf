/**
                    * ExilelifeServer_util_messaging_changeRecipients
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

                    private["_msgID","_newRecipients","_messageThread","_mRecipients","_allRecipientsList","_newRecipientsList","_pIdStr","_dbPID","_dbForm","_messageIds","_newIds"];
_msgID= _this select 0;
_newRecipients = _this select 1;
_messageThread = (_msgID call ExileLifeServer_util_messaging_buildMessage) select 1;
if (count _messageThread == 0) exitWith{[]};
_mRecipients = _messageThread select 3; 
_allRecipientsList = +_mRecipients;
_newRecipientsList = [];
{
    _name = _x select 0;
    _pIdStr = _x select 1;
    _dbPID = _pIdStr call ExileLifeServer_util_player_getPIDfromPID;
    _dbForm = [_dbPID,_name] ;
    _newRecipientsList pushBackUnique _dbForm;
    _allRecipientsList pushBackUnique _dbForm ;
    if !(_dbForm in _mRecipients) then
    {
        _messageIds = format["getPlayerMessages:%1", _dbPID] call ExileServer_system_database_query_selectSingleField;
        _messageIds pushBackUnique _msgID;
        format["updatePlayerMessages:%1:%2", _messageIds, _dbPID] call ExileServer_system_database_query_fireAndForget;
    };
}forEach _newRecipients;
{
    _dbPID = _x select 0;
    _name = _x select 1;
    _dbForm = [_dbPID,_name] ;
    if !(_dbForm in _newRecipientsList) then
    {
        _messageIds = format["getPlayerMessages:%1", _dbPID] call ExileServer_system_database_query_selectSingleField;
        _newIds = _messageIds - [_msgID];
        format["updatePlayerMessages:%1:%2", _newIds, _dbPID] call ExileServer_system_database_query_fireAndForget;
    };
} forEach _allRecipientsList;
if (count _newRecipientsList == 0) then
{
    format["deleteThread:%1",_msgID] call ExileServer_system_database_query_fireAndForget;
    missionNameSpace setVariable
    [
        format["ExileLifeMessage:%1", _msgID],
        nil
    ];
}
else
{
    _messageThread set [3,_newRecipientsList];
    missionNameSpace setVariable
    [
        format["ExileLifeMessage:%1", _msgID],
        _messageThread
    ];
    format["updateRecipients:%1:%2",_newRecipientsList,_msgID] call ExileServer_system_database_query_fireAndForget;
};
_allRecipientsList
