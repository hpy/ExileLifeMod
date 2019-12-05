/**
                    * ExilelifeServer_system_jobs_process_thread_jobSelector
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

                    private["_time","_array","_weight","_conditionalJobs","_requiredGangs","_requiredMembers","_requiredPlayers","_addJob","_members","_filePath","_code","_count","_jobName","_i","_jobToRun"];
_time = time - ExileLifeJob_LastJobAddedRan;
if (_time > ExileLifeJob_MinTime || _time > ExileLifeJob_MaxTime) then
{
	if !(ExileLifeJobBoardDayNight isEqualTo ExileLifeServerSunMoonCycle) then
	{
		ExileLifeJob_AvailableJobs = [];
		ExileLifeJobBoardDayNight = ExileLifeServerSunMoonCycle;
		if (ExileLifeServerSunMoonCycle isEqualTo 1) then
		{
			_array = getArray(missionConfigFile >> "CfgJobs" >> "availableDayJobs");
		}
		else
		{
			_array = getArray(missionConfigFile >> "CfgJobs" >> "availableNightJobs");
		};
		{
			if (isClass(configFile >> "CfgJobs" >> _x)) then
			{
				_weight = getNumber(configFile >> "CfgJobs" >> _x >> "Time" >> "weight");
				if(_weight< 0.1) then {_weight = 1;};
				ExileLifeJob_AvailableJobs pushbackUnique [_x,_weight];
			}
			else
			{
				format["ERROR! Job %1 does not exist in CfgJobs!",_x] call ExileLifeServer_util_log;
			};
		}
		forEach _array;
	};
	_conditionalJobs = getArray(missionConfigFile >> "CfgJobs" >> "availableConditionalJobs");
		{
			if (isClass(configFile >> "CfgJobs" >> _x)) then
			{
				_requiredGangs = getArray(configFile >> "CfgJobs" >> _x >> "RequiredGangs");
				if((count _requiredGangs) == 0) then {
					_requiredGangs = ["Mafia","Cartel","Yakuza","Sydnicate"];
				};
				_requiredMembers = getNumber(configFile >> "CfgJobs" >> _x >> "RequiredMembers");
				_requiredPlayers = getNumber(configFile >> "CfgJobs" >> _x >> "RequiredPlayers");
				_weight = getNumber(configFile >> "CfgJobs" >> _x >> "Time" >> "weight");
				_addJob = True;
				_members = 0;
				{
					_members = _members + (_x call ExileLifeClient_util_gang_countGang);
				}forEach _requiredGangs;
				if(_requiredMembers > _members) then {
					_addJob = False;
				};
				if(_addJob && _requiredPlayers > (count allPlayers)) then {
					_addJob = False;
				};
				_filePath = getText (configFile >> "CfgJobs" >> _x >> "path");
				if !(_filePath isEqualTo "") then
				{
					_code = missionNamespace getVariable [format["ExileLifeServer_system_jobs_scenes_%1_preCondition",_filePath],""];
					if !(_code isEqualTo "") then
					{
						if !(call _code) then
						{
							_addJob = false;
						};
					};
				};
				if(_addJob) then {
					ExileLifeJob_AvailableJobs pushbackUnique [_x,_weight];
				};
			}
			else
			{
				format["ERROR! Job %1 does not exist in CfgJobs!",_x] call ExileLifeServer_util_log;
			};
		} forEach _conditionalJobs;
	_count = count(ExileLifeJobBoard);
	if (_count < ExileLifeJob_MaxJobs && _count < ExileLifeJob_MinJobs) then
	{
		_array = [];
		{
			_jobName = _x select 0;
			_weight = _x select 1;
			for "_i" from 1 to _weight do
			{
				_array pushBack _jobName;
			};
		}
		forEach ExileLifeJob_AvailableJobs;
		_jobToRun = selectRandom _array;
		if !(_jobToRun isEqualTo ExileLifeJob_LastRanJob) then
		{
			_jobToRun call ExileLifeServer_system_jobs_board_addJob;
			ExileLifeJob_LastRanJob = _jobToRun;
		};
	};
	ExileLifeJob_LastJobAddedRan = time;
};
true
