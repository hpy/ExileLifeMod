/**
                    * ExilelifeServer_resources_processing_network_sterilizeRequest
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

                    private["_sessionId","_parameters","_containernetID","_player","_sessionID","_container","_brewingchk","_sterile"];
_sessionId = _this select 0;
_parameters = _this select 1;
_containernetID = _parameters select 0;
_player = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (isNull _player) then
	{
		throw "You dont exist!";
	};
	if !(alive _player) then
	{
		throw "You are not alive!";
	};	
	_container = objectFromNetId _containernetID;
	if (isNull _container) then
	{
		throw "This container does not exist!";
	};	
	if ((_player distance _container) > 10) then 
	{
		throw "You are too far away from the container!";
	};
	_brewingchk = _container getVariable ["ExileLifeBrewing",-1]; 
	if (_brewingchk isEqualTo 0) then
	{
		_container setVariable ["ExileLifeSterilised",2];	
		_container setVariable ["ExileLifePoisoner",_sessionID];	
		throw "Did you mean to do that? I hope its ok...";
	};
	if (_brewingchk isEqualTo 1) then
	{
		_container setVariable ["ExileLifeSterilised",3];	
		_container setVariable ["ExileLifePoisoner",_sessionID];	
		throw "Now thats just evil!";
	};
	_sterile = _container getVariable ["ExileLifeSterilised",-1];
	_container setVariable ["ExileLifeSterilised",1];	
	[_sessionID, "toastRequest", ["SuccessTitleAndText", ["Sterile!", "This container has been sterilised!"]]] call ExileServer_system_network_send_to;
}
catch 
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Ummm...", _exception]]] call ExileServer_system_network_send_to;
};
