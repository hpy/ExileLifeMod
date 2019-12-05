/**
                    * ExilelifeServer_system_jobs_uber_network_reviveJobOffer
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

                    private["_sessionID","_parameters","_reviveType","_reviveTimeLeft","_player","_playerName","_playerGang","_jobType","_jobID","_jobTitle","_jobDescriptionText","_jobRewardArray","_jobObjectiveText","_jobEndTime","_jobOfferedBy","_uberJobExtras","_jobAcceptedBy","_jobPosition","_uberJobInfo","_send","_target","_xGang","_targetUberJobs","_result"];
_sessionID = _this select 0;
_parameters = _this select 1;
_reviveType = _parameters select 0;
_reviveTimeLeft = _parameters select 1;
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
    if !(_player getVariable ['ExileLifeClientIncapacitated',false])then{
        throw "player is not ready for a revive";
    };
    _playerName = [_player] call ExileLifeClient_util_player_name;
    _playerGang = _player getVariable ['ExileLifeClientGang',""];
    switch (_reviveType) do {
        case (0): {
            _jobType = "requestMedic";
        };
        case (1): {
            _jobType = "requestGangMedic";
            if(_playerGang == "" || _playerGang == "Rogue")then{
                _jobType = "requestMedic";
            };
        };
        default {throw "Invalid Revive Type Request";};
    };
    _jobID = call ExileLifeServer_util_jobs_createUberJobId;
    _jobTitle = getText(configFile >> "CfgJobs" >> _jobType >> "shortName");
    _jobDescriptionText = getText(configFile >> "CfgJobs" >> _jobType >> "shortDescription");
    _jobRewardArray = getArray(configFile >> "CfgJobs" >> _jobType >> "reward");
    _jobObjectiveText = _playerName;
    if(_reviveTimeLeft < 0)then{
        throw "Job expired!";
    };
    if(ExileLifeTimeSynced)then{
        _jobEndTime = _reviveTimeLeft + servertime;
    }else{
        _jobEndTime = _reviveTimeLeft + time;
    };
    _jobOfferedBy = [_player getVariable ["ExileLifePID",-1],_playerName];
    _uberJobExtras = [];
    _jobAcceptedBy = [];
    _jobPosition = position _player;
    _uberJobInfo = [
        _jobID, 
        _jobType, 
        _jobTitle, 
        _jobDescriptionText, 
        _jobObjectiveText, 
        _jobRewardArray, 
        _jobEndTime, 
        _jobOfferedBy, 
        _jobAcceptedBy, 
        _jobPosition, 
        _uberJobExtras 
    ];
    [_player,_uberJobInfo] call ExileLifeServer_system_jobs_uber_addJobOffer;
    _uberJobInfo call ExileLifeServer_system_jobs_uber_addJob;
    {
        _send = false;
        _target = _x call ExileServer_system_session_getPlayerObject;
        if(_target != _player)then{
            _xGang = _target getVariable['ExileLifeClientGang',""];
            if(_reviveType == 0)then{
                if  (_xGang == "Rogue" || _xGang == "Guard") then { _send = true; };
            }else{
                if  (_xGang == _playerGang) then { _send = true; };
            };
        };
        if(_send)then{
            _targetUberJobs = _target getVariable ['ExileLifeClientUberJobs',[]];
            _targetUberJobs pushBackUnique _uberJobInfo;
            _target setVariable ['ExileLifeClientUberJobs',_targetUberJobs];
            [_x,"updateUberJobs",[_uberJobInfo]] call ExileServer_system_network_send_to;
        };
    }forEach ExileLifeOnlineMedics;
}
catch
{
    _result = _exception;
};
