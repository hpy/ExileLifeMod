/**
                    * ExilelifeServer_system_jobs_process_network_progressJobRequest
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

                    private["_sessionID","_playerObject","_currentJobs","_jobClassname","_currentStep","_time","_jobExtras","_nextStep","_progressionMap","_steps","_current","_next","_neededItems","_check","_neededVehicleItems","_addItems","_giveVehicle","_vehicle","_returnVehicle","_jobType","_uberJob","_offeredByPID","_offeredByPlayerSessionID","_offeredByPlayer","_offeredByPlayerMsg","_destinationType","_gangMission","_positionLocations","_position","_filePath","_code","_result","_drivers","_members","_pid","_recipientSessionID","_pObject","_jobArray"];
_sessionID = _this select 0;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player is Null";
	};
	_currentJobs = _playerObject getVariable ["ExileLifeJobs:Current",[]];
	if (_currentJobs isEqualTo []) then
	{
		throw format["%1 tried to progress with no jobs!",name _playerObject];
	};
	_jobClassname = _currentJobs select 0;
	_currentStep = _currentJobs select 1;
	_time = _currentJobs select 2;
	_jobExtras = _currentJobs select 4;
	_nextStep = _currentStep + 1;
	if !(isClass (configFile >> "CfgJobs" >> _jobClassname)) then
	{
		throw format["Job %1 does not exist in config!",_jobClassname];
	};
	_progressionMap = (configFile >> "CfgJobs" >> _jobClassname >> "Progression");
	_steps = [_progressionMap] call ExileLifeClient_util_config_getSubClasses;
	if (count(_steps) < _nextStep) then
	{
		throw format["Job %1 does not have the required steps",_jobClassname];
	};
	_current = (_progressionMap >> format["Step%1",_currentStep]);
	_next = (_progressionMap >> format["Step%1",_nextStep]);
	if (!(isClass(_current)) || !(isClass(_next))) then
	{
		throw format["Job %1 is missing steps!",_jobClassname];
	};
	_neededItems = getArray(_current >> "requiredItems");
	if !(_neededItems isEqualTo []) then
	{
		_check = [_playerObject,_neededItems] call ExileLifeServer_system_jobs_util_items_remove;
		if !(_check) then
		{
			throw "Error: Invalid Required Items";
		};
	};
	_neededVehicleItems = getArray(_current >> "requiredVehicleItems");
	if !(_neededVehicleItems isEqualTo []) then
	{
		_check = [_playerObject,_neededVehicleItems] call ExileLifeServer_system_jobs_util_vehicle_removeInventory;
		if !(_check) then
		{
			throw "Error: Invalid Required Vehicle Items";
		};
	};
	_addItems = getArray(_current >> "givenItems");
	if !(_addItems isEqualTo []) then
	{
		_check = [_playerObject,_addItems] call ExileLifeServer_system_jobs_util_items_add;
		if !(_check) then
		{
			throw "Error: Invalid Given Items";
		};
	};
	_giveVehicle = getText(_current >> "givenVehicle");
	if !(_giveVehicle isEqualTo "") then
	{
		_vehicle = [_playerObject,_giveVehicle,_jobClassname] call ExileLifeServer_system_jobs_util_vehicle_nonPersistent;
		if (isNull _vehicle) then
		{
			throw "Error: Vehicle Creation Failed";
		};
	};
	_neededVehicleItems = getArray(_current >> "givenVehicleItems");
	if !(_neededVehicleItems isEqualTo []) then
	{
		_check = [_playerObject,_neededVehicleItems] call ExileLifeServer_system_jobs_util_vehicle_add;
		if !(_check) then
		{
			throw "Error: Invalid Vehicle Items";
		};
	};
	if (isNumber(configFile >> "CfgJobs" >> _jobClassname >> "returnVehicle")) then
	{
		_returnVehicle = getNumber(configFile >> "CfgJobs" >> _jobClassname >> "returnVehicle");
		if (_returnVehicle == _currentStep) then
		{
			_check = [_sessionID,_jobClassname] call ExileLifeServer_system_jobs_util_vehicle_returnVehicle;
			if !(_check isEqualTo "") then
			{
				throw "Error: Vehicle Return Failed";
			};
		};
	};
	_jobType = getNumber(configFile >> "CfgJobs" >> _jobClassname >> "jobType");
	switch (_jobType) do {
	    case 1: {
			_uberJob = _jobExtras select 0;
			_offeredByPID = (_uberJob select 7) select 0;
			_offeredByPlayerSessionID = _offeredByPID call ExileLifeServer_system_session_getIDfromDBID;
			_offeredByPlayer = _offeredByPlayerSessionID call ExileServer_system_session_getPlayerObject;
			if !(isNull _offeredByPlayer)then{
				_offeredByPlayerMsg = getText(_current >> "offeredByPlayerOnProgressMsg");
				if !(_offeredByPlayerMsg isEqualTo "") then{
					[_offeredByPlayerSessionID,"toastRequest",["InfoTitleOnly",[_offeredByPlayerMsg]]] call ExileServer_system_network_send_to;
				};
			};
	    };
		default{};
	};
	_destinationType = getText(_next >> "destinationType");
	if !(_destinationType isEqualTo "") then
	{
		if (_destinationType == "gang") then
		{
			_gangMission = getArray(_next >> "randomGangMission");
			if !(_gangMission isEqualTo []) then
			{
				_destinationType = _gangMission call BIS_fnc_selectRandom; 
			};
		};
		_positionLocations = missionnamespace getvariable [format["ExileLifeJobPos_%1",_destinationType],[]];
		_position = _positionLocations call BIS_fnc_selectRandom;
	}
	else
	{
		_position = getArray(_next >> "destinationPOS");
	};
	if (_position isEqualTo []) then
	{
		throw "Error: Job does not have a location";
	};
	_filePath = getText (configFile >> "CfgJobs" >> _jobClassname >> "path");
	_jobExtras = [];
	if !(_filePath isEqualTo "") then
	{
		_code = missionNamespace getVariable [format["ExileLifeServer_system_jobs_scenes_%1_onProgression_Step%2",_filePath,_nextStep],""];
		if !(_code isEqualTo "") then
		{
			_result = [_sessionID,_jobClassname,_nextStep] call _code;
			if !(_result isEqualTo "") then
			{
				throw _result;
			};
		};
		_code = missionNamespace getVariable [format["ExileLifeServer_system_jobs_scenes_%1_dbstore",_filePath],""];
		if !(_code isEqualTo "") then
		{
			_jobExtras = [_sessionID,_playerObject,_jobClassname,_position] call _code;
		};
	};
	if (isNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredMembers")) then
	{
		_drivers = [];
		if !(isNull _vehicle) then
		{
				_drivers =_vehicle getVariable ["ExileLifePermittedDrivers",[]];
		};
		_members = missionNamespace getVariable format["ExileLifeJobMembers:%1",_jobClassname];
		if (typeName _members == "Array") then
		{
			{
				_pid = _x;
				_recipientSessionID = _pid call ExileLifeServer_system_session_getIDfromDBID;
				_pObject = _recipientSessionID call ExileServer_system_session_getPlayerObject;
				if !(isNull _pObject) then{
					if !(isNull _vehicle) then {
							_pObject setVariable ["ExileLifeJobVehicle",netId _vehicle,true];
							_drivers pushBackUnique (netID _pObject);
					};
					if(_recipientSessionID!=_sessionID) then {
						_pObject setVariable ["ExileLifeJobs:Current",[_jobClassname,_nextStep,_time,_position,_jobExtras]];
						if (_recipientSessionID call ExileServer_system_session_isRegisteredId)then{
							[_recipientSessionID,"addJobTask",[_jobClassname,_nextStep,_time,_position]] call ExileServer_system_network_send_to;
						};
						if !(isNull _vehicle) then
						{
								_drivers pushBackUnique (netID _pObject);
								_pObject setVariable ["ExileLifeJobVehicle",netId _vehicle,true];
						};
						_jobArray = format["getPlayerJobsCurrent:%1",_pid] call ExileServer_system_database_query_selectSingleField;
						format["updatePlayerJobsCurrent:%1:%2",[_jobClassname,_nextStep,_jobArray select 2,_position,_jobExtras],_pid] call ExileServer_system_database_query_fireAndForget;
					};
				};
			}forEach _members;
			if !(isNull _vehicle) then {
				_vehicle setVariable ["ExileLifePermittedDrivers",_drivers,true];
			};
		};
	};
	_playerObject setVariable ["ExileLifeJobs:Current",[_jobClassname,_nextStep,_time,_position,_jobExtras]];
	if (_sessionID call ExileServer_system_session_isRegisteredId)then{
		[_sessionID,"addJobTask",[_jobClassname,_nextStep,_time,_position]] call ExileServer_system_network_send_to;
	};
	_jobArray = format["getPlayerJobsCurrent:%1",_playerObject getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_selectSingleField;
	format["updatePlayerJobsCurrent:%1:%2",[_jobClassname,_nextStep,_jobArray select 2,_position,_jobExtras],_playerObject getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
	if (isText(_next >> "notifyMsg"))  then {
		if !([format["Step%1",_nextStep],_jobClassname] call ExileLifeServer_system_jobs_util_notify_gang) then {
			"ProgressJobRequest: Error sending job intel to Gangs" call ExileLifeServer_util_log;
		};
	};
	format["%1 progressed job %2 to step %3 at %4",name _playerObject,_jobClassname,_nextStep,_position] call ExileLifeServer_util_log;
}
catch
{
	if (_exception isEqualType []) then
	{
		[_sessionID,"deniedJobProgression",[_jobClassname,_exception select 0]] call ExileServer_system_network_send_to;
	}
	else
	{
		format["exilelifeserver_system_jobs_process_network_progressJobRequest: %1",_exception] call ExileLifeServer_util_log;
	};
};
true
