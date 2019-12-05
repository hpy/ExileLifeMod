/**
                    * ExilelifeServer_system_thread_executethenremoveTask
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

                    private["_threadID","_threadIndex","_thread"];
	_threadID = _this select 0;
	_threadIndex = [ExileSystemSpawnThread, _threadID] call ExileClient_util_find;
	if (_threadIndex != -1) then
	{	
		_thread = (ExileSystemSpawnThread select _threadIndex);
		(_thread select 3) call (_thread select 2);
	};
	[_threadID] call ExileServer_system_thread_removeTask;
