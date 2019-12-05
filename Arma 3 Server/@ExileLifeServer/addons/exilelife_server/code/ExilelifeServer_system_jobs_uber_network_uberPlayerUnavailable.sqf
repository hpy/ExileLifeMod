/**
                    * ExilelifeServer_system_jobs_uber_network_uberPlayerUnavailable
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

                    private["_sessionID","_parameters","_uberJobType","_player","_playerClass","_playerGang","_jobTitle"];
_sessionID = _this select 0;
_parameters = _this select 1;
_uberJobType = _parameters select 0;
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
    _playerClass = _player getVariable ['ExileLifeClientClass',""];
    _playerGang = _player getVariable ['ExileLifeClientGang',""];
    switch (_uberJobType) do {
        case (1): {
            if(_playerGang != "Guard" || _playerGang != "Rogue")then{
                [_sessionID,"beatup",[0.2]] call ExileServer_system_network_send_to;
                [_sessionID,"toastRequest",["ErrorTitleOnly",format["I know you! Your in the %1! Get Lost!",_playerGang]]] call ExileServer_system_network_send_to;
                throw "Player in Gang";
            };
            ExileLifeOnlineMedics deleteAt (ExileLifeOnlineMedics findIf {_x isEqualTo _sessionID});
            _jobTitle = "Medic";
            _player setVariable ['ExileLifeClientUberMedic',false,true];
        };
        case (2): {
            if (( _playerGang == "Guard" || _playerGang == "Rogue") || (_playerClass != "Murderer"))then{
                [_sessionID,"beatup",[0.4]] call ExileServer_system_network_send_to;
                [_sessionID,"toastRequest",["ErrorTitleOnly",["Stop wasting my Time!"]]] call ExileServer_system_network_send_to;
                throw "Invalid Gang";
            };
            ExileLifeOnlineMedics deleteAt (ExileLifeOnlineMedics findIf {_x isEqualTo _sessionID});
            _jobTitle = "Medic";
            _player setVariable ['ExileLifeClientUberMedic',false,true];
        };
        default{throw "Invalid Job Type";};
    };
    [_sessionID,"toastRequest",["InfoTitleOnly",[format["You are now showing as an unavailable %1",_jobTitle]]]] call ExileServer_system_network_send_to;
}
catch
{
    	format["ExileLifeServer_system_jobs_uber_network_uberPlayerUnavailable: %1",_exception] call ExileLifeServer_util_log;
};
