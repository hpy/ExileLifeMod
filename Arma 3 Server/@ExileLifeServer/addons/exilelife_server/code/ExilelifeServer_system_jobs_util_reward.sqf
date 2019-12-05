/**
                    * ExilelifeServer_system_jobs_util_reward
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

                    private["_sessionID","_playerObject","_reward","_type","_package","_amount","_location","_oldMoney","_newMoney","_oldRespect","_newRespect","_itemClassname","_itemQuantity","_cargoType","_canAdd","_added","_posATL","_pos","_lootHolder","_nearestHolder","_magazines"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_reward = _this select 2;
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
					_newMoney = _oldMoney + _amount;
					_playerObject setvariable ["ExileLocker",_newMoney,true];
					format["updateLocker:%1:%2:%3",_newMoney, getPlayerUID _playerObject, _playerObject getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
				}
				else
				{
					_oldMoney = _playerObject getVariable ["ExileMoney",0];
					_newMoney = _oldMoney + _amount;
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
				_newMoney = _oldMoney + _amount;
				_playerObject setvariable ["ExileLocker",_newMoney,true];
				format["updateLocker:%1:%2:%3",_newMoney, getPlayerUID _playerObject, _playerObject getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
			}
			else
			{
				_oldMoney = _playerObject getVariable ["ExileMoney",0];
				_newMoney = _oldMoney + _amount;
				_playerObject setvariable ["ExileMoney",_newMoney,true];
				format["setPlayerMoney:%1:%2", _newMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
			};
		};
		case ("RESPECT"):
		{
			_amount = abs(parseNumber(_package select 0));
			_oldRespect = _playerObject getVariable ["ExileScore",0];
			_newRespect = _oldRespect + _amount;
			_playerObject setVariable ["ExileScore", _newRespect];
			format["setAccountScore:%1:%2", _newRespect, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
		};
		case ("PHYSICAL"):
		{
			_itemClassname = _package select 0;
			_itemQuantity = _package select 1;
			_cargoType = _itemClassname call ExileClient_util_cargo_getType;
			_canAdd = [];
			_added = false;
			if ([_playerObject, _itemClassname] call ExileClient_util_playerCargo_canAdd) then
			{
				_canAdd pushback 1;
			};
			if (_playerObject canAddItemToUniform _itemClassname || _playerObject canAddItemToVest _itemClassname || _playerObject canAddItemToBackpack _itemClassname) then
			{
				_canAdd pushback 2;
			};
			switch (_cargoType) do
			{
				case 1:
				{
					if (2 in _canAdd) then
					{
						_playerObject addItem _itemClassname;
						_added = true;
					};
				};
				case 2:
				{
					if (2 in _canAdd) then
					{
						_playerObject addWeaponGlobal _itemClassname;
						_added = true;
					};
				};
				case 3:
				{
					if (2 in _canAdd) then
					{
						_playerObject addBackpackGlobal _itemClassname;
						_added = true;
					};
				};
				case 4:
				{
					if (1 in _canAdd) then
					{
						_playerObject linkItem _itemClassname;
						_added = true;
					};
				};
				default
				{
					if (2 in _canAdd) then
					{
						_playerObject addItem _itemClassname;
						_added = true;
					};
				};
			};
			if (!_added) then
			{
				_posATL = getPosATL _playerObject;
				_pos = _playerObject modelToWorld [0,1.5,0];
				_pos set [2,_posATL select 2];
				_lootHolder = objNull;
				_nearestHolder = nearestObjects [_playerObject, ["GroundWeaponHolder","WeaponHolderSimulated","LootWeaponHolder"], 3];
				if !(_nearestHolder isEqualTo []) then
				{
				    _lootHolder = _nearestHolder select 0;
				};
				if (isNull _lootHolder) then
				{
				    _lootHolder = createVehicle ["GroundWeaponHolder",_pos,[],3,"CAN_COLLIDE"];
				    _lootHolder setPosATL _pos;
				    _lootHolder setVariable["BIS_enableRandomization",false];
				};
				if (getText (configfile >> "CfgVehicles" >> _itemClassname >> "vehicleClass") == "BackPacks") then
				{
				    _lootHolder addBackpackCargoGlobal [_itemClassname,1];
				}
				else
				{
				    _lootHolder addItemCargoGlobal [_itemClassname,1];
				    if (isClass (configFile >> "CfgWeapons" >> _itemClassname)) then
				    {
				        _magazines = getArray (configFile >> "CfgWeapons" >> _itemClassname >> "magazines");
				        if !(_magazines isEqualTo []) then
				        {
				            {
				                _lootHolder addItemCargoGlobal [_x,3];
				            }
				            forEach _magazines;
				        };
				    };
				};
				[_sessionID, "toastRequest", ["ErrorTitleAndText", ["NOTICE!", "You didn't have enough room in your inventory, your reward has been dropped on the ground!"]]] call ExileServer_system_network_send_to;
			};
		};
	};
}
forEach _reward;
