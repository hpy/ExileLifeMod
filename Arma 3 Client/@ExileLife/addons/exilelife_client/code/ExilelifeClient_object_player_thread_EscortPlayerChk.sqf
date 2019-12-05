/**
                    * ExilelifeClient_object_player_thread_EscortPlayerChk
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_victimNetID","_playerNetID","_victim","_player","_result"];
_victimNetID = _this select 0;
_playerNetID = _this select 1;
_victim = objectFromNetID _victimNetID;
_player = objectFromNetID _playerNetID;
_result = false;
try
{
	if (isNull _player) then
	{
		throw true;
	};
	if !(alive _player) then
	{
		throw true;
	};
	if (_player getVariable ['ExileLifeClientIncapacitated', false]) then
    {
        throw true;
    };
	if (isNull _victim) then
	{
		throw true;
	};
	if !(alive _victim) then
	{
		throw true;
	};
	if (_victim getVariable ['ExileLifeClientIncapacitated', false]) then
	{
		throw true;
	};
}
catch
{
	_result = _exception;
};
if (_result) then
{
	"Removing escorting player thread..." call ExileClient_util_log;
	[ExileLifeClientEscortPlayerChk] call ExileClient_system_thread_removeTask;
	ExileLifeClientEscortPlayerChk = -1;
	detach _victim; 
};
