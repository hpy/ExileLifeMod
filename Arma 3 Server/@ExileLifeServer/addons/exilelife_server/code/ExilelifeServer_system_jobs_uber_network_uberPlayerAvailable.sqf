/**
                    * ExilelifeServer_system_jobs_uber_network_uberPlayerAvailable
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

                    private["_sessionID","_parameters","_uberJobType","_player","_playerClass","_playerGang","_result","_jobTitle"];
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
    _result = -1;
    switch (_uberJobType) do {
        case (1): {
            if !(_playerGang == "Guard" || (_playerGang == "Rogue" && _playerClass == "Murderer"))then{
                [_sessionID,"beatup",[0.2]] call ExileServer_system_network_send_to;
                [_sessionID,"toastRequest",["ErrorTitleOnly","Get lost! You can't be a medic!"]] call ExileServer_system_network_send_to;
                throw "Player in Gang/Is not a Murderer";
            };
            _result = ExileLifeOnlineMedics pushBackUnique _sessionID;
            _jobTitle = "Medic";
            _player setVariable ['ExileLifeClientUberMedic',true,true];
        };
        case (2): {
            if ( _playerGang == "Guard" || _playerGang == "Rogue" || _playerClass != "Murderer")then{
                    [_sessionID,"beatup",[0.4]] call ExileServer_system_network_send_to;
                    [_sessionID,"toastRequest",["ErrorTitleOnly",["Get out of here!"]]] call ExileServer_system_network_send_to;
                    throw "Invalid Gang/Not a Murderer";
                };
            _result = ExileLifeOnlineMedics pushBackUnique _sessionID;
            _jobTitle = "Medic";
            _player setVariable ['ExileLifeClientUberMedic',true,true];
        };
        default{throw "Invalid Job Type";};
    };
    if (_result == -1)then{
            throw "player is already listed as a medic";
    };
    [_sessionID,"toastRequest",["InfoTitleOnly",[format["You are now showing as an available %1",_jobTitle]]]] call ExileServer_system_network_send_to;
}
catch
{
    	format["ExileLifeServer_system_jobs_uber_network_uberPlayerAvailable: %1",_exception] call ExileLifeServer_util_log;
};
