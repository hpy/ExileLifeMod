/**
                    * ExilelifeServer_object_housing_network_houseLockToggle
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

                    private["_sessionID","_paramaters","_houseID","_door","_pincode","_house","_accessDenied","_accessDenialExpiresAt","_playerObject","_doors","_doorname","_haslock","_sleepingbagID","_sleepingbag","_databaseID","_houselocks","_founddoor","_arraylockstatus","_arraydoor","_arraypincode","_index","_foreachIndex","_numberOfFails","_lockstatus","_msg"];
_sessionID = _this select 0;
_paramaters = _this select 1;
_houseID = _paramaters select 0;
_door = _paramaters select 1;
_pincode = _paramaters select 2;
try
{
	_house = objectFromNetId _houseID;
	if (isNull _house) then
	{
		throw "So this house doesnt exist...";
	};
	_accessDenied = false;
	if (_house getVariable [format["ExileAccessDenied_%1",_door], false]) then
	{
		_accessDenialExpiresAt = _house getVariable [format["ExileAccessDeniedExpiresAt_%1",_door], 0];
		if (time >= _accessDenialExpiresAt) then
		{
			_house setVariable [format["ExileAccessDenied_%1",_door], false];
			_house setVariable [format["ExileAccessDeniedExpiresAt_%1",_door], 0];
		}
		else
		{
			throw "Access Denied!";
		};
	};
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "An Unknown player - cannot unlock/lock doors!";
	};
	if !(alive _playerObject) then
	{
		throw "The dead cannot unlock/lock doors! They glide through them!";
	};
	if (isNull _house) then
	{
		throw "This house doesnt exist!";
	};
	if ((_playerObject distance _house) > 20) then
	{
		throw "You are too far away to lock/unlock that door!";
	};
	if !(_house isKindOf "House_F") then
	{
		throw "No can do.";
	};
	_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	if(_doors < 1) then
	{
		throw "There are no doors to unlock/lock!";
	};
	_doorname = format ["ExileLifeHasLock_%1",_door];
	_haslock = _house getVariable [_doorname,""];
	if (_haslock isEqualTo "") then
	{
		throw "There is no lock on this door!";
	};
	if !((count _pincode) isEqualTo 4) then
	{
		throw "Invalid PIN. Please try again.";
	};
	if ((_house animationPhase (format["door_%1_rot",_door])) > 0.5) then
	{
		throw "Please close the door first.";
	};
	_sleepingbagID = _house getVariable ["ExileLifeTerritoryFlagID", ""];
	if (_sleepingbagID isEqualTo "") then 
	{
		throw "NOPE";
	};
	_sleepingbag = objectFromNetId _sleepingbagID;
	_databaseID = _sleepingbag getVariable ["ExileDatabaseID",0];
	if(_databaseID isEqualTo 0) then
	{
		throw "Smt went goof";
	};
	_houselocks = _sleepingbag getVariable ["ExileLifeDoorLocks", []];
	_founddoor = false;
	_arraylockstatus = -1;
	{
    	_arraydoor = _x select 0;
   		if (_arraydoor isEqualTo _door) exitWith
    	{
			_founddoor = true;
	    	_arraylockstatus = _x select 1;
    		_arraypincode = _x select 2;
			_index = _foreachIndex;
    	};
    }
	forEach _houselocks;
	if !(_founddoor) then
	{
		throw "This Door doesnt have a lock!";
	}
	else
	{
		if((count _arraypincode) isEqualTo (count _pincode))then
		{
			if (_arraypincode isEqualTo _pincode) then
			{
			}
			else
			{
				_numberOfFails = _house getVariable [format["ExileNumberOfFailedLocks_%1",_door], 0];
				_numberOfFails = _numberOfFails + 1;
				_house setVariable [format["ExileNumberOfFailedLocks_%1",_door], _numberOfFails];
				switch (_numberOfFails) do
				{
					case 1:
					{
						throw "Wrong PIN! Two tries remaining.";
					};
					case 2:
						{
						throw "Wrong PIN! One try remaining.";
					};
					default
					{
						_house setVariable [format["ExileAccessDenied_%1",_door], true];
						_house setVariable [format["ExileAccessDeniedExpiresAt_%1",_door], time + (5 * 60)];
						throw "Wrong PIN! Access denied for five minutes.";
					};
				};
			};
		};
	};
	if (_arraylockstatus isEqualTo 1) then
	{
		_lockstatus = 0;
		_msg = "Door Unlocked!";
	}
	else
	{
		if (_arraylockstatus isEqualTo 0) then
		{
			_lockstatus = 1;
			_msg = "Door Locked!"
		}
		else
		{
			throw "something really weird just went down";
		};
	};
	_houselocks set [_index, [_door, _lockstatus, _pincode]];
	_sleepingbag setVariable ["ExileLifeDoorLocks", _houselocks];
	_house setVariable [_doorname,_lockstatus,true];
	_house setVariable [format["ExileAccessDenied_%1",_door], false];
	_house setVariable [format["ExileAccessDeniedExpiresAt_%1",_door], 0];
	_house setVariable [format["ExileLastLockToggleAt_%1",_door], time];
	format["updateHouseLock:%1:%2", _houselocks, _databaseID] call ExileServer_system_database_query_fireAndForget;
	[_sessionID,"lockToggleResponse",[_msg, true, netID _house, _door, _pincode,_lockstatus]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID,"lockToggleResponse",[_exception, false, "", -1, "", 1]] call ExileServer_system_network_send_to;
};
