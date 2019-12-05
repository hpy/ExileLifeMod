/**
                    * ExilelifeServer_object_player_event_network_waterOtherPlayerRequest
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

                    private["_sessionID","_parameters","_targetNetID","_item","_check","_target","_requestingPlayer","_targetSessionID","_config","_returnItemClass"];
_sessionID = _this select 0;
_parameters = _this select 1;
_targetNetID = _parameters select 0;
_item = _parameters select 1;
try
{
	_check = _this call ExileLifeServer_object_player_event_forceConsumeChecks;
	if !(_check isEqualTo "") then
	{
		throw _check;
	};
	_target = objectFromNetId _targetNetID;
	_requestingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
	_targetSessionID = _target getVariable ["ExileSessionID", -1];
	_config = (configFile >> "CfgMagazines" >> _item >> "Interactions" >> "Consuming");
	if !(isClass _config) then
	{
		_requestingPlayer setVariable ["ExileLifeForcedConsuming", ""];
		_target setVariable ["ExileLifeForcedConsuming", ""];
		throw format["%1 is not properly configured to be a drink item!", _item];
	};
	if !(getNumber(_config >> "isDrinkItem") isEqualTo 1) then 
	{
		_requestingPlayer setVariable ["ExileLifeForcedConsuming", ""];
		_target setVariable ["ExileLifeForcedConsuming", ""];
		throw format["%1 is not properly configured to be a drink item!", _item];
	};
	if !([_requestingPlayer,_item] call ExileClient_util_playerCargo_remove)then{
		throw format["Error Removing %1 from %2",_item,_requestingPlayer];
	};
	_returnItemClass = getText (_config >> "returnedItem");
	if( _returnItemClass != "" ) then
	{
		[_requestingPlayer, _returnItemClass] call ExileLifeClient_util_playerCargo_addOrDrop;
	};
	[_targetSessionID, "forceConsumeRequest", [_item]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleOnly", ["Something went wrong... Why can't I make them eat?"]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};