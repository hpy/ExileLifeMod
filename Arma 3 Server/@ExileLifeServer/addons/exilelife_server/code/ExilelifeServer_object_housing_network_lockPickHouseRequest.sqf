/**
                    * ExilelifeServer_object_housing_network_lockPickHouseRequest
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

                    private["_sessionID","_paramaters","_houseID","_door","_playerObject","_house","_doors","_doorname","_haslock","_player","_sleepingbagID","_sleepingbag","_houselocks","_founddoor","_arraylockstatus","_arraydoor","_pinCode","_index","_foreachIndex","_lockstatus","_msg","_pincode"];
_sessionID = _this select 0;
_paramaters = _this select 1;
_houseID = _paramaters select 0;
_door = _paramaters select 1;
try 
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "An Unknown player - cannot unlock/lock doors!";
	};
	if !(alive _playerObject) then
	{
		throw "The dead cannot unlock/lock doors! They glide through them!";
	};
	_house = objectFromNetId _houseID;
	if (isNull _house) then
	{
		throw "So this house doesnt exist...";
	};
	if ((_playerObject distance _house) > 20) then
	{
		throw "You are too far away to lock/unlock that door!";
	};
	if !(_house isKindOf "House_F") then
	{
		throw "No can do.";
	};
	if (_door < 1) then 
	{
		throw "That is not a valid door";
	};
	_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	if (_doors < 1) then
	{
		throw "There are no doors to unlock/lock!";
	};
	_doorname = format ["ExileLifeHasLock_%1",_door];
	_haslock = _house getVariable [_doorname,""];
	if (_haslock isEqualTo "") then
	{
		throw "There is no lock on this door!";
	};
	if !("Exile_Item_Knife" in (magazines _player)) then 
	{
		throw "You do not have a knife."; 
	};
	_sleepingbagID = _house getVariable ["ExileLifeTerritoryFlagID", ""];
	if (_sleepingbagID isEqualTo "") then 
	{
		throw "There is no territory on this house!";
	};
	_sleepingbag = objectFromNetId _sleepingbagID;
	_houselocks = _sleepingbag getVariable ["ExileLifeDoorLocks", []];
	_founddoor = false;
	_arraylockstatus = -1;
	{
    	_arraydoor = _x select 0;
   		if (_arraydoor isEqualTo _door) exitWith
    	{
			_founddoor = true;
	    	_arraylockstatus = _x select 1;
    		_pinCode = _x select 2;
			_index = _foreachIndex;
    	};
    }
	forEach _houselocks;
	if !(_founddoor) then 
	{
		throw "Door not found";
	};
	if !(_arraylockstatus isEqualTo 1) then
	{
		throw "Why and how did u lockpick a door thats unlocked?";
	};
	_lockstatus = 0;
	_msg = "Door Unlocked!";
	_houselocks set [_index, [_door, _lockstatus, _pincode]];
	_sleepingbag setVariable ["ExileLifeDoorLocks", _houselocks];
	_house setVariable [_doorname,_lockstatus,true];
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Door unlocked!"]]] call ExileServer_system_network_send_to;
}
catch 
{
	_exception call ExileServer_util_log;
};
