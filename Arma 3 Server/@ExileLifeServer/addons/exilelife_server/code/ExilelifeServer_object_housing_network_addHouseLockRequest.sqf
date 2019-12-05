/**
                    * ExilelifeServer_object_housing_network_addHouseLockRequest
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

                    private["_sessionID","_paramaters","_houseID","_door","_pincode","_playerObject","_house","_doors","_doorname","_sleepingbagID","_sleepingbag","_databaseID","_houselocks","_foundItem","_nolock","_arraydoor"];
_sessionID = _this select 0;
_paramaters = _this select 1;
_houseID = _paramaters select 0;
_door = _paramaters select 1;
_pincode = _paramaters select 2;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "An Unknown player - cannot lock doors!";
	};
	if !(alive _playerObject) then 
	{
		throw "The dead cannot lock doors!"; 
	};	
	_house = objectFromNetId _houseID;
	if (isNull _house) then
	{
		throw "This house doesnt exist!";
	};		
	if ((_playerObject distance _house) > 20) then
	{
		throw "You are too far away to add that lock!";
	};			
	if !("Exile_Item_Codelock" in (magazines _playerObject)) then 
	{
		throw "No can do.";
	};
	if(isNull _house || !(_house isKindOf "House_F")) then
	{
		throw "No can do.";
	};
	_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	if(_doors < 1) then
	{
		throw "There are no doors to lock!";
	};	
	_doorname = format ["ExileLifeHasLock_%1",_door];
	if !((_house getVariable [_doorname,""]) isEqualTo "") then
	{
		throw "There is already a lock on this door!";
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
	if ((count _houselocks) > 0) then
	{
		_foundItem = false;
  		_nolock = true;	
		{
  		  	_arraydoor = _x select 0;
   			if (_arraydoor isEqualTo _door) then
    		{
    			throw "This door already has a lock!";
    		};
    	}
		forEach _houselocks;
 	};
   	_houselocks pushBack [_door, 1, _pincode];
	_sleepingbag setVariable ["ExileLifeDoorLocks", _houselocks];
	_house setVariable [_doorname,1,true]; 
	format["addHouseDoorLock:%1:%2", _houselocks, _databaseID] call ExileServer_system_database_query_fireAndForget;
	[_sessionID,"addLockResponse",[_pincode]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to add lock!", _exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};
