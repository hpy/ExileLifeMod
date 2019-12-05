/**
                    * ExilelifeServer_system_jobs_process_thread_timeSync
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

                    if (serverTime < 4000 || time > 300) then
{
	ExileLifeTimeSynced = true;
	publicVariable "ExileLifeTimeSynced";
	ExileLifeTimeDifference = abs(parseNumber("extDB3" callExtension "9:UPTIME:SECONDS") - serverTime);
	publicVariable "ExileLifeTimeDifference";
	format["Adjusting time on clients by %1",ExileLifeTimeDifference] call ExileLifeServer_util_log;
};
true
