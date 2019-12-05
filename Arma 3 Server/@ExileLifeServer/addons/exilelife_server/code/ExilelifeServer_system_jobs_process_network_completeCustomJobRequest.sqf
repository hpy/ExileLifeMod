/**
                    * ExilelifeServer_system_jobs_process_network_completeCustomJobRequest
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

                    private["_sessionID","_customMessage","_playerObject","_currentJobs","_jobClassname","_currentStep","_jobExtras","_filePath","_code","_result","_nextStep","_progressionMap","_steps","_neededItems","_check","_neededVehicleItems","_current","_returnVehicle","_jobType","_uberJob","_uberJobID","_offeredByPID","_offeredByPlayerSessionID","_offeredByPlayer","_offeredByPlayerMsg","_members","_pid","_recipientSessionID","_pObject","_completedJobs","_reward"];
_sessionID = _this select 0;
_customMessage = _this select 1; 
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
		throw format["%1 tried to complete with no jobs!",name _playerObject];
	};
	_jobClassname = _currentJobs select 0;
	_currentStep = _currentJobs select 1;
	_jobExtras = _currentJobs select 4;
	if !(isClass (configFile >> "CfgJobs" >> _jobClassname)) then
	{
		throw format["Job %1 does not exist in config!",_jobClassname];
	};
	_filePath = getText (configFile >> "CfgJobs" >> _jobClassname >> "path");
	if !(_filePath isEqualTo "") then
	{
		_code = missionNamespace getVariable [format["ExileLifeServer_system_jobs_scenes_%1_onCustomCompletion",_filePath],""];
		if !(_code isEqualTo "") then
		{
			_result = [_sessionID,_playerObject,_jobClassname,_nextStep] call _code;
			if !(_result isEqualTo "") then
			{
				throw _result;
			};
		};
	};
	_progressionMap = (configFile >> "CfgJobs" >> _jobClassname >> "Progression");
	_steps = [_progressionMap] call ExileLifeClient_util_config_getSubClasses;
	if (count(_steps) < _nextStep) then
	{
		throw format["Job %1 does not have the required steps",_jobClassname];
	};
	if (count(_steps) isEqualTo _currentStep) then
	{
		throw format["Job %2 isn't ready to be completed by %1",name _playerObject, _jobClassname];
	};
	_neededItems = getArray(_progressionMap >> format["Step%1",count(_progressionMap) - 1] >> "requiredItems");
	if !(_neededItems isEqualTo []) then
	{
		_check = [_playerObject,_neededItems] call ExileLifeServer_system_jobs_util_items_remove;
		if !(_check) then
		{
			throw 1;
		};
	};
	_neededVehicleItems = getArray(_current >> "requiredVehicleItems");
	if !(_neededVehicleItems isEqualTo []) then
	{
		_check = [_playerObject,_neededVehicleItems] call ExileLifeServer_system_jobs_util_vehicle_removeInventory;
		if !(_check) then
		{
			throw ["Your vehicle does not contain the required items!"];
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
	if (isText(configFile >> "CfgJobs" >> _jobClassname >> "givenVehicle")) then {
			_playerObject setVariable ["ExileLifeJobVehicle","",true];
	};
	_jobType = getNumber(configFile >> "CfgJobs" >> _jobClassname >> "jobType");
	switch (_jobType) do {
	    case 1: {
			_uberJob = _jobExtras select 0;
			_uberJobID = _uberJob select 0;
			_offeredByPID = (_uberJob select 7) select 0;
			_offeredByPlayerSessionID = _offeredByPID call ExileLifeServer_system_session_getIDfromDBID;
			_offeredByPlayer = _offeredByPlayerSessionID call ExileServer_system_session_getPlayerObject;
			if !(isNull _offeredByPlayer)then{
			    [_offeredByPlayer,_uberJobID] call ExileLifeServer_system_jobs_uber_removeJobOffer;
				_offeredByPlayerMsg = getText(configFile >> "CfgJobs" >> _jobClassname >> "offeredByPlayerOnCustomCompletedMsg");
				if !(_offeredByPlayerMsg isEqualTo "") then{
					[_offeredByPlayerSessionID,"toastRequest",["InfoTitleOnly",[_offeredByPlayerMsg]]] call ExileServer_system_network_send_to;
				};
			};
	    };
		default{};
	};
	if (isNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredMembers")) then {
		_members = (missionNamespace getVariable format["ExileLifeJobMembers:%1",_jobClassname]);
		missionNamespace setVariable [format["ExileLifeJobMembers:%1",_jobClassname],nil];
		if (typeName _members == "Array") then
		{
			{
				_pid = _x;
				_recipientSessionID = _pid call ExileLifeServer_system_session_getIDfromDBID;
				_pObject = _recipientSessionID call ExileServer_system_session_getPlayerObject;
				if  !(isNull _pObject) then
				{
					_pObject setVariable ["ExileLifeJobs:Current",[]];
					_completedJobs = _pObject getVariable ["ExileLifeJobs:Completed",[]];
					_completedJobs pushBack _jobClassname;
					_pObject setVariable ["ExileLifeJobs:Completed",_completedJobs];
					_reward = getArray(configFile >> "CfgJobs" >> _jobClassname >> "reward");
					if !(_reward isEqualTo []) then
					{
						[_recipientSessionID, _pObject,_reward] call ExileLifeServer_system_jobs_util_reward;
					};
					[_recipientSessionID,"completeCustomJobTask",[_jobClassname,str(_pObject getVariable ["ExileScore",0]),_customMessage]] call ExileServer_system_network_send_to;
					if (isText(configFile >> "CfgJobs" >> _jobClassname >> "givenVehicle")) then {
						_pObject setVariable ["ExileLifeJobVehicle","",true];
					};
					if !((typename _completedJobs) == "ARRAY") then
					{
						_completedJobs = [];
					};
					format["updatePlayerJobs:%1:%2:%3:%4",[],_completedJobs,_pObject getVariable ["ExileLifeJobs:Failed",[]],_pObject getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
					[_recipientSessionID,_jobClassname] call ExileLifeServer_system_jobs_process_queue_remove;
					format["%1 completed job %2",name _pObject,_jobClassname] call ExileLifeServer_util_log;
				};
			}forEach _members;
		};
	}else{
			_playerObject setVariable ["ExileLifeJobs:Current",[]];
			_completedJobs = _playerObject getVariable ["ExileLifeJobs:Completed",[]];
			_completedJobs pushBack _jobClassname;
			_playerObject setVariable ["ExileLifeJobs:Completed",_completedJobs];
			_reward = getArray(configFile >> "CfgJobs" >> _jobClassname >> "reward");
			if !(_reward isEqualTo []) then
			{
				[_sessionID, _playerObject,_reward] call ExileLifeServer_system_jobs_util_reward;
			};
			[_sessionID,"completeCustomJobTask",[_jobClassname,str(_playerObject getVariable ["ExileScore",0]),_customMessage]] call ExileServer_system_network_send_to;
			if !((typename _completedJobs) == "ARRAY") then
			{
				_completedJobs = [];
			};
			format["updatePlayerJobs:%1:%2:%3:%4",[],_completedJobs,_playerObject getVariable ["ExileLifeJobs:Failed",[]],_playerObject getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
			[_sessionID,_jobClassname] call ExileLifeServer_system_jobs_process_queue_remove;
			format["%1 completed job %2",name _playerObject,_jobClassname] call ExileLifeServer_util_log;
	};
	_playerObject setVariable ["ExileLifeJobMultiJob",nil,true];
}
catch
{
	if (_exception isEqualTo 1) then
	{
		[_sessionID,"deniedJobCompletion",[_jobClassname]] call ExileServer_system_network_send_to;
	}
	else
	{
		format["exilelifeserver_system_jobs_process_network_completeJobRequest: %1",_exception] call ExileLifeServer_util_log;
	};
};
true
