/**
                    * ExileServer_object_player_event_onMpKilled
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

                    private["_victim","_killer","_instigator","_forceRespawn","_victimPID","_reviveStatus","_uberJobList","_uberJobType","_currentJob","_jobClassname","_victimSessionID","_result","_bloodType"];
_victim = _this select 0;
_killer = _this select 1;
_instigator = _this select 2;
_forceRespawn = false;
if (!isServer || hasInterface || isNull _victim) exitWith {};
_victimPID = _victim getVariable ["ExileDatabaseId",-1];
_victim setVariable ["ExileDiedAt", time];
if !(isPlayer _victim) exitWith {};
_victim setVariable ["ExileIsDead", true];
_reviveStatus = _victim getVariable ['ExileLifeClientReviveState', 0];
switch (_reviveStatus) do {
	case 3: {
	   diag_log "VICTIM DEATH TIMED OUT - NO PUNISHMENT!";
		_uberJobList = _victim getVariable ['ExileLifeClientUberJobsOffered',[]];
 	   {
 		   _uberJobType = _x select 1;
 		   if(getNumber(configFile >> "CfgJobs" >> _uberJobType >> "payUberOnDeath") != 0)then{
 			   _x call ExileLifeServer_system_jobs_uber_cancelSuccessfulUber;
 		   }else{
 			   _x call ExileLifeServer_system_jobs_uber_cancelFailedUber;
 		   };
 	   }forEach _uberJobList;
	};
	case 5: {
	   diag_log "VICTIM WOULD RATHER DIE THAN WAIT FOR A REVIVE!";
	   _uberJobList = _victim getVariable ['ExileLifeClientUberJobsOffered',[]];
	   {
		   _uberJobType = _x select 1;
		   if(getNumber(configFile >> "CfgJobs" >> _uberJobType >> "payUberOnSuicide") != 0)then{
			   _x call ExileLifeServer_system_jobs_uber_cancelSuccessfulUber;
		   }else{
			   _x call ExileLifeServer_system_jobs_uber_cancelFailedUber;
		   };
	   }forEach _uberJobList;
	};
	case 4: {
		diag_log "VICTIM WAS SMOTHERED!";
		_uberJobList = _victim getVariable ['ExileLifeClientUberJobsOffered',[]];
 	   {
 		   _uberJobType = _x select 1;
 		   if(getNumber(configFile >> "CfgJobs" >> _uberJobType >> "payUberOnSmother") != 0)then{
 			   _x call ExileLifeServer_system_jobs_uber_cancelSuccessfulUber;
 		   }else{
 			   _x call ExileLifeServer_system_jobs_uber_cancelFailedUber;
 		   };
 	   }forEach _uberJobList;
		if(!isNull (_victim getVariable ['ExileLifeClientReviveMedic', objNull]))then{
			_killer = _victim getVariable ['ExileLifeClientReviveMedic', objNull];
		};
	};
	default {
		_forceRespawn = true;
	};
};
_currentJob = _victim getVariable ["ExileLifeJobs:Current",[]];
if !(_currentJob isEqualTo []) then
{
	_jobClassname = _currentJob select 0;
	if (isNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredMembers")) then {
		if(count (missionNamespace getVariable format["ExileLifeJobMembers:%1",_jobClassname]) > 1) then {
			[_victimSessionID,[netID _victim]] call ExileLifeServer_system_jobs_process_network_overrideJobRequest;
		}else{
			[_victimSessionID] call ExileLifeServer_system_jobs_process_network_failJobRequest;
		};
	}else{
		[_victimSessionID] call ExileLifeServer_system_jobs_process_network_failJobRequest;
	};
};
if (_victim getVariable ["ExileLifeTools_AlreadyReceived", false]) then
{
	_victim setVariable ["ExileLifeTools_Logged_In",nil,true];
	_victim setVariable ["ExileLifeTools_Currently_Locked",nil];
	_victim setVariable ["ExileLifeTools_AlreadyReceived",nil];
	_victim setVariable ["ExileLifeTools_FunctionNames",nil];
	(owner _victim) publicVariableClient "ExileLifeServer_admintools_system_security_removeCode";
	[] remoteExec ["ExileLifeServer_admintools_system_security_removeCode",owner _victim];
};
if ((vehicle _victim) isEqualTo _victim) then
{
	if !(underwater _victim) then
	{
		if !(_victim call ExileClient_util_world_isInTraderZone) then
		{
			_victim call ExileServer_object_flies_spawn;
		};
	};
};
if !(_victim call ExileLifeServer_util_messaging_removeFromMessages) then {
	diag_log "Error Removing player from messages!";
};
_result = [_victim,_killer,_instigator] call ExileLifeServer_object_player_death_event_onKilled;
format["deletePlayer:%1", _victimPID] call ExileServer_system_database_query_fireAndForget;
format["deletePlayerInfo:%1", _victimPID] call ExileServer_system_database_query_fireAndForget;
_bloodType = selectRandomWeighted ExileLifePlayerBloodTypes;
format["setBloodType:%1:%2", _bloodType,_victimPID] call ExileServer_system_database_query_fireAndForget;
_victim setVariable ['ExileLifeClientIncapacitated', false,true];
_victim setVariable ['ExileLifeClientReviveState', 0, true];
_victim setVariable ['ExileLifeClientReviveMedic',objNull,true];
_result
