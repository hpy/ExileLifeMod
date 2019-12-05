/**
                    * ExilelifeServer_system_jobs_scenes_general_gangRecruitment_onCompletion
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

                    private["_sessionID","_playerObject","_jobClassname","_nextStep","_gang","_result","_removeItems","_playerGang","_gangMinRespectLevel","_playerRespect","_playerClass","_vehicle","_neededItems","_check","_playerID","_gangMembers","_gangArmband"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_jobClassname = _this select 2;
_nextStep = _this select 3;
_gang = _this select 4;
_result = "";
_removeItems = false;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	_playerGang = _playerObject getVariable ['ExileLifeClientGang', ""];
	if !((_playerGang == "") || (_playerGang == "rogue")) then
	{
		[_sessionID,"beatup",[0.4]] call ExileServer_system_network_send_to;
		throw "You think we dont know your a spy fool! Send our regards to your boss!";
	};
	_gangMinRespectLevel = missionNamespace getVariable [format["ExileLifeGangRespect:%1",_gang],1];
	_playerRespect = _playerObject getVariable ["ExileScore", 0];
	if (_playerRespect < _gangMinRespectLevel) then
	{
		throw format["Come back when you have enough respect (%1). Why would we want someone as pathetic as you in our Gang?",_gangMinRespectLevel];
	};
	_playerClass = _playerObject getVariable ['ExileLifeClientClass', ""];
	if (isNil "_playerClass") then
	{
		throw "Somehow you got amnesia and are good for nothing but cannon fodder";
	};
	_vehicle = objectFromNetId (_playerObject getVariable ["ExileLifeJobVehicle",""]);
	if (isNull _vehicle) then
	{
		throw "WHAT DID YOU DO TO OUR VEHICLE!";
	};
	if !(alive _vehicle) then
	{
		throw "WHAT DID YOU DO TO OUR VEHICLE!";
	};
	if ((_playerObject distance _vehicle) > 15) then
	{
		throw "Where's the Vehicle at? Park it closer so i can inspect it!";
	};
	switch (toLower _playerClass) do
	{
		case "thief" :
		{
			_removeItems = true;
			_neededItems = [["PHYSICAL",["ExileLife_Item_Meth_Blue",10]]];
		};
		case "smuggler" :
		{
			_removeItems = true;
			_neededItems = [["PHYSICAL",["ExileLife_Item_Cannabis_Packet",10]]];
		};
		case "thug" :
		{
		};
		case "murderer" :
		{
		};
		default {  throw "You somehow got amnesia and forgot everything about anything"; };
	};
	if (_removeItems) then
	{
		_check = [_playerObject,_neededItems] call ExileLifeServer_system_jobs_util_items_remove;
		if !(_check) then
		{
			_check = [_playerObject,_neededItems] call ExileLifeServer_system_jobs_util_vehicle_removeInventory;
			if !(_check) then
			{
				throw ["So where's our stuff? Its not on your or in the vehicle... You better not be trying to pull something!"];
			};
		};
	};
	_vehicle setVariable ["ExileLifeJobVehicle",nil];
	_vehicle setVariable ["ExileLifeOldManVehicle",nil,true];
	_vehicle setVariable ["ExileLifePermittedDrivers",nil,true];
	_playerID = _playerObject getVariable ["ExileLifePID", -1];
	[_sessionID, "updateVariable", ['ExileLifeClientGang',_gang]] call ExileServer_system_network_send_to;
	_playerObject setVariable ['ExileLifeClientGang', _gang, true];
	format ["joinGang:%1:%2",_gang,_playerID] call ExileServer_system_database_query_fireAndForget;
	_gangMembers = missionNamespace getVariable [(format["ExileLifeGangMembers:%1",_gang]),0];
	format ["updateGangNumbers:%1:%2",(_gangMembers + 1),_gang] call ExileServer_system_database_query_fireAndForget;
	_gangArmband = format ["ExileLife_Clothing_%1_Armband",_gang];
	_playerObject linkItem _gangArmband;
}
catch
{
	_result = _exception;
};
_result
