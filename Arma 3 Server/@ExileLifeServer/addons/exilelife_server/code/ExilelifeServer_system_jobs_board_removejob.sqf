/**
                    * ExilelifeServer_system_jobs_board_removejob
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

                    private["_jobClassName","_jobDBID","_index"];
_jobClassName = _this select 0;
_jobDBID = _this select 1;
try
{
	_index = -1;
	{
		if (_x select 0 isEqualTo _jobClassName) then
		{
            if (_x select 1 isEqualTo _jobDBID) then
            {
            	_index = _forEachIndex;
            };
		};
	}
	forEach ExileLifeJobBoard;
	if (_index isEqualTo -1) then
	{
		throw format["Could not find %1 in Job board array",_jobClassName];
	};
	ExileLifeJobBoard deleteAt _index;
	format["jobsRemoveFromQueue:%1:%2",_jobDBID,_jobClassName] call ExileServer_system_database_query_fireAndForget;
	["updateJobBoard",[ExileLifeJobBoard]] call ExileServer_system_network_send_broadcast;
}
catch
{
	_exception call ExileLifeServer_util_log;
};
true
