/**
                    * ExilelifeServer_system_network_send_to_class
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

                    private["_recipient","_messageName","_messageParameters","_blackList","_recipients","_class","_data","_publicMessage","_dbID","_sessionID","_player"];
_recipient = _this select 0;
_messageName = _this select 1;
_messageParameters = _this select 2;
 _blackList = param[3,[]];
_recipients = [];
	diag_log format["ExileLifeServer_system_network_send_to_class"];
if (typeName _recipient == "STRING") then
{
	try
	{
		if (_recipient == "Murderer") then
		{
			throw "Murderer";
		};
		if (_recipient == "Thief") then
		{
			throw "Thief";
		};
		if (_recipient == "Smuggler") then
		{
			throw "Smuggler";
		};
		if (_recipient == "Thug") then
		{
			throw "Thug";
		};
	}
	catch
	{
        _class = _exception;
        _data = format ["getClassMembers:%1", _class] call ExileServer_system_database_query_selectSingle;
        {
            _publicMessage = [_messageName, _messageParameters];
			_dbID = _x;
	        _sessionID = _dbID call ExileLifeServer_system_session_getIDfromDBID;
            if(_sessionID != "") then
            {
                _player = _sessionID call ExileServer_system_session_getPlayerObject;
                if !(isNull _player) then
                {
					if !(_player in _blackList)then
					{
	                    if  (_player getVariable['ExileLifeClientClass',""] == _class) then
	                    {
							_recipients pushBackUnique _player;
	                        if(typeName _x isEqualTo "SCALAR")then
	                        {
	                            _publicMessage remoteExecCall ["ExileClient_system_network_dispatchIncomingMessage",_player];
	                        }
	                        else
	                        {
	                            _publicMessage remoteExecCall ["ExileClient_system_network_dispatchIncomingMessage",owner _player];
	                        };
	                    };
					};
                };
            };
        }forEach _data;
	};
};
_publicMessage = nil;
 if (typeName _recipients == "SCALAR")then{
	_recipients = [];
};
_recipients
