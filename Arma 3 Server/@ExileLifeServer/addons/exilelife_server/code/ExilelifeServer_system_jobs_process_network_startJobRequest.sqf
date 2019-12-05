/**
                    * ExilelifeServer_system_jobs_process_network_startJobRequest
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

                    private["_sessionID","_package","_jobClassname","_msg","_playerObject","_addItems","_check","_giveVehicle","_vehicle","_neededVehicleItems","_position","_destinationType","_gangMission","_positionLocations","_jobExtras","_filePath","_code","_result","_timeToComplete","_timeToCompleteEXT","_timeToEnd","_currentTime","_endTime","_params","_pid","_drivers","_members","_recipientSessionID","_pObj"];
_sessionID = _this select 0;
_package = _this select 1;
_jobClassname = _package select 0;
_msg = false;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player is Null";
	};
	_addItems = getArray(configFile >> "CfgJobs" >> _jobClassname >> "startingEquipment");
	if !(_addItems isEqualTo []) then
	{
		_check = [_playerObject,_addItems] call ExileLifeServer_system_jobs_util_items_add;
		if !(_check) then
		{
			_msg = true;
			throw "You don't have enough room in your Inventory to add the required items!";
		};
	};
	_giveVehicle = getText(configFile >> "CfgJobs" >> _jobClassname >> "givenVehicle");
	if !(_giveVehicle isEqualTo "") then
	{
		_vehicle = [_playerObject,_giveVehicle,_jobClassname] call ExileLifeServer_system_jobs_util_vehicle_nonPersistent;
		if (isNull _vehicle) then
		{
			throw "Error: Vehicle Creation Failed";
		};
	};
	_neededVehicleItems = getArray(configFile >> "CfgJobs" >> _jobClassname >> "Progression" >> "Step0" >> "givenVehicleItems");
	if !(_neededVehicleItems isEqualTo []) then
	{
		_check = [_playerObject,_neededVehicleItems] call ExileLifeServer_system_jobs_util_vehicle_add;
		if !(_check) then
		{
			throw "Error: Invalid Vehicle Items";
		};
	};
	_position = getArray(configFile >> "CfgJobs" >> _jobClassname >> "Progression" >> "Step0" >> "destinationPOS");
	_destinationType = toLower(getText(configFile >> "CfgJobs" >> _jobClassname >> "Progression" >> "Step0" >> "destinationType"));
	if (_destinationType != "") then {
		if(_destinationType == "gang")then{
			_gangMission = getArray(configFile >> "CfgJobs" >> _jobClassname >> "Progression" >> "Step0" >> "randomGangMission");
			if !(_gangMission isEqualTo []) then
			{
				_destinationType = toLower(selectRandom _gangMission); 
			};
		};
		_positionLocations = missionnamespace getvariable [format["ExileLifeJobPos_%1",_destinationType],[]];
		if (count _positionLocations == 0) then
		{
			throw "Error: Job does not have a location";
		};
		diag_log format["_destinationType: %1",_destinationType];
				_position = _positionLocations call BIS_fnc_selectRandom;
		diag_log format["_positionLocations: %1 _position: %2",_positionLocations,_position];
	};
	if (count _position == 0) then
	{
		throw "Error: Job does not have a location";
	};
	_jobExtras = [];
	_filePath = getText (configFile >> "CfgJobs" >> _jobClassname >> "path");
	if !(_filePath isEqualTo "") then
	{
		_code = missionNamespace getVariable [format["ExileLifeServer_system_jobs_scenes_%1_onInit",_filePath],""];
		if !(_code isEqualTo "") then
		{
			_result = [_sessionID,_playerObject,_jobClassname,_position] call _code;
			if !(_result isEqualTo [])then{
				_msg = _result select 0;
				throw (_result select 1);
			};
		};
		_code = missionNamespace getVariable [format["ExileLifeServer_system_jobs_scenes_%1_dbstore",_filePath],""];
		if !(_code isEqualTo "") then
		{
			_jobExtras = [_sessionID,_playerObject,_jobClassname,_position] call _code;
		};
	};
	[_sessionID,_jobClassname] call ExileLifeServer_system_jobs_process_queue_add;
	_timeToComplete = getArray(configFile >> "CfgJobs" >> _jobClassname >> "Time" >> "timeToComplete");
	_timeToCompleteEXT = _timeToComplete call ExileLifeServer_util_time_toEXTDB;
	_timeToEnd = floor((_timeToCompleteEXT call ExileServer_util_time_toMinutes) * 60 + parseNumber("extDB3" callExtension "9:UPTIME:SECONDS"));
	_playerObject setVariable ["ExileLifeJobs:Current",[_jobClassname,0,str(_timeToEnd),_position,_jobExtras]];
	if (_sessionID call ExileServer_system_session_isRegisteredId)then{
		[_sessionID,"addJobTask",[_jobClassname,0,str(_timeToEnd),_position]] call ExileServer_system_network_send_to;
	};
	_currentTime = call ExileServer_util_time_currentTime;
	_timeToComplete pushBack 0;
	_endTime = [_currentTime,_timeToComplete] call ExileLifeServer_util_time_addTimeEXTDB;
	_params = [_jobClassname,0,_endTime,_position,_jobExtras];
	_pid = _playerObject getVariable ["ExileLifePID",-1];
	format["updatePlayerJobsCurrent:%1:%2",_params,_pid] call ExileServer_system_database_query_fireAndForget;
	if (isNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredMembers")) then
	{
		_drivers = [];
		if !(isNull _vehicle) then {
				_drivers =_vehicle getVariable ["ExileLifePermittedDrivers",[]];
		};
		_members = missionNamespace getVariable format["ExileLifeJobMembers:%1",_jobClassname];
		{
			_pid = _x;
			_recipientSessionID = _pid call ExileLifeServer_system_session_getIDfromDBID;
			_pObj = _recipientSessionID call ExileServer_system_session_getPlayerObject;
			if !(isNull _pObj) then{
				if !(isNull _vehicle) then {
						_pObj setVariable ["ExileLifeJobVehicle",netId _vehicle,true];
						_drivers pushBackUnique (netID _pObj);
				};
				if (_recipientSessionID != _sessionID) then
				{
					_pObj setVariable ["ExileLifeJobMultiJob",_jobClassname,true];
					[_recipientSessionID,_jobClassname] call ExileLifeServer_system_jobs_process_queue_add;
					_pObj setVariable ["ExileLifeJobs:Current",[_jobClassname,0,str(_timeToEnd),_position,_jobExtras]];
					if (_recipientSessionID call ExileServer_system_session_isRegisteredId)then{
						[_recipientSessionID,"addJobTask",[_jobClassname,0,str(_timeToEnd),_position]] call ExileServer_system_network_send_to;
					};
					_params = [_jobClassname,0,_endTime,_position,_jobExtras];
					format["updatePlayerJobsCurrent:%1:%2",_params,_pid] call ExileServer_system_database_query_fireAndForget;
				};
			};
		}forEach _members;
		if (isText(configFile >> "CfgJobs" >> _jobClassname >> "givenVehicle")) then {
			_vehicle setVariable ["ExileLifePermittedDrivers",_drivers,true];
		};
	};
	if (isText(configFile >> "CfgJobs" >> _jobClassname >> "Progression" >> "Step0" >> "notifyMsg" ))  then {
		if !(["Step0",_jobClassname] call ExileLifeServer_system_jobs_util_notify_gang) then {
			"StartJobRequest: Error sending job intel to Gangs" call ExileLifeServer_util_log;
		};
	};
	format["%1 started job %2 at %3",name _playerObject,_jobClassname,_position] call ExileLifeServer_util_log;
}
catch
{
	_jobClassname call ExileLifeServer_system_jobs_board_addJob;
	if(_msg) then{
		[_sessionID,"toastRequest",["ErrorTitleAndText",["Denied",format["%1",_exception]]]] call ExileServer_system_network_send_to;
	}else{
		[_sessionID,"toastRequest",["ErrorTitleAndText",["Denied","Start Job Request Error: Alert an Admin to this Error!"]]] call ExileServer_system_network_send_to;
		format["exilelifeserver_system_jobs_process_network_startJobRequest: %1",_exception] call ExileLifeServer_util_log;
	};
};
true
