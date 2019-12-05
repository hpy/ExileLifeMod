/**
                    * ExilelifeServer_system_jobs_scenes_general_gangRecruitment_onForfeit
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

                    private["_sessionID","_playerObject","_jobClassname","_gang","_result","_respect","_blacklisted","_playerID","_gangBlacklist","_pid","_dateAdded","_dateExpire","_index","_lengthOfBlacklist","_lengthOfBlacklistEXT","_currentTime","_blackListEndTime","_newTime","_storedTime","_vehicleNetID","_vehicleObject"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_jobClassname = _this select 2;
_gang = _this select 3;
_result = "";
_respect = _playerObject getVariable ["ExileScore", 0];
_respect = _respect - 1000;
if (_respect < 0) then
{
	_respect = 0;
};
_playerObject setVariable ["ExileScore", _respect,true];
format["setAccountScore:%1:%2", _respect, _playerObject getVariable ["ExileLifePID", -1]] call ExileServer_system_database_query_fireAndForget;
_blacklisted = false;
_playerID = _playerObject getVariable ["ExileDatabaseID", 0];
_gangBlacklist = missionNamespace getVariable [(format ["ExileLifeGangBlacklist:%1",_gang]),[]];
if !(_gangBlacklist isEqualto []) then
{
	if !((count _gangBlacklist) > 0) exitWith {};
	{
		_pid = _x select 0;
		_dateAdded = _this select 1;
		_dateExpire = _this select 2;
		_index = _forEachIndex;
		if (_pid isEqualTo _playerID) exitWith
		{
			_blacklisted = true;
		};
	}forEach _gangBlacklist;
};
_lengthOfBlacklist = getArray(missionConfigFile >> "CfgGangData" >> "Blacklist" >> "gangrecruitmentforfeit");
_lengthOfBlacklistEXT = _lengthOfBlacklist call ExileLifeServer_util_time_toEXTDB;
_currentTime = call ExileServer_util_time_currentTime;
_lengthOfBlacklist pushBack 0;
_blackListEndTime = [_currentTime,_lengthOfBlacklist] call ExileLifeServer_util_time_addTimeEXTDB;
if (_blacklisted) then
{
	_newTime = [_blackListEndTime, _currentTime] call ExileLifeServer_util_time_timeLeft;
	_storedTime = [_dateExpire, _currentTime] call ExileLifeServer_util_time_timeLeft;
	if (_newTime < _storedTime) then 
	{
		_blackListEndTime = _dateExpire;
	};
	_gangBlacklist set [_index,[_playerID,_currentTime,_blackListEndTime]];
}
else
{
	_gangBlacklist pushBackUnique [_playerID,_currentTime,_blackListEndTime];
};
format["updateGangBlacklist:%1:%2",_gangBlacklist,_gang] call ExileServer_system_database_query_fireAndForget;
missionNamespace setVariable [(format ["ExileLifeGangBlacklist:%1",_gang]),_gangBlacklist];
_vehicleNetID = _playerObject getVariable ["ExileLifeJobVehicle",""];
if !(_vehicleNetID isEqualTo "") then
{
	_vehicleObject = objectFromNetId _vehicleNetID;
	if (alive _vehicleObject) then
	{
		_vehicleObject call ExileServer_object_vehicle_remove;
	};
};
_result