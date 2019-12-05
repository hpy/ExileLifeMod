/**
                    * ExilelifeServer_object_player_event_forceConsumeChecks
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

                    private["_sessionID","_parameters","_targetNetID","_item","_result","_requestingPlayer","_target","_targetSessionID","_itemClassname"];
_sessionID = _this select 0;
_parameters = _this select 1;
_targetNetID = _parameters select 0;
_item = _parameters select 1;
_result = "";
_requestingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (isNull _requestingPlayer) then
	{
		throw format ["Hack Attempt: requestingPlayer %1 doesnt exist! - ",_requestingPlayer];
	};
	if !(alive _requestingPlayer) then
	{
		throw format ["Hack Attempt: requestingPlayer %1 is dead! - ",_requestingPlayer];
	};
	_target = objectFromNetId _targetNetID;
	if (isNull _target) then
	{
		throw "The target doesnt exist";
	};
	if !(alive _target) then
	{
		throw "The target is already dead";
	};
	if (_target getVariable ['ExileLifeClientIncapacitated',false]) then
	{
		throw "The player is already incapacitated!";
	};
	_targetSessionID = _target getVariable ["ExileSessionID", -1];
	if (_targetSessionID isEqualTo -1) then 
	{
		throw format["Failed to get recipients session id. %1", _target];
	};
	if (_target == _requestingPlayer) then
	{
		throw "Stop trying to force yourself to do things you dont want to!";
	};
	if !(_target getVariable ["ExileIsHandcuffed", false]) then
	{
		throw "Cannot force non-handcuffed players!";
	};
	if !([_requestingPlayer, _item] call ExileLifeClient_util_playercargo_contains) then
	{
		throw format["%1 does not have a %2 on them - dupe attempt!",_requestingPlayer,_item];
	};
	_requestingPlayer setVariable ["ExileLifeForcedConsuming", _itemClassname];
	_target setVariable ["ExileLifeForcedConsuming", _itemClassname];
}
catch 
{
	_result = _exception;
};
_result