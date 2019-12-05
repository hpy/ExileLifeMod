/**
                    * ExilelifeServer_system_delayed_addTask
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

                    private["_endTime","_function","_parameters","_persistent","_id","_recalculatedTime"];
_endTime = _this select 0;
_function = _this select 1;
_parameters = param [2, []];
_persistent = param [3, false];
_id = -1;
try 
{
	if !(count(_endTime) isEqualTo 3) then 
	{
		throw format["EndTime count must be 3! Params: %1", _this];
	};
	_endTime pushBack 0;
	if (missionNamespace getVariable [_function, ""] isEqualTo "") then 
	{
		throw format["Function call does not exist! Params: %1", _this];
	};
	_recalculatedTime = parseSimpleArray("extDB3" callExtension format["9:DATEADD:%1:%2", call ExileServer_util_time_currentTime, _endTime]);
	_id = ["addDelayedTask", [_function, _parameters, _recalculatedTime, _endTime]] call ExileServer_system_database_query_insertSingle;
}
catch 
{
	#LOG_SERVER_FNC(_exception);
};
_id