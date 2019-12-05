/**
                    * ExilelifeServer_system_jobs_util_punish
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

                    private["_sessionID","_playerObject","_punishment","_type","_package","_amount","_location","_oldMoney","_newMoney","_oldRespect","_newRespect","_itemClassname","_itemQuantity"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_punishment = _this select 2;
{
	_type = toUpper(_x select 0);
	_package = _x select 1;
	switch (_type) do
	{
		case ("CUSTOM"):
		{
			_amount = _playerObject getVariable ["ExileLifeJobReward",-1];
			if (_amount>0) then {
				_location = toUpper(_package select 0);
				if (_location isEqualTo "LOCKER") then
				{
					_oldMoney = _playerObject getVariable ["ExileLocker",0];
					_newMoney = _oldMoney - _amount;
					_playerObject setvariable ["ExileLocker",_newMoney,true];
					format["updateLocker:%1:%2:%3",_newMoney, getPlayerUID _playerObject, _playerObject getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
				}
				else
				{
					_oldMoney = _playerObject getVariable ["ExileMoney",0];
					_newMoney = _oldMoney - _amount;
					_playerObject setvariable ["ExileMoney",_newMoney,true];
					format["setPlayerMoney:%1:%2", _newMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
				};
			};
		};
		case ("MONEY"):
		{
			_location = toUpper(_package select 0);
			_amount = abs(parseNumber(_package select 1));
			if (_location isEqualTo "LOCKER") then
			{
				_oldMoney = _playerObject getVariable ["ExileLocker",0];
				_newMoney = _oldMoney - _amount;
				_playerObject setvariable ["ExileLocker",_newMoney,true];
				format["updateLocker:%1:%2:%3",_newMoney, getPlayerUID _playerObject, _playerObject getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
			}
			else
			{
				_oldMoney = _playerObject getVariable ["ExileMoney",0];
				_newMoney = _oldMoney - _amount;
				_playerObject setvariable ["ExileMoney",_newMoney,true];
				format["setPlayerMoney:%1:%2", _newMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
			};
		};
		case ("RESPECT"):
		{
			_amount = abs(parseNumber(_package select 0));
			_oldRespect = _playerObject getVariable ["ExileScore",0];
			_newRespect = _oldRespect - _amount;
			_playerObject setVariable ["ExileScore", _newRespect];
			format["setAccountScore:%1:%2", _newRespect, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
		};
		case ("PHYSICAL"):
		{
			_itemClassname = _package select 0;
			_itemQuantity = _package select 1;
			if  !([_playerObject, _itemClassname, _itemQuantity] call ExileLifeClient_util_playerCargo_removeQuantity) then
			{
				[_sessionID, "toastRequest", ["ErrorTitleAndText", ["NOTICE!", "You think you can get away with not giving us what we are owed? You owe us big time!"]]] call ExileServer_system_network_send_to;
			};
		};
	};
} forEach _punishment;
