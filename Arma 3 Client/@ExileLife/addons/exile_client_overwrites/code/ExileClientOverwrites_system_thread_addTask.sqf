/**
                    * ExileClientOverwrites_system_thread_addTask
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

                    private["_delay","_function","_params","_persistance","_threadName","_pushBackThreadID","_threadId"];
_delay = _this select 0;
_function = _this select 1;
_params =  _this select 2;
_persistance = _this select 3;
_threadName = param [4,"System Task"];
_pushBackThreadID = param [5, false];
_threadId = ExileSystemThreadID;
if(_pushBackThreadID)then
{
	_params pushBack _threadId;
};
ExileSystemSpawnThread pushBack [_delay, time, _function,_params, _threadId, _persistance,_threadName];
ExileSystemThreadDelays pushBack _delay;
[] call ExileClient_system_thread_threadAdjust;
ExileSystemSpawnThread = [ExileSystemSpawnThread, [], {_x select 4}, "ASCEND", {true}] call BIS_fnc_sortBy;
format ["Thread (%2) with handle %1 added.", _threadId,_threadName] call ExileClient_util_log;
ExileSystemThreadID = ExileSystemThreadID + 1;
_threadId