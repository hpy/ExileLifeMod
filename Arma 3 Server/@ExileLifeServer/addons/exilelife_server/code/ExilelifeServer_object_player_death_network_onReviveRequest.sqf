/**
                    * ExilelifeServer_object_player_death_network_onReviveRequest
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

                    private["_sessionID","_parameters","_targetNetID","_player","_victim","_cancelJob","_currentJobs","_jobClassname","_jobExtras","_targetVictim","_uberJob","_jobOfferedByPID","_offeredByPlayerSessionID","_targetPlayer","_jobRequest","_playerPID","_oldRespect","_newVictimRespect","_newRespect"];
_sessionID = _this select 0;
_parameters = _this select 1;
_targetNetID = _parameters select 0;
try
{
    _player = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _player) then
    {
        throw "player doesnt exist!";
    };
    if !(alive _player) then
    {
        throw "player is dead!";
    };
    if (_player getVariable ['ExileLifeClientIncapacitated', false]) then
    {
        throw "player is incapacitated!";
    };
    if !(_player getVariable ['ExileLifeClientUberMedic',false]) then
    {
        throw "player is not a medic!";
    };
    _victim = objectFromNetId _targetNetID;
    if (isNull _victim) then
    {
        throw "victim doesnt exist!";
    };
    if !(alive _victim) then
    {
        throw "victim is already dead!";
    };
    if !(_victim getVariable ['ExileLifeClientIncapacitated', false]) then
    {
        throw "victim is not incapacitated!";
    };
    if (_player == _victim) then
    {
        throw format["HACK ATTEMPT BY: %1 UID: %2!!! You cannot attempt to revive yourself!",_player,getPlayerUID _player];
    };
    _cancelJob = false;
    _currentJobs = _player getVariable ["ExileLifeJobs:Current",[]];
	if (_currentJobs isEqualTo []) then{
        _cancelJob = true;
	}else{
        _jobClassname = _currentJobs select 0;
        _jobExtras = _currentJobs select 4;
        _targetVictim = objNull;
        switch (_jobClassname) do {
            case "requestMedic": {};
            case "requestGangMedic": {};
            default {_cancelJob = true;};
        };
        if !(_cancelJob)then{
            _uberJob = _jobExtras select 0;
            _jobOfferedByPID = (_uberJob select 7) select 0;
            _offeredByPlayerSessionID = _jobOfferedByPID call ExileLifeServer_system_session_getIDfromDBID;
            _targetPlayer = _offeredByPlayerSessionID call ExileServer_system_session_getPlayerObject;
            if (_victim !=  _targetPlayer) then{
                _cancelJob = true;
            }else{
                [_sessionID] call ExileLifeServer_system_jobs_process_network_completeJobRequest;
            };
        };
    };
    if(_cancelJob)then{
        _jobRequest = [_victim,1,"requestMedic"] call ExileLifeServer_system_jobs_uber_findJobOffer;
        if (_jobRequest isEqualTo [])then{
            _jobRequest = [_victim,1,"requestGangMedic"] call ExileLifeServer_system_jobs_uber_findJobOffer;
        };
        if !(_jobRequest isEqualTo [])then{
            _jobRequest call ExileLifeServer_system_jobs_uber_cancelUber;
        };
        _playerPID = _player getVariable ["ExileDatabaseId",-1];
    	_oldRespect = _player getVariable ["ExileScore", _newVictimRespect];
        _newRespect = _oldRespect + getNumber(missionConfigFile >> "CfgExileLifeRewards" >> "goodSamaritanRevive");
    	_player setVariable ["ExileScore", _newRespect];
    	format["setAccountScore:%1:%2", _newRespect, _playerPID] call ExileServer_system_database_query_fireAndForget;
    	_player call ExileServer_object_player_sendStatsUpdate;
    };
    _victim setVariable ['ExileLifeClientIncapacitated', false];
    if(_victim getVariable ['ExileLifeCementShoes',false])then{
        {
          detach _x;
        } forEach attachedObjects _victim;
        _victim setVariable ['ExileLifeCementShoes',false,true];
    };
    ["onReviveResponse",[_targetNetID]] call ExileLifeServer_system_network_send_broadcastJIP;
}
catch
{
    _victim setVariable ['ExileLifeClientReviveState', 1, true];
    _victim setVariable ['ExileLifeClientReviveMedic',objNull];
    _exception call ExileServer_util_log;
};
