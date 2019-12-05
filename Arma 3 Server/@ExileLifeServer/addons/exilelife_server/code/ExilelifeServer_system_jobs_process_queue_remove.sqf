/**
                    * ExilelifeServer_system_jobs_process_queue_remove
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

                    private["_sessionID","_jobClassname","_playerObject","_playerDBID"];
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
	format["jobsRemoveFromQueue:%1:%2",_playerDBID,_jobClassname] call ExileServer_system_database_query_fireAndForget;
	format["Remove Job %1 for %2 from queue",_jobClassname,name _playerObject] call ExileLifeServer_util_debugLog;
}
catch
{
	format["exilelifeserver_system_jobs_process_queue_remove: %1",_exception] call ExileLifeServer_util_log;
};
