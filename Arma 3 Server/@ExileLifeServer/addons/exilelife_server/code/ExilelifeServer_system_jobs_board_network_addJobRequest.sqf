/**
                    * ExilelifeServer_system_jobs_board_network_addJobRequest
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

                    private["_sessionID","_package","_jobClassname","_jobDBIB"];
_sessionID = _this select 0;
_package = _this select 1;
_jobClassname = _package select 0;
_jobDBIB = _package select 1;
try
{
	if !(isClass(configFile >> "CfgJobs" >> _jobClassname)) then
	{
		throw format["Job %1 does not exist!",_jobClassname];
	};
	if (_jobDBIB > -1) then
	{
		throw format["Job %1 DBID is greater than -1!",_jobClassname];
	};
	if !([_sessionID,[_jobClassname]] call ExileLifeServer_system_jobs_board_checkJob) then
	{
		throw "Job requirements not met";
	};
	[_jobClassname,_jobDBIB] call ExileLifeServer_system_jobs_board_removeJob;
	[_sessionID,[_jobClassname]] call ExileLifeServer_system_jobs_process_network_startJobRequest;
}
catch
{
	_exception call ExileLifeServer_util_log;
};
