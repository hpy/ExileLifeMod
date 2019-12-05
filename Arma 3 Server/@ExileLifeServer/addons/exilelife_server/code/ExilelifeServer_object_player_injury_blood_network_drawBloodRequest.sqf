/**
                    * ExilelifeServer_object_player_injury_blood_network_drawBloodRequest
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

                    private["_sessionID","_package","_netID","_playerObject","_donorObject","_bloodType","_donorHealth","_damage","_vial"];
_sessionID = _this select 0;
_package = _this select 1;
_netID = _package select 0;
try 
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "Player is null";
	};
	_donorObject = objectFromNetId(_netID);
	if (isNull _donorObject) then 
	{
		throw "Donor object is null";
	};
	_bloodType = _donorObject getVariable ["ExileLifeBloodType", ""];
	if (_bloodType isEqualTo "") then 
	{
		throw format["%1 (%2) has no blood type", name _donorObject, getPlayerUID _donorObject];
	};
	{
		if !([_playerObject,_x] call ExileLifeClient_util_playercargo_contains)then{
			[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed!", "You don't have all the required parts!"]]] call Exileserver_system_network_send_to;
			throw "Player doesn't have the items they claim to have";
		};
	}forEach ["ExileLife_Item_BloodDrawKit","ExileLife_Item_BloodVial_Empty"];
	if !([_playerObject, "ExileLife_Item_BloodVial_Empty"] call ExileClient_util_playerCargo_remove) then 
	{
		[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed!", "You don't enough an Empty Blood Vial in your inventory"]]] call Exileserver_system_network_send_to;
		throw "Player doesn't have the items they claim to have";
	};
	_donorHealth = _donorObject call ExileLifeClient_util_health_getAverageHealth;
	_damage = (_donorHealth + 0.1);
	if (_damage >= 1) then 
	{
		_donorObject setVariable ["ExileLifeDeathReason", "BLEEDOUT"];
	};
	_vial = format["ExileLife_Item_BloodVial_%1_01", _bloodType];
	[_playerObject, _vial] call ExileLifeClient_util_playerCargo_addOrDrop;
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["You've successfully drawn blood"]]] call Exileserver_system_network_send_to;
	[_donorObject getVariable ["ExileSessionID", -1], "drawBloodResponse", [0.25]] call Exileserver_system_network_send_to;
	_playerObject call ExileServer_object_player_database_update;
}
catch 
{
	_exception call ExileServer_util_log;
};
true