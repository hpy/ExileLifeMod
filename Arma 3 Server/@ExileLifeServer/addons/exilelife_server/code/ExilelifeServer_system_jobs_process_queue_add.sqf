/**
                    * ExilelifeServer_system_jobs_process_queue_add
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

                    private["_sessionID","_jobClassname","_playerObject","_playerDBID","_jobBoard","_jobTime","_jobTimeLeft","_jobEndTime","_currentTime","_endTime"];
_sessionID = _this select 0;
_jobClassname = _this select 1;
try
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
	_jobBoard = getText(configFile >>"CfgJobs" >> _jobClassname >> "JobBoard");
	if(_jobBoard=="") then
	{
		_jobBoard = "generic"; 
	};
	_jobTime = getArray(configFile >> "CfgJobs" >> _jobClassname >> "Time" >> "timeToComplete");
	if (getNumber(configFile >>"CfgJobs" >> _jobClassname >> "jobType") == 1)then{
		if(_jobTime isEqualTo [])then{
			if(ExileLifeTimeSynced)then{
				_jobTimeLeft = _jobEndTime - servertime;
			}else{
				_jobTimeLeft = _jobEndTime - time;
			};
			_jobTime = [_jobTimeLeft,false] call ExileLifeServer_util_time_secondsToArray;
		};
	};
	if (_jobTime isEqualTo [0,0,0]) then
	{
		_jobTime = _playerObject getVariable ["ExileLifeJobTime",[]];
	};
	_jobTime pushBack 0;
	_currentTime = call ExileServer_util_time_currentTime;
	_endTime = [_currentTime,_jobTime] call ExileLifeServer_util_time_addTimeEXTDB;
	format["jobsAddToQueue:%1:%2:%3:%4:%5",_playerDBID,getPlayerUID _playerObject,_jobClassname,_jobBoard,_endTime] call ExileServer_system_database_query_fireAndForget;
	format["Added Job %1 for %2 to queue",_jobClassname,name _playerObject] call ExileLifeServer_util_debugLog;
}
catch
{
	format["exilelifeserver_system_jobs_process_queue_add: %1",_exception] call ExileLifeServer_util_log;
};
