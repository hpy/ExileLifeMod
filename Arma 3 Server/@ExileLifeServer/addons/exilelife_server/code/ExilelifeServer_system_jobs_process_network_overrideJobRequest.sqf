/**
                    * ExilelifeServer_system_jobs_process_network_overrideJobRequest
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

                    private["_sessionID","_paramaters","_targetPlayerNetID","_silentMsg","_callingPlayer","_playerObject","_currentJobs","_result","_jobClassname","_members","_jobType","_uberJob","_jobExtras","_uberJobID","_offeredByPID","_offeredByPlayerSessionID","_offeredByPlayer"];
_sessionID = _this select 0;
_paramaters = _this select 1;
_targetPlayerNetID = _paramaters param[0,""];
_silentMsg = _paramaters param[1,0];
diag_log format["ExileLifeServer_system_jobs_process_network_overrideJobRequest: %1",_this];
try
{
	_callingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _callingPlayer) then
	{
		throw "Calling Player doesnt exist";
	};
	_playerObject = objectFromNetId _targetPlayerNetID;
	if (isNull _playerObject) then
	{
		_playerObject = _callingPlayer;
	};
	_currentJobs = _playerObject getVariable ["ExileLifeJobs:Current",[]];
	if (_currentJobs isEqualTo []) then
	{
		if(_playerObject getVariable ["ExileLifeJobMultiJob",""]!= "") then {
			_result = true;
			_jobClassname = _playerObject getVariable ["ExileLifeJobMultiJob",""];
			_playerObject setVariable ["ExileLifeJobMultiJob",nil,true];
			_members = (missionNamespace getVariable format["ExileLifeJobMembers:%1",_jobClassname]);
			_members = _members - [(_playerObject getVariable ["ExileLifePID",-1])];
			missionNamespace setVariable [format["ExileLifeJobMembers:%1",_jobClassname],_members];
			throw "You have left the job queue!"
		};
		throw format["%1 tried to forfeit with no jobs!",name _playerObject];
	};
	_jobClassname = _currentJobs select 0;
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
			};
		};
		default{};
	};
	if (isNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredMembers")) then {
		_playerObject setVariable ["ExileLifeJobMultiJob",nil,true];
		_members = (missionNamespace getVariable format["ExileLifeJobMembers:%1",_jobClassname]);
		_members = _members - [(_playerObject getVariable ["ExileLifePID",-1])];
		missionNamespace setVariable [format["ExileLifeJobMembers:%1",_jobClassname],_members];
	};
	_playerObject setVariable ["ExileLifeJobReward",nil];
	_playerObject setVariable ["ExileLifeJobs:Current",[]];
	if (_sessionID call ExileServer_system_session_isRegisteredId)then{
		[_sessionID,"overrideJobTask",[_silentMsg]] call ExileServer_system_network_send_to;
	};
	[_sessionID,_jobClassname] call ExileLifeServer_system_jobs_process_queue_remove;
	format["updatePlayerJobsCurrent:%1:%2",[],_playerObject getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
}
catch
{
	format["exilelifeserver_system_jobs_process_network_overrideJobRequest: %1",_exception] call ExileLifeServer_util_log;
};
true
