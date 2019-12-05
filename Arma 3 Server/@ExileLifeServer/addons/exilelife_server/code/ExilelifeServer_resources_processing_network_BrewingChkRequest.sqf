/**
                    * ExilelifeServer_resources_processing_network_BrewingChkRequest
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

                    private["_sessionId","_player","_sessionID","_brewType","_brewRemaining","_container","_brewingchk","_sterile","_brewingmodels","_objectNetID","_responseCode"];
_sessionId = _this select 0;
_player = _sessionID call ExileServer_system_session_getPlayerObject;
_brewType = "";
_brewRemaining = 0;
_container = objNull;
_brewingchk = -1;
_sterile = -1;
try
{
	if (isNull _player) then
	{
		throw "You dont exist!";
	};
	_brewingmodels = getArray(missionConfigFile >> "CfgInteractionModels" >> "BrewingSource" >> "models");
	_container = [_player, 10, _brewingmodels] call ExileLifeClient_util_model_getNearby;
	if (isNull _container) then 
	{		
		throw "There is no brewing container nearby!";
	};
	_brewingchk = _container getVariable ["ExileLifeBrewing",-1]; 
	if (_brewingchk == -1) then
	{
		throw "This container holds no brewing ingredients!";
	};
	if (_brewingchk == 0) then
	{
		throw "There is something brewing inside that barrel!";
	};
	_sterile = _container getVariable ["ExileLifeSterilised",-1];
	_objectNetID = netID _container;
	_brewType = _container getVariable ["ExileLifeBrewType",""];
	_brewRemaining = _container getVariable ["ExileLifeBrewAmount",0];
	[_sessionID, "brewingChkResponse", ["OK",_brewRemaining,_brewType,_brewingchk,_sterile]] call ExileServer_system_network_send_to;
}
catch 
{
	_responseCode = _exception;
	[_sessionID, "brewingChkResponse", [_responseCode, 0,"",_brewingchk,_sterile]] call ExileServer_system_network_send_to;
};
true
