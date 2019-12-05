/**
                    * ExileServer_object_animal_network_announceAnimalRequest
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

                    private["_sessionId","_parameters","_netId","_animal","_player"];
_sessionId = _this select 0;
_parameters = _this select 1;
_netId = _parameters select 0;
_animal = objectFromNetId _netId;
if (isNull _animal) then 
{
	(format ["Failed to retrieve animal with Net-ID %1. Probably net work lag?", _netId]) call ExileServer_util_log;
}
else 
{
	_animal setVariable ["SpawnedAt", time];
	_animal setVariable ["WasGutted", false];
	_animal setVariable ["CanBeGutted", false, true];
	_animal addMPEventHandler ["MPKilled", { _this call ExileServer_object_animal_event_onKilled; }];
	_player = _sessionId call ExileServer_system_session_getPlayerObject;
	if !(isNull _player) then
	{
		missionNamespace setVariable [format ["ExileAnimal%1", getPlayerUID _player], _animal];
	};
};