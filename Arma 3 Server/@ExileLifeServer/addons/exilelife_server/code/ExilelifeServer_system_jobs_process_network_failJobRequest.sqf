/**
                    * ExilelifeServer_system_jobs_process_network_failJobRequest
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

                    private["_sessionID","_playerObject","_currentJobs","_jobClassname","_jobExtras","_jobType","_uberJob","_uberJobID","_offeredByPID","_offeredByPlayerSessionID","_offeredByPlayer","_offeredByPlayerMsg","_filePath","_code","_result","_members","_pid","_recipientSessionID","_failedJobs","_reward"];
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
		throw format["%1 tried to fail with no jobs!",name _playerObject];
	};
	_jobClassname = _currentJobs select 0;
	_jobExtras = _currentJobs select 4;
	if !(isClass (configFile >> "CfgJobs" >> _jobClassname)) then
	{
		throw format["Job %1 does not exist in config!",_jobClassname];
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
				_offeredByPlayerMsg = getText(configFile >> "CfgJobs" >> _jobClassname >> "offeredByPlayerOnFailedMsg");
				if !(_offeredByPlayerMsg isEqualTo "") then{
					[_offeredByPlayerSessionID,"toastRequest",["InfoTitleOnly",[_offeredByPlayerMsg]]] call ExileServer_system_network_send_to;
				};
			};
	    };
		default{};
	};
	_filePath = getText (configFile >> "CfgJobs" >> _jobClassname >> "path");
	if !(_filePath isEqualTo "") then
	{
		_code = missionNamespace getVariable [format["ExileLifeServer_system_jobs_scenes_%1_onFailure",_filePath],""];
		if !(_code isEqualTo "") then
		{
			_result = [_sessionID,_playerObject] call _code;
			if !(_result isEqualTo "") then
			{
				throw _result;
			};
		};
	};
	if (isNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredMembers")) then {
		_members = (missionNamespace getVariable format["ExileLifeJobMembers:%1",_jobClassname]);
		missionNamespace setVariable [format["ExileLifeJobMembers:%1",_jobClassname],nil];
		if (typeName _members == "Array") then
		{
			{
				_pid = _x;
			_recipientSessionID = _pid call ExileLifeServer_system_session_getIDfromDBID;
				if(_recipientSessionID!=_sessionID) then {
					[_recipientSessionID] call ExileLifeServer_system_jobs_process_network_failJobRequest;
				};
			}forEach _members;
		};
	};
	_playerObject setVariable ["ExileLifeJobReward",nil];
	_playerObject setVariable ["ExileLifeJobMultiJob",nil,true];
	_playerObject setVariable ["ExileLifeJobs:Current",[]];
	_failedJobs = _playerObject getVariable ["ExileLifeJobs:Failed",[]];
	_failedJobs pushBack _jobClassname;
	_playerObject setVariable ["ExileLifeJobs:Failed",_failedJobs];
	_reward = getArray(configFile >> "CfgJobs" >> _jobClassname >> "punishmentFail");
	if !(_reward isEqualTo []) then
	{
		[_sessionID, _playerObject,_reward] call ExileLifeServer_system_jobs_util_punish;
	};
	if (_sessionID call ExileServer_system_session_isRegisteredId)then{
		[_sessionID,"failJobTask",[_jobClassname]] call ExileServer_system_network_send_to;
	};
	format["updatePlayerJobs:%1:%2:%3:%4",[],_playerObject getVariable ["ExileLifeJobs:Completed",[]],_failedJobs,_playerObject getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
	[_sessionID,_jobClassname] call ExileLifeServer_system_jobs_process_queue_remove;
	format["%1 failed job %2",name _playerObject,_jobClassname] call ExileLifeServer_util_log;
}
catch
{
	format["exilelifeserver_system_jobs_process_network_failJobRequest: %1",_exception] call ExileLifeServer_util_log;
};
true
