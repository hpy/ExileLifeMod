/**
                    * ExilelifeServer_system_prisonRecords_network_payFine
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

                    private["_sessionID","_parameter","_infractionID","_guardGang"];
_sessionID = _this select 0;
_parameter = _this select 1;
_infractionID = _parameter select 0;
diag_log "ExileLifeServer_system_prisonRecords_network_payFine TODO";
_infractionID = '1';
format["payPrisonerFine:%1",_infractionID] call ExileServer_system_database_query_fireAndForget;
_guardGang setVariable ["ExileMutex",false];
