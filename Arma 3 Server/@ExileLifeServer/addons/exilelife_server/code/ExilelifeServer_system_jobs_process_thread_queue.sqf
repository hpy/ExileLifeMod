/**
                    * ExilelifeServer_system_jobs_process_thread_queue
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

                    private["_failedJobs","_jobID","_playerUID","_jobBoard","_jobName","_sessionID","_jobs","_playerObject","_playerDBID","_filePath","_code","_result"];
_failedJobs = "processJobs" call ExileServer_system_database_query_selectFull;
if (!(count _failedJobs == 0) && (!isNil "_failedJobs")) then
{
	{
		_jobID = _x select 0;
		_playerUID = _x select 1;
		_jobBoard = _x select 2;
		_jobName = _x select 3;
		if !(_playerUID isEqualTo "0") then
		{
			try
			{
				_sessionID = _playerUID call ExileLifeServer_system_session_getIDfromUID;
				if (_sessionID isEqualTo "") then
				{
					_jobs = format["getPlayerJobs:%1",_jobID] call ExileServer_system_database_query_selectSingle;
					if (isNil "_jobs" || _jobs isEqualTo []) then
					{
						throw format["Can't find any jobs for player %1",_playerUID];
					};
					(_jobs select 2) pushBack _jobName;
					format["Queue firing for db player: Jobs: %1, Failed job: %2, playerUID: %3", _jobs, _jobName, _playerUID] call ExileLifeServer_util_debugLog;
					format["updatePlayerJobs:[]:%1:%2:%3",_jobs select 1,_jobs select 2,_jobID] call ExileServer_system_database_query_fireAndForget;
					format["jobsRemoveFromQueue:%1:%2",_jobID,_jobName] call ExileServer_system_database_query_fireAndForget;
				}
				else
				{
					if !(_sessionID isEqualTo "") then
					{
						_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
						if (isNull _playerObject) then
						{
							throw "Player is Null";
						};
						_playerDBID = _playerObject getVariable ["ExileLifePID",-1];
						if (_playerDBID isEqualTo -1) then
						{
							throw format["Player %1 doesn't have a DB ID",name _playerObject];
						};
						_jobs = _playerObject getVariable ["ExileLifeJobs:Current",[]];
						if (_jobs isEqualTo []) then
						{
							throw format["Player %1 (%2) does have any current jobs!",name _playerObject, _playerUID];
						};
						if !((_jobs select 0) isEqualTo _jobName) then
						{
							throw format["Player %1 (%2) current job doesn't match failed job!",name _playerObject, _playerUID];
						};
						_playerObject setVariable ["ExileLifeJobs:Current",[]];
						_failedJobs = _playerObject getVariable ["ExileLifeJobs:Failed",[]];
						_failedJobs pushBack _jobName;
						_playerObject setVariable ["ExileLifeJobs:Failed",_failedJobs];
						format["updatePlayerJobs:[]:%1:%2:%3",_playerObject getVariable ["ExileLifeJobs:Completed","SOMETHING FUCKED UP"],_failedJobs,_jobID] call ExileServer_system_database_query_fireAndForget;
						_filePath = getText (configFile >> "CfgJobs" >> _jobName >> "path");
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
						[_sessionID,"failJobTask",[_jobName]] call ExileServer_system_network_send_to;
						format["jobsRemoveFromQueue:%1:%2",_playerDBID,_jobName] call ExileServer_system_database_query_fireAndForget;
						format["exilelifeserver_system_jobs_process_thread_queue: %1 failed job (%2) due to time out",name _playerObject, _jobName] call ExileLifeServer_util_log;
					};
				};
			}
			catch
			{
				format["exilelifeserver_system_jobs_process_thread_queue: %1",_exception] call ExileLifeServer_util_log;
			};
		}
		else
		{
			[_jobName,_jobID] call ExileLifeServer_system_jobs_board_removeJob;
		};
	}
	forEach _failedJobs;
};
true
