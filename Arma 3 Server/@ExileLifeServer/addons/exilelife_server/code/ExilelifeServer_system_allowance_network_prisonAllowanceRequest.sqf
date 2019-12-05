/**
                    * ExilelifeServer_system_allowance_network_prisonAllowanceRequest
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

                    private["_sessionID","_parameters","_msg","_isGuard","_checkScore","_player","_playerUID","_playerPaidAt","_prisonAllowanceTime","_playersGang","_playerID","_playerJobsDate","_timeBetweenJobsAllowed","_totalTimeToStillGetPaid","_currentTime","_timeBetweenJobsToEXT","_playerJobsCompleted","_playerJobsFailed","_jobScore","_paymentLevel","_prisonAllowanceWage","_playerPrisonAllowanceToCollect","_prisonAllowanceAmount","_sendMsg"];
_sessionID = _this select 0;
_parameters = _this select 1;
_msg = false;
_isGuard = false;
_checkScore = true;
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
	_playerUID = getPlayerUID _player;
	_playerPaidAt = _player getVariable ["ExileLifeClientPrisonAllowancePaidAt", -1];
	_prisonAllowanceTime = (getNumber(missionConfigFile >> "CfgAllowance" >> "prisonallowancetime") - 1); 
	_prisonAllowanceTime = _prisonAllowanceTime * 60;
	_playerPaidAt = _playerPaidAt + _prisonAllowanceTime;
	if (_playerPaidAt > ExileSystemMainTimer) then
	{
		throw format ["Possible Hack attempt --- %1 tried to get paid their prison allowance early!",_playerUID];
	};
	_playersGang = _player getVariable ['ExileLifeClientGang', ""];
	if (_playersGang isEqualTo "Guard") then
	{
		throw "This is not useable by guards at this time!";
	}
	else
	{
		_playerID = _player getVariable ["ExileLifePID", -1];
		_playerJobsDate = format["getPlayerlastGuardJobCompletedDate:%1",_playerID] call ExileServer_system_database_query_selectSingleField;
		if (_playerJobsDate isEqualTo []) then
		{
			_msg = true;
			throw "You need to do prison duties in order to get your prisoners allowance!";
		};
		_timeBetweenJobsAllowed = (getNumber(missionConfigFile >> "CfgAllowance" >> "CfgPrisonersAllowance" >> "Time" >> "timeSinceLastJob") + 1);
		_totalTimeToStillGetPaid = [_playerJobsDate,[_timeBetweenJobsAllowed,0,0,0]] call ExileLifeServer_util_time_addTimeEXTDB;
		if (typeName _totalTimeToStillGetPaid == "STRING") then
		{
			throw "EXTDB TIME ERROR";
		};
		_currentTime = call ExileServer_util_time_currentTime;
		_timeBetweenJobsToEXT = [_totalTimeToStillGetPaid,_currentTime,"day"] call ExileLifeServer_util_time_timeLeftMulti;
		if !(_timeBetweenJobsToEXT > 0) then
		{
			_msg = true;
			throw "The Guards have noticed you stopped doing your duties. Your allowance has been cut-off!";
		};
		_playerJobsCompleted = format["getPlayerJobsCompleted:%1",_playerID] call ExileServer_system_database_query_selectSingleField;
		_playerJobsFailed = format["getPlayerJobsFailed:%1",_playerID] call ExileServer_system_database_query_selectSingleField;
		if (_playerJobsFailed isEqualTo []) then
		{
			_playerJobsFailed = 0;
		}
		else
		{
			_playerJobsFailed = count _playerJobsFailed;
		};
		if !(typename _playerJobsCompleted isEqualTo "ARRAY") then
		{
			format["updatePlayerJobsCompleted:%1:%2",[],_playerID] call ExileServer_system_database_query_fireAndForget;
			_playerJobsCompleted = [];
		};
		if (_playerJobsCompleted isEqualTo []) then
		{
			_playerJobsCompleted = 0;
		}
		else
		{
			_playerJobsCompleted = count _playerJobsCompleted;
		};
		_jobScore = _playerJobsCompleted - _playerJobsFailed;
		try
		{
			if ( _jobScore < 10) then
			{
				throw 1;
			};
			if ( _jobScore < 20) then
			{
				throw 2;
			};
			if ( _jobScore < 30) then
			{
				throw 3;
			};
			if ( _jobScore < 40) then
			{
				throw 4;
			};
			if ( _jobScore < 50) then
			{
				throw 5;
			};
			throw 6;
		}
		catch
		{
			_paymentLevel = _exception;
		};
		_prisonAllowanceWage = getNumber(missionConfigFile >> "CfgAllowance" >> "CfgPrisonersAllowance" >> format["PaymentLevel_%1",_paymentLevel]);
		_playerPrisonAllowanceToCollect = format["getPlayersPrisonAllowance:%1",_playerID] call ExileServer_system_database_query_selectSingleField;
		_prisonAllowanceAmount = _playerPrisonAllowanceToCollect + _prisonAllowanceWage;
		format["updatePlayersPrisonAllowance:%1:%2", _prisonAllowanceAmount,_playerID] call ExileServer_system_database_query_fireAndForget;
		_player setVariable ["ExileLifeClientPrisonAllowancePaidAt", ExileSystemMainTimer];
		_sendMsg = ["Prisoners Allowance", format ["Your prisoners allowance was just paid! %1 poptabs",_prisonAllowanceWage]];
		[_sessionID, "allowanceResponse", [_sendMsg,true]] call ExileServer_system_network_send_to;
	};
}
catch
{
	if (_msg) then
	{
		_sendMsg = ["Prisoners Allowance", _exception];
		[_sessionID, "allowanceResponse", [_sendMsg, false]] call ExileServer_system_network_send_to;
	}
	else
	{
		_exception call ExileServer_util_log;
	};
};
