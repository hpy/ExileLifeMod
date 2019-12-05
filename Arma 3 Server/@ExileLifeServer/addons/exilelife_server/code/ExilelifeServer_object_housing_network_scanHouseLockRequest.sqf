/**
                    * ExilelifeServer_object_housing_network_scanHouseLockRequest
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

                    private["_sessionID","_paramaters","_houseID","_door","_player","_object","_house","_lastToggleAt","_sleepingbagID","_sleepingbag","_houselocks","_founddoor","_arraylockstatus","_arraydoor","_pinCode","_index","_foreachIndex","_signature"];
_sessionID = _this select 0;
_paramaters = _this select 1;
_houseID = _paramaters select 0;
_door = _paramaters select 1;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then 
	{
		throw "NOPE"; 
	};
	if ((_player distance _object) > 5) then 
	{
		throw "NOPE"; 
	};
	if !("Exile_Item_ThermalScannerPro" in (magazines _player)) then 
	{
		throw "NOPE"; 
	};
	_house = objectFromNetId _houseID;
	if (isNull _house) then
	{
		throw "NOPE"; 
	};	
	if !(_house isKindOf "House_F") then
	{
		throw "No can do.";
	};	
	_lastToggleAt = _house getVariable [format["ExileLastLockToggleAt_%1",_door], -1];
	if (_lastToggleAt isEqualTo -1) then 
	{
		throw "NOPE"; 
	};
	if ((time - _lastToggleAt) > (15 * 60)) then 
	{
		throw "NOPE"; 
	};
	_sleepingbagID = _house getVariable ["ExileLifeTerritoryFlagID", ""];
	if (_sleepingbagID isEqualTo "") then 
	{
		throw "NOPE";
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
		throw "There is no lock on this door!";
	};
	_signature = _pinCode select [1, 3];
	throw _signature;
}
catch
{
	[_sessionID, "scanCodeLockResponse", [_exception]] call ExileServer_system_network_send_to;
};