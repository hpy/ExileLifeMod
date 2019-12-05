/**
                    * ExilelifeServer_object_player_guard_network_jailPlayerRequest
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

                    private["_guardSessionID","_parameters","_targetNetID","_mineAmountRequired","_timeToComplete","_guard","_prisoner","_prisonerDBID","_position","_spawnPosition","_timeToCompleteEXT","_timeToEnd","_currentTime","_endTime","_prisonerSessionID","_storedInfo","_msg","_longMSG","_prisonerID"];
_guardSessionID = _this select 0;
_parameters = _this select 1;
_targetNetID = _parameters select 0;
_mineAmountRequired = _parameters select 1;
_timeToComplete = _parameters select 2; 
try
{
	_guard = _guardSessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _guard) then
	{
		throw "Prison System: You dont exist!";
	};
	if !(alive _guard) then
	{
		throw "Prison System: Your dead!";
	};
	if !(_guard getVariable ["ExileLifeClient:Guard",false]) then
	{
		throw "Prison System: You are not a guard!";
	};
	_prisoner = objectFromNetId _targetNetID;
	if (isNull _prisoner) then
	{
		throw "Prison System: The Prisoner doesnt exist!";
	};
	if !(alive _prisoner) then
	{
		throw "Prison System: The Prisoner is dead!";
	};
	if (_prisoner getVariable ['ExileLifeClientIncapacitated',false]) then
	{
		throw "Prison System: The Prisoner is dead!";
	};
	_prisonerDBID = _prisoner getVariable ["ExileLifePID",-1];
	if (_prisonerDBID isEqualTo -1) then
	{
		throw format["Prison System: Player %1 doesn't have a DB ID",name _prisoner];
	};
	_position = getArray(configFile >> "CfgJobs" >> "prison" >> "Progression" >> "Step0" >> "destinationPOS");
	 _spawnPosition = _position findEmptyPosition [5,20];
    if (_spawnPosition isEqualTo []) exitWith
    {
        throw "Prison System: Error finding safe positon to spawn player!";
    };
	_timeToCompleteEXT = _timeToComplete call ExileLifeServer_util_time_toEXTDB;
	_timeToEnd = floor((_timeToCompleteEXT call ExileServer_util_time_toMinutes) * 60 + parseNumber("extDB3" callExtension "9:UPTIME:SECONDS"));
	_currentTime = call ExileServer_util_time_currentTime;
	_timeToComplete pushBack 0;
	_endTime = [_currentTime,_timeToComplete] call ExileLifeServer_util_time_addTimeEXTDB;
	if (typeName _endTime == "STRING") then
	{
		[_guardSessionID, "baguetteRequest", [["Labour Camp","The Prison I.T System is Currently Malfunctioning. Please Contact A Supervisor!"]]] call ExileServer_system_network_send_to;
		throw "- Prison - EXTDB TIME ERROR!";
	};
	_prisonerSessionID = (getplayerUID _prisoner) call ExileLifeServer_system_session_getIDfromUID;
	if(count (_prisoner getVariable ["ExileLifeJobs:Current",[]]) > 0) then
	{
		[_prisonerSessionID,[_targetNetID,1]] call ExileLifeServer_system_jobs_process_network_overrideJobRequest;
	};
	_prisoner setVariable ["ExileLifePrisoner",true,true];
	_prisoner setVariable ["ExileLifePrisonerMineAmount",[_mineAmountRequired,0]]; 
	_prisoner setVariable ["ExileLifeJobTime",_timeToComplete];
	[_prisonerSessionID,"prison"] call ExileLifeServer_system_jobs_process_queue_add;
	_storedInfo = ["ExileLifeServer_system_prison_prisonerRejoin",_mineAmountRequired,0];
	_prisoner setVariable ["ExileLifeJobs:Current",["prison",0,str(_timeToEnd),_position,_storedInfo]];
	format["updatePlayerJobsCurrent:%1:%2",["prison",0,_endTime,_position,_storedInfo],_prisoner getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
	format["%1 has been sent to prison until %2",name _prisoner,str _endTime] call ExileLifeServer_util_log;
	_prisoner setPosATL _spawnPosition;
	_prisoner call ExileClient_util_playerCargo_clear;
	[_prisoner,"Exile_Uniform_BambiOverall"] call ExileClient_util_playerCargo_add;
	[_prisoner,"ExileLife_Melee_PickAxe"] call ExileClient_util_playerCargo_add; 
	_prisoner call ExileServer_object_player_database_update;
	_msg = format ["You have been sentenced to the labour camp for %1hrs, %2min! If you mine %3 Ore, you will be released early!",_timeToComplete select 1, _timeToComplete select 2,_mineAmountRequired];
	[_prisonerSessionID, "baguetteRequest", [["Labour Camp",_msg]]] call ExileServer_system_network_send_to;
	_longMSG = format["You have been sentenced to hard labour! <br/><br/> Your sentence shall be completed when you either mine %1 ore, or wait until your sentence time has passed.",_mineAmountRequired];;
	[_prisonerSessionID,"addManualJobTask",["prison",0,str(_timeToEnd),_position,"PRISON","Hard Labour Camp",_longMSG,true]] call ExileServer_system_network_send_to;
	_prisonerID = _prisoner getVariable ["ExileLifePrisonerID",""];
	ExileLifePrisonArray pushBackUnique _prisonerID;
}
catch
{
	_exception call ExileLifeServer_util_debugLog;
};
