/**
                    * ExileServer_object_construction_network_addLockRequest
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

                    private["_sessionID","_paramaters","_door","_pincode","_playerObject","_flag","_lastAttackedAt","_constructionBlockDuration","_databaseID"];
_sessionID = _this select 0;
_paramaters = _this select 1;
_door = _paramaters select 0;
_pincode = _paramaters select 1;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if !("Exile_Item_Codelock" in (magazines _playerObject)) then 
	{
		throw "No can do.";
	};
	if !(isNumber(configFile >> "CfgVehicles" >> (typeOf _door) >> "exileIsDoor")) then 
	{
		throw "Really no can do.";
	};
	if !((_door getVariable ["ExileIsLocked",""]) isEqualTo "") then 
	{
		throw "Really really no can do.";
	};
	if !((count _pincode) isEqualTo 4) then 
	{
		throw "Invalid PIN. Please try again.";
	};
	if ((_door animationPhase 'DoorRotation') > 0.5) then 
	{
		throw "Please close the door first.";
	};
	_flag = _door call ExileClient_util_world_getTerritoryAtPosition;
	if !(isNull _flag) then
	{
		_lastAttackedAt = _flag getVariable ["ExileLastAttackAt", false];
		if !(_lastAttackedAt isEqualTo false) then 
		{
			_constructionBlockDuration = getNumber (missiongConfigFile >> "CfgTerritories" >> "constructionBlockDuration");
			if (time - _lastAttackedAt < _constructionBlockDuration * 60) then
			{
				throw (format ["Territory has been under attack within the last %1 minutes.", _constructionBlockDuration]);
			};
		};
	};
	_databaseID = _door getVariable ["ExileDatabaseID",0];
	if(_databaseID isEqualTo 0) then 
	{
		throw "Smt went goof";
	};
	_door setVariable ["ExileIsLocked",-1,true];
	_door setVariable ["ExileAccessCode",_pincode];
	format ["addDoorLock:%1:%2",_pincode,_databaseID] call ExileServer_system_database_query_fireAndForget;
	[_sessionID,"addLockResponse",[_pincode]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to add lock!", _exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};
