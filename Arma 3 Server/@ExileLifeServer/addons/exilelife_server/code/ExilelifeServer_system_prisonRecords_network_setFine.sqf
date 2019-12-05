/**
                    * ExilelifeServer_system_prisonRecords_network_setFine
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

                    private["_sessionID","_parameter","_pid","_infractionID","_amount","_time","_currentTime","_endTime","_timeToCompleteEXT","_timeToEnd","_guardGang"];
_sessionID = _this select 0;
_parameter = _this select 1;
_pid = _parameter select 0;
_infractionID = _parameter select 1;
_amount = _parameter select 2;
diag_log "ExileLifeServer_system_prisonRecords_network_setFine TODO TODO TODO";
_pid = '1';
_infractionID = '1';
_amount = '12345';
_time = [1,0,0];
_currentTime = call ExileServer_util_time_currentTime;
_time pushBack 0;
_endTime = [_currentTime,_time] call ExileLifeServer_util_time_addTimeEXTDB;
_timeToCompleteEXT = _time call ExileLifeServer_util_time_toEXTDB;
_timeToEnd = floor((_timeToCompleteEXT call ExileServer_util_time_toMinutes) * 60 + parseNumber("extDB3" callExtension "9:UPTIME:SECONDS"));
diag_log format ["%1",_timeToEnd];
format["createPrisonerFine:%1:%2:%3:%4",_pid,_infractionID,_amount,_timeToEnd] call ExileServer_system_database_query_fireAndForget;
_guardGang setVariable ["ExileMutex",false];
