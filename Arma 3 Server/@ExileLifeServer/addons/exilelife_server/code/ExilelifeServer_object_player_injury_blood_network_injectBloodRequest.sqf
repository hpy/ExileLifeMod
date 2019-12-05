/**
                    * ExilelifeServer_object_player_injury_blood_network_injectBloodRequest
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

                    private["_sessionID","_package","_netID","_itemClassname","_playerObject","_receiverObject","_bloodType","_receiverBloodType","_healthValue","_healthTime","_effects"];
_sessionID = _this select 0;
_package = _this select 1;
_netID = _package select 0;
_itemClassname = _package select 1;
try 
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "Player is null";
	};
	_receiverObject = objectFromNetId(_netID);
	if (isNull _receiverObject) then 
	{
		throw "Receiving player is null";
	};
	{
		if !([_playerObject,_x] call ExileLifeClient_util_playercargo_contains)then{
			[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed!", "You don't have all the required parts!"]]] call Exileserver_system_network_send_to;
			throw format["Player (%1) doesn't have the items they claim to have",getPlayerUID _playerObject];
		};
	}forEach ["ExileLife_Item_AutoInjector",_itemClassname];
	_bloodType = toLower(getText(configFile >> "CfgMagazines" >> _itemClassname >> "bloodType"));
	_receiverBloodType = _receiverObject getVariable ["ExileLifeBloodType", ""];
	_healthValue = -100;
	_healthTime = 120;
	switch (toLower(_receiverBloodType)) do 
	{
		case "a_pos": 
		{ 
			if (_bloodType in ["a_pos", "a_neg", "o_pos", "o_neg"]) then 
			{ 
				_healthValue = 25; 
				_healthTime = 60;
			}; 
		};
		case "a_neg":
		{
			if (_bloodType in ["a_neg", "o_neg"]) then 
			{
				_healthValue = 25; 
				_healthTime = 60;
			};
		};
		case "b_pos":
		{
			if (_bloodType in ["b_pos", "b_neg", "o_pos", "o_neg"]) then 
			{
				_healthValue = 25; 
				_healthTime = 60;
			};
		};
		case "b_neg":
		{
			if (_bloodType in ["b_neg", "o_neg"]) then 
			{
				_healthValue = 25; 
				_healthTime = 60;
			};
		};
		case "ab_pos":
		{
			if (_bloodType in ["a_pos", "a_neg", "ab_pos", "ab_neg", "b_pos", "b_neg", "o_pos", "o_neg"]) then 
			{
				_healthValue = 25; 
				_healthTime = 60;
			};
		};
		case "ab_neg":
		{
			if (_bloodType in ["a_neg", "ab_neg", "b_neg", "o_neg"]) then 
			{
				_healthValue = 25; 
				_healthTime = 60;
			};
		};
		case "o_pos":
		{
			if (_bloodType in ["o_pos", "o_neg"]) then 
			{
				_healthValue = 25; 
				_healthTime = 60;
			};
		};
		case "o_neg":
		{
			if (_bloodType in ["o_neg"]) then 
			{
				_healthValue = 25; 
				_healthTime = 60;
			};
		};
		default
		{
			throw format["Player %1 (%2) does not have a blood type", name _receiverObject, getPlayerUID _receiverObject];
		};
	};
	if !([_playerObject, _itemClassname] call ExileClient_util_playerCargo_remove) then{
		[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed!", "You are missing the blood vial!"]]] call Exileserver_system_network_send_to;
		throw format["Player (%1) doesn't have the items they claim to have",getPlayerUID _playerObject];
	};
	_effects = 
	[
		[
			0, 
			_healthValue,
			_healthTime
		]
	];
	[_receiverObject getVariable ["ExileSessionID", -1], "injectBloodResponse", [_effects]] call ExileServer_system_network_send_to;
	if !(_receiverObject == _playerObject)then{
		[_sessionID, "toastRequest", ["SuccessTitleOnly", [format["You've injected %1 with some blood",[_receiverObject] call ExileLifeClient_util_player_name]]]] call ExileServer_system_network_send_to;
	};
}
catch 
{
	_exception call ExileServer_util_log;
};
