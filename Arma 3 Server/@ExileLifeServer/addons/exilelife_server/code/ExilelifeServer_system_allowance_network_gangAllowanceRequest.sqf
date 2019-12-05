/**
                    * ExilelifeServer_system_allowance_network_gangAllowanceRequest
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

                    private["_sessionID","_parameters","_msg","_player","_playersGang","_playerUID","_playerPaidAt","_gangAllowanceTime","_playerRespect","_gangMinRespectLevel","_gangBankName","_gangBankBalance","_gangWageModifier","_playerWage","_newgangBankBalance","_playerLocker","_playerBalance","_sendMsg","_playerID","_playerGangAllowanceToCollect","_playerGangAllowance"];
_sessionID = _this select 0;
_parameters = _this select 1;
_msg = false;
try
{
    _player = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _player) then
    {
        throw "player doesnt exist!";
    };
	if !(alive _player) then
	{
		throw "player is dead he doesnt get paid this time round!";
	};
	_playersGang = _player getVariable ['ExileLifeClientGang', ""];
	if (_playersGang isEqualTo "") then
	{
		throw "Why do you think you should get this payment? You should never have been receiving a payment to start with!";
	};
	_playerUID = getPlayerUID _player;
	_playerPaidAt = _player getVariable ["ExileLifeClientGangAllowancePaidAt", -1];
	_gangAllowanceTime = (getNumber(missionConfigFile >> "CfgAllowance" >> "gangallowancetime") - 1); 
	_gangAllowanceTime = _gangAllowanceTime * 60;
	_playerPaidAt = _playerPaidAt + _gangAllowanceTime;
	if (_playerPaidAt > ExileSystemMainTimer) then
	{
		throw format ["Possible Hack attempt --- %1 tried to get paid their gang/guard allowance early!",_playerUID];
	};
	_playerRespect = _player getVariable ["ExileScore", 0];
	_gangMinRespectLevel = missionNamespace getVariable [format["ExileLifeGangRespect:%1",_playersGang],1];
	if (_playerRespect < _gangMinRespectLevel) then
	{
		_msg = true;
		throw format["You need to earn more respect before the %1 boss will start paying you!",_playersGang];
	};
	_gangBankName = format ["ExileLifeGangBank:%1",_playersGang];
	_gangBankBalance = missionNamespace getVariable [_gangBankName,-1];
	if (_gangBankBalance < 0) then
	{
		_msg = true;
		throw format["Your boss has lost all the %1 money and cant afford to pay you!",_playersGang];
	};
	_gangWageModifier = (missionNamespace getVariable [format["ExileLifeGangWage:%1",_playersGang],0])/100; 
 	if (_gangWageModifier <= 0) then
 	{
		_msg = true;
 		throw "Your Boss is a tight ass and isnt paying you anymore!";
 	};
	_playerWage = round(_playerRespect * _gangWageModifier);
 	if (_playerWage < 20) then
 	{
 		_playerWage = 20; 
 	};
	if (_playerWage > _gangBankBalance) then
	{
		_msg = true;
		throw format["Your Boss has lost all the %1 money and cant pay you!",_playersGang];
	};
	_newgangBankBalance = _gangBankBalance - _playerWage;
	missionNamespace setVariable [_gangBankName,_newgangBankBalance];
	format["updateGangBank:%1:%2",_newgangBankBalance,_playersGang] call ExileServer_system_database_query_fireAndForget;
	if (_playersGang isEqualTo "Guard") then
	{
		_playerLocker = format["getLocker:%1:%2",getPlayerUID _player,_player getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_selectSingleField;
		_playerBalance = _playerLocker + _playerWage;
		format["updateLocker:%1:%2:%3", _playerBalance, getPlayerUid _player,_player getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
		_player setVariable ["ExileLifeClientGangAllowancePaidAt", ExileSystemMainTimer];
		_sendMsg = [format["%1 Allowance",_playersGang], format ["You were paid %1 poptabs! Collect it from your locker!",_playerWage]];
		[_sessionID, "allowanceResponse", [_sendMsg,true]] call ExileServer_system_network_send_to;
	}
	else
	{
		_playerID = _player getVariable ["ExileLifePID", -1];
		_playerGangAllowanceToCollect = format["getPlayersGangAllowance:%1",_playerID] call ExileServer_system_database_query_selectSingleField;
		_playerGangAllowance = _playerGangAllowanceToCollect + _playerWage;
		format["updatePlayersGangAllowance:%1:%2", _playerGangAllowance,_playerID] call ExileServer_system_database_query_fireAndForget;
		_player setVariable ["ExileLifeClientGangAllowancePaidAt", ExileSystemMainTimer];
		_sendMsg = [format["%1 Allowance",_playersGang], format ["You were paid %1 poptabs! Collect it when your ready!",_playerWage]];
		[_sessionID, "allowanceResponse", [_sendMsg,true]] call ExileServer_system_network_send_to;
	};
}
catch
{
	if (_msg) then
	{
		_sendMsg = [format["%1 Allowance",_playersGang], _exception];
		[_sessionID, "allowanceResponse", [_sendMsg,false]] call ExileServer_system_network_send_to;
	}
	else
	{
		_exception call ExileServer_util_log;
	};
};
