/**
                    * ExilelifeServer_system_jobs_board_updateJobBoard
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

                    private["_jobClassName","_jobID","_jobBoard","_endTime","_playerUID","_playerCount","_result","_index","_jobClassname","_timeToEnd","_jobBoardt"];
_jobClassName = _this  param [0,""];
_jobID = _this  param [1,0];
_jobBoard =  _this  param [2,""];
_endTime =  _this  param [3,""];
_playerUID = _this  param [4,0];
_playerCount = _this  param [5,0];
_result = true;
try
{
    if (_jobClassName == "") then
    {
        throw false;
    };
    if (_jobID > -1) then
    {
        throw false;
    };
    if (_jobBoard == "") then
    {
        throw false;
    };
    if (_endTime == "") then
    {
        throw false;
    };
	_index = -1;
	{
		if (_x select 0 isEqualTo _jobClassName) then
		{
            if (_x select 1 isEqualTo _jobID) then
            {
            	_index = _forEachIndex;
            };
		};
	}
	forEach ExileLifeJobBoard;
	if (_index isEqualTo -1) then
	{
        format["Could not find %1 ID: %2 to update Job board array",_jobClassName,_jobID] call ExileLifeServer_util_log;
		throw false;
	};
	ExileLifeJobBoard set [_index, [_jobClassname,_jobID,str(_timeToEnd),_jobBoardt]];
	format["jobsUpdateQueue:%1:%2:%3:%4:%5",_jobID,_playerUID,_jobClassname,_jobBoard,_endTime] call ExileServer_system_database_query_fireAndForget;
	["updateJobBoard",[ExileLifeJobBoard]] call ExileServer_system_network_send_broadcast;
}
catch
{
	_result = _exception;
};
_result
