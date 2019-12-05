/**
                    * ExilelifeServer_system_allowance_network_gangAllowanceWithdrawalRequest
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

                    private["_sessionID","_player","_playersGang","_playerID","_playerGangAllowanceToCollect","_playerMoney","_newPlayerMoney"];
_sessionID = _this select 0;
try
{
    _player = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _player) then
    {
        throw false;
    };
	if !(alive _player) then
	{
		throw false;
	};
	_playersGang = _player getVariable ['ExileLifeClientGang', ""];
	if (_playersGang isEqualTo "Rogue") then
	{
		throw false;
	};
	if (_playersGang isEqualTo "") then
	{
		throw false;
	};
		_playerID = _player getVariable ["ExileLifePID", -1];
		_playerGangAllowanceToCollect = format["getPlayersGangAllowance:%1",_playerID] call ExileServer_system_database_query_selectSingleField;
		format["updatePlayersGangAllowance:%1:%2", 0,_playerID] call ExileServer_system_database_query_fireAndForget;
		_playerMoney = _player getVariable ["ExileMoney",0];
		_newPlayerMoney = _playerMoney + _playerGangAllowanceToCollect;
		_player setVariable ["ExileMoney", _newPlayerMoney, true];
		format["setPlayerMoney:%1:%2", _newPlayerMoney, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
		[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Withdrawn!"]]] call ExileServer_system_network_send_to;
		[_sessionID, "allowanceWithdrawalResponse", []] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileServer_util_log;
};