/**
                    * ExilelifeServer_system_network_send_to_gangClass
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

                    private["_gang","_class","_messageName","_messageParameters","_blackList","_recipients","_data","_publicMessage","_dbID","_sessionID","_player","_pClass","_pGang"];
_gang = _this select 0;
_class = _this select 1;
_messageName = _this select 2;
_messageParameters = _this select 3;
 _blackList = param[4,[]];
_recipients = [];
if ((typeName _class == "STRING") && (typeName _gang == "STRING")) then{
	try
	{
		if (_class == "Murderer") then
		{
			throw "Murderer";
		};
		if (_class == "Thief") then
		{
			throw "Thief";
		};
		if (_class == "Smuggler") then
		{
			throw "Smuggler";
		};
		if (_class == "Thug") then
		{
			throw "Thug";
		};
        _class = "";
	}
	catch
	{
        _class = _exception;
    };
    if(_class isEqualTo "")exitWith{_recipients};
	try
	{
		if (_gang == "Mafia") then
		{
			throw "Mafia";
		};
		if (_gang == "Syndicate") then
		{
			throw "Syndicate";
		};
		if (_gang == "Yakuza") then
		{
			throw "Yakuza";
		};
		if (_gang == "Cartel") then
		{
			throw "Cartel";
		};
		if (_gang == "Guard") then
		{
			throw "Guard";
		};
		if (_gang == "Rogue") then
		{
			throw "Rogue";
		};
        _gang = "";
	}
	catch
	{
        _gang = _exception;
    };
    if(_gang isEqualTo "")exitWith{_recipients};
    _data = format ["getGangClassMembers:%1:%2", _gang,_class] call ExileServer_system_database_query_selectSingle;
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
	                _pClass = _player getVariable['ExileLifeClientClass',""];
	                _pGang = _player getVariable['ExileLifeClientGang',""];
	                if  ((_pClass == _class) && (_pGang == _gang)) then
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
_publicMessage = nil;
 if (typeName _recipients == "SCALAR")then{
	_recipients = [];
};
_recipients
