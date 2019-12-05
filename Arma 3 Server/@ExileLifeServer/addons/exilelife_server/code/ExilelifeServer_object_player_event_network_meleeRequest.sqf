/**
                    * ExilelifeServer_object_player_event_network_meleeRequest
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

                    private["_sessionID","_parameters","_targetNetID","_ammo","_hitPoint","_requestingPlayer","_target","_damage","_targetsessionID"];
_sessionID = _this select 0;
_parameters = _this select 1;
_targetNetID = _parameters select 0;
_ammo = _parameters select 1;
_hitPoint = _parameters select 2;
_requestingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (isNull _requestingPlayer) then
	{
		throw format ["Hack Attempt: requestingPlayer %1 doesnt exist and tried to change a targets damage! - ",_requestingPlayer];
	};
	if !(alive _requestingPlayer) then
	{
		throw format ["Hack Attempt: requestingPlayer %1 is dead and tried to change a targets damage! - ",_requestingPlayer];
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
	if (_target == _requestingPlayer) then
	{
		throw "Stop hitting yourself!";
	};
	if ((_requestingPlayer distance _target) > 10) then
	{
		throw format ["Hack Attempt: requestingPlayer %1 and attempted to kill a distant player! - ",_requestingPlayer];
	};
	_damage = getNumber (configFile >> "cfgAmmo" >> _ammo >> "hit");
	if (_damage == 0) then
	{
		throw "There is no damage to be applied";
	};
	if (_hitPoint isEqualTo "") then
	{
		throw "There is no hitpoint to apply damage too";
	};
	_targetsessionID = (getPlayerUID _target) call ExileLifeServer_system_session_getIDfromUID;
	[_targetsessionID, "meleeResponse", [(_damage / 10),_hitPoint,_ammo]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileServer_util_log;
};
true
