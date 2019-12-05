/**
                    * ExilelifeServer_system_jobs_board_addJob
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

                    private["_jobClassname","_time","_requiredPlayers","_maxJobs","_onJobBoard","_jobBoard","_currentTime","_endTime","_timeToCompleteEXT","_timeToEnd","_index"];
_jobClassname = _this;
try
{
	if !(isClass(configFile >> "CfgJobs" >> _jobClassname)) then
	{
		throw format["Job %1 isn't a valid job",_jobClassname];
	};
	_time = getArray(configFile >> "CfgJobs" >> _jobClassname >> "Time" >> "activeTime");
	if (_time isEqualTo []) then
	{
		throw format["Job %1 does not have an active time, it has been removed from job board.",_jobClassname];
	};
	_requiredPlayers = getNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredMembers");
	if (_requiredPlayers > 0) then {
		_maxJobs = 1;
	}
	else
	{
		_maxJobs = getNumber(configFile >> "CfgJobs" >> _jobClassname >> "Time" >> "maxAllowed");
	};
	_onJobBoard = {(_x select 0) isEqualTo _jobClassname} count ExileLifeJobBoard;
	if (_onJobBoard > 0) then
	{
		if (_onJobBoard >= _maxJobs) then
		{
			throw format["Job %1 has reached its maximum permitted jobs board limit.",_jobClassname];
		};
	};
	_jobBoard = getText(configFile >>"CfgJobs" >> _jobClassname >> "JobBoard");
	if(_jobBoard=="") then
	{
		_jobBoard = "generic"; 
	};
	_currentTime = call ExileServer_util_time_currentTime;
	_time pushBack 0;
	_endTime = [_currentTime,_time] call ExileLifeServer_util_time_addTimeEXTDB;
	_timeToCompleteEXT = _time call ExileLifeServer_util_time_toEXTDB;
	_timeToEnd = floor((_timeToCompleteEXT call ExileServer_util_time_toMinutes) * 60 + parseNumber("extDB3" callExtension "9:UPTIME:SECONDS"));
	ExileLifeJobBoard pushbackUnique [_jobClassname,ExileLifeJobBoardIniterationNumber,str(_timeToEnd),_jobBoard,0];
	format["jobsAddToQueue:%1:%2:%3:%4:%5",ExileLifeJobBoardIniterationNumber,0,_jobClassname,_jobBoard,_endTime] call ExileServer_system_database_query_fireAndForget;
	ExileLifeJobBoardIniterationNumber = ExileLifeJobBoardIniterationNumber - 1;
	["updateJobBoard",[ExileLifeJobBoard]] call ExileServer_system_network_send_broadcast;
	format["%1 added to board",_jobClassname] call ExileLifeServer_util_debugLog;
}
catch
{
	_exception call ExileLifeServer_util_log;
	_index = ExileLifeJob_AvailableJobs find _jobClassname;
	if !(_index isEqualTo -1) then
	{
		ExileLifeJob_AvailableJobs deleteAt _index;
	};
};
true
