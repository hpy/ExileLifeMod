/**
                    * ExilelifeServer_system_jobs_util_notify_player
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

                    private["_type","_package","_sessionID","_jobClassname","_text","_title"];
_type = _this select 0;
_package = _this select 1;
_sessionID = _package select 0;
_jobClassname = _package select 1;
switch (_type) do
{
	case "JOB ADDED":
	{
		_text = getText (configFile >> "CfgJobs" >> _jobClassname >> "shortDescription");
		[_sessionID,"toastRequest",["JobAdded",[_text]]] call ExileServer_system_network_send_to;
	};
	case "JOB FAILED":
	{
		_text = getText (configFile >> "CfgJobs" >> _jobClassname >> "failedText");
		[_sessionID,"toastRequest",["JobFailed",[_text]]] call ExileServer_system_network_send_to;
	};
	case "JOB COMPLETED":
	{
		_text = getText (configFile >> "CfgJobs" >> _jobClassname >> "completedText");
		[_sessionID,"toastRequest",["JobCompleted",[_text]]] call ExileServer_system_network_send_to;
	};
	case "NOTIFICATION":
	{
		_title = _package param [2,""];
		_text = _package param [3,""];
		[_sessionID,"toastRequest",["InfoTitleAndText",[_title,_text]]] call ExileServer_system_network_send_to;
	};
	default {"Wrong notification called" call ExileLifeServer_util_debugLog;};
};
true