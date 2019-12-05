/**
                    * ExilelifeServer_system_delayed_initialize
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

                    private["_tasks","_id","_function","_parameters","_persistent","_length"];
scriptName 'ExileLifeServer Delayed Tasks Thread';
[] spawn 
{
	waitUntil { (time > 0) && PublicServerIsLoaded };
	while {true} do 
	{
		_tasks = [];
		if !(_tasks isEqualTo []) then 
		{
			{
				_id = _x select 0;
				_function = _x select 1;
				_parameters = _x select 2;
				_persistent = _x select 3;
				_length = _x select 4;
				[_id, _parameters] call (missionNamespace getVariable [_function, {}]);
				if (_persistent) then 
				{
					["adjustDelayedTaskEnd", [_id, parseSimpleArray("extDB2" callExtension format["9:DATEADD:%1:%2", call ExileServer_util_time_currentTime, _length])]] call ExileServer_system_database_query_fireAndForget;
				}
				else
				{
					["removeDelayedTask",[_id]] call ExileServer_system_database_query_fireAndForget;
				};
				false
			}
			count _tasks;
		};
		uiSleep 1;
	};
};
	