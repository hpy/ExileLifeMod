/**
                    * ExilelifeServer_object_player_injury_blood_network_bloodTestRequest
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

                    private["_sessionID","_package","_vialClassname","_playerObject","_bloodType","_newVialClassname"];
_sessionID = _this select 0;
_package = _this select 1;
_vialClassname = _package select 0;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "Player is null";
	};
	if !(alive _playerObject) then 
	{
		throw "Player is dead";
	};
	_bloodType = getText(configFile >> "CfgMagazines" >> _vialClassname >> "bloodType");
	if (_bloodType isEqualTo "") then 
	{
		throw "Invalid Blood Type";
	};
	_newVialClassname = format["ExileLife_Item_BloodVial_%1_02", _bloodType];
	{
		if !([_playerObject,_x] call ExileLifeClient_util_playercargo_contains)then{
			[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed!", "You don't have all the required parts!"]]] call Exileserver_system_network_send_to;
			throw format["Player (%1) doesn't have the items they claim to have",getPlayerUID _playerObject];
		};
	}forEach ["ExileLife_Item_BloodTestKit",_vialClassname];
	{
		if !([_playerObject, _x] call ExileClient_util_playerCargo_remove) then{
			[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed!", "You don't have all the required parts!"]]] call Exileserver_system_network_send_to;
			throw format["Player (%1) doesn't have the items they claim to have",getPlayerUID _playerObject];
		};
	}forEach ["ExileLife_Item_BloodTestKit",_vialClassname];
	[_playerObject, _newVialClassname] call ExileLifeClient_util_playerCargo_addOrDrop;
	_playerObject call ExileServer_object_player_database_update;
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["The blood test was successful!"]]] call ExileServer_system_network_send_to;
}
catch 
{
	_exception call ExileServer_util_log;
};	
true