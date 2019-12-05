/**
                    * ExilelifeServer_util_messaging_removeFromMessages
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

                    private["_playerObject","_result","_playerMessageIds","_playerName","_prisonerIDStr","_prisonerID","_playerMsgID","_messageThread","_mRecipients","_newRecipientsList","_dbId","_pName","_updateRecipients","_id","_recipientSessionID","_recipientObject"];
_playerObject = _this;
_result = true;
try
{
    if (isNull _playerObject) then {
        throw false;
    };
    _playerMessageIds = _playerObject getVariable ["ExileLifeMessages", []];
    _playerName = [_playerObject, "FULL"] call ExileLifeServer_util_player_getName;
    _prisonerIDStr = _playerObject getVariable ["ExileLifePrisonerID",""];
    _prisonerID = _playerObject getVariable ["ExileLifePID",-1];
    _playerMsgID = [_prisonerID,_playerName];
    {
        if !(_x == "") then
        {
        	_messageThread = (_x call ExileLifeServer_util_messaging_buildMessage) select 1;
        	if !(count _messageThread == 0) then{
        		_mRecipients = _messageThread select 3;
                _newRecipientsList = [];
                {
                    _dbId = _x select 0;
                    _pName = _x select 1;
                    if(_prisonerID != _dbId) then
                    {
                        _newRecipientsList pushBackUnique [_pName,_dbId call ExileLifeServer_system_session_createPrisonerID];
                    };
                }forEach _mRecipients;
                diag_log format ["_x: %1 -- _newRecipientsList: %2",_x,_newRecipientsList];
        		_updateRecipients = [_x,_newRecipientsList] call ExileLifeServer_util_messaging_changeRecipients;
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
            	} forEach _updateRecipients;
        	};
        };
    }forEach _playerMessageIds;
    _playerObject setVariable ["ExileLifeMessages", []];
}
catch
{
    _result = _exception;
};
_result
