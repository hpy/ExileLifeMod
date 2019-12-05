/**
                    * ExileServer_system_network_event_onHandleDisconnect
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

                    private["_unit","_id","_pos","_newUnitDeaths","_naughtyCHK","_constructionObject","_animal","_sessionID","_currentJobs","_jobClassname","_currentFailed","_currentJob","_result","_unitClass","_unitGang","_playerUID","_uberJobList","_uberJobType"];
_unit = _this select 0;
_id = _this select 1;
_uid = _this select 2;
_name = _this select 3;
_pos = getPos _unit;
_newUnitDeaths = _unit getVariable ["ExileDeaths", 0];
_naughtyCHK = false;
if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then
{
	_constructionObject = _unit getVariable ["ExileConstructionObject", objNull];
	if !(isNull _constructionObject) then
	{
		deleteVehicle _constructionObject;
	};
	if (_unit getVariable ["IsPlayingRussianRoulette", false]) then
	{
		_unit call ExileServer_system_russianRoulette_event_onPlayerDisconnected;
		_unit setVariable ["ExileIsDead", false];
	};
	_animal = missionNamespace getVariable [format ["ExileAnimal%1", _uid], objNull];
	if !(isNull _animal) then
	{
		deleteVehicle _animal;
		missionNamespace setVariable [format ["ExileAnimal%1", _uid], nil];
	};
	_sessionID = _unit getVariable ["ExileSessionID", ""];
	_currentJobs = _unit getVariable ["ExileLifeJobs:Current",[]];
	if !(_currentJobs isEqualTo []) then
	{
		_jobClassname = _currentJobs select 0;
		if (getNumber(configFile >> "CfgJobs" >> _jobClassname >> "punishOnDisconnect") > 0) then{
			_unit setVariable ["ExileIsDead", false];
			format["PUNISH ON DISCONNECT (MISSION): %1 has been killed.", name _unit] call ExileLifeServer_util_log;
			format["updatePlayerJobsCurrent:%1:%2",[],_unit getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
			_currentFailed = _unit getVariable ["ExileLifeJobs:Failed",[]];
			_currentJob = _unit getVariable ["ExileLifeJobs:Current",[]];
			_currentFailed pushback (_currentJob select 0);
			format["updatePlayerJobsFailed:%1:%2",_currentFailed,_unit getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
		};
		if (getNumber(configFile >> "CfgJobs" >> _jobClassname >> "failOnDisconnect") > 0) then
		{
			format["updatePlayerJobsCurrent:%1:%2",[],_unit getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
			_result = [_sessionID] call ExileLifeServer_system_jobs_process_network_failJobRequest;
		};
	};
	_unitClass = _unit getVariable ['ExileLifeClientClass',""];
	switch (_unitClass) do {
	    case ("Murderer"): {
				ExileLifeOnlineMedics deleteAt (ExileLifeOnlineMedics findIf {_x isEqualTo _sessionID});
	    };
		default{};
	};
	_unitGang = _unit getVariable ['ExileLifeClientClass',""];
	switch (_unitClass) do {
	    case ("Guard"): {
				ExileLifeOnlineGuards deleteAt (ExileLifeOnlineGuards findIf {_x isEqualTo _sessionID});
	    };
		default{};
	};
	format["endAccountSession:%1:%2", _uid, _unit getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
	missionNamespace setVariable [format["ExileLifeSessionUID%1", _playerUID], nil];	
	if !(_unit getVariable ["ExileIsDead", false]) then
	{
		_currentJobs = _unit getVariable ["ExileLifeJobs:Current",[]];
		if !(_currentJobs isEqualTo []) then
		{
			_jobClassname = _currentJobs select 0;
			if (getNumber(configFile >> "CfgJobs" >> _jobClassname >> "cancelOnDisconnect") > 0) then
			{
				_unit setVariable ["ExileIsDead", false];
				format["PUNISH ON DISCONNECT (MISSION: %2): %1 has been killed.", name _unit,_jobClassname] call ExileLifeServer_util_log;
				_naughtyCHK = true;
			};
		};
		if (_unit getVariable ["ExileLifeClientUnconscious",false]) then
		{
			format["PUNISH ON DISCONNECT (UNCONSCIOUS): %1 has been killed.", name _unit] call ExileLifeServer_util_log;
			_naughtyCHK = true;
		};
		if (_unit getVariable ['ExileLifeClientIncapacitated',false]) then
		{
			format["PUNISH ON DISCONNECT (REVIVE): %1 has been killed.", name _unit] call ExileLifeServer_util_log;
			_naughtyCHK = true;
		};
		if (_unit getVariable ["ExileIsHandcuffed", false]) then
		{
			format["PUNISH ON DISCONNECT (HANDCUFF): %1 has been killed.", name _unit] call ExileLifeServer_util_log;
			_naughtyCHK = true;
		};
		if (_unit getVariable ["ExileLifePrisoner",false]) then
		{
			_unit setVariable ["ExileLifePrisoner",false,true];
			format["PUNISH ON DISCONNECT (PRISON): %1 has been killed.", name _unit] call ExileLifeServer_util_log;
			(_unit getvariable ["ExileLifePrisonerID",""]) call ExileLifeServer_system_prison_prisonerEscape;
			_naughtyCHK = true;
		};
		if (_naughtyCHK) then
		{
			_unit setDamage 999;
			format["insertPlayerHistory:%1:%2:%3:%4:%5", _uid, _name, _pos select 0, _pos select 1, _pos select 2] call ExileServer_system_database_query_fireAndForget;
			format["deletePlayer:%1", _unit getVariable ["ExileDatabaseId", -1]] call ExileServer_system_database_query_fireAndForget;
			_unit setVariable ["ExileIsDead", true];
			_unit setVariable ["ExileName", _name, true]; 
			_unit call ExileServer_object_flies_spawn;
			_newUnitDeaths = _newUnitDeaths + 1;
			_unit setVariable ["ExileDeaths", _newUnitDeaths];
			format["addAccountDeath:%1", _unit getVariable ["ExileLifePID", -1]] call ExileServer_system_database_query_fireAndForget;
			_unit call ExileServer_object_player_sendStatsUpdate;
			_currentJob = _unit getVariable ["ExileLifeJobs:Current",[]];
			if !(_currentJob isEqualTo []) then
			{
				_jobClassname = _currentJob select 0;
				if (isNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredMembers")) then {
					if(count (missionNamespace getVariable format["ExileLifeJobMembers:%1",_jobClassname]) > 1) then {
						_result = [_sessionID,[netID _unit]] call ExileLifeServer_system_jobs_process_network_overrideJobRequest;
					}else{
						_result = [_sessionID] call ExileLifeServer_system_jobs_process_network_failJobRequest;
					};
				}else{
					_result = [_sessionID] call ExileLifeServer_system_jobs_process_network_failJobRequest;
				};
			};
	 	   _uberJobList = _unit getVariable ['ExileLifeClientUberJobsOffered',[]];
	 	   {
	 		   _uberJobType = _x select 1;
	 		   if(getNumber(configFile >> "CfgJobs" >> _uberJobType >> "payUberOnSuicide") == 1)then{
	 			  _result =  _x call ExileLifeServer_system_jobs_uber_cancelSuccessfulUber;
	 		   };
	 	   }forEach _uberJobList;
			_sessionID call ExileServer_system_session_end;
			_unit setVariable ["ExileSessionID", nil];
		}
		else
		{
			_sessionID call ExileServer_system_session_end;
			_unit setVariable ["ExileSessionID", nil];
			_unit call ExileServer_object_player_database_update;
			deleteVehicle _unit;
			_unit = objNull;
		};
	};
};
if !(isNull _unit) then
{
	[_unit] joinSilent (createGroup independent);
};
false
