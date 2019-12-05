/**
                    * ExilelifeServer_system_jobs_scenes_general_gangRecruitment_onInit
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

                    private["_sessionID","_playerObject","_jobClassname","_position","_gang","_result","_playerGang","_msg","_membershipCost","_money","_gangMinRespectLevel","_playerRespect","_gangList","_gangMembers","_gangChkArray","_enemyMembers","_playerClass","_gangBlacklist","_playerID","_pid","_dateAdded","_dateExpire","_vehicleArray","_vehicle","_vehicleEH","_unit","_playerUID","_getinEH","_drivers","_pincode","_vehiclePinCode","_titleMsg","_playerMoney","_player","_gangBankName","_gangBankBalance","_newgangBankBalance"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_jobClassname = _this select 2;
_position = _this select 3;
_gang = _this select 4;
_result = [];
try
{
	_playerGang = _playerObject getVariable ['ExileLifeClientGang',""];
	if !((_playerGang == "") || (_playerGang == "rogue")) then
	{
		[_sessionID,"beatup",[0.2]] call ExileServer_system_network_send_to;
		_msg = true;
		throw format ["You think we dont know ur a member of the %1!",_playerGang];
	};
	_membershipCost = missionNamespace getVariable [(format ["ExileLifeGangMembershipCost:%1",_gang]),0];
	_money = _playerObject getVariable ["ExileMoney", 0];
	if (_money < _membershipCost) then
	{
		[_sessionID,"beatup",[0.2]] call ExileServer_system_network_send_to;
		_msg = true;
		throw "I warned you! You dont have the cash! Stop wasting my time!";
	};
	_gangMinRespectLevel = missionNamespace getVariable [format["ExileLifeGangRespect:%1",_gang],1];
	_playerRespect = _playerObject getVariable ["ExileScore", 0];
	if (_playerRespect < _gangMinRespectLevel) then
	{
		[_sessionID,"beatup",[0.2]] call ExileServer_system_network_send_to;
		_msg = true;
		throw "I warned you! You dont have the respect we want! Stop wasting my time!";
	};
	_gangList = ["Mafia","Cartel","Syndicate","Yakuza"];
	_gangList = _gangList - [_gang];
	_gangMembers = missionNamespace getVariable [(format["ExileLifeGangMembers:%1",_gang]),0];
	_gangChkArray =[];
	{
		_enemyMembers = missionNamespace getVariable [(format ["ExileLifeGangMembers:%1",_x]),0];
		if ((_gangMembers - _enemyMembers) > 9) exitWith
		{
			_msg = true;
			throw "So the boss just informed we are currently not accepting new members!";
		};
	}forEach _gangList;
	_playerClass = _playerObject getVariable ['ExileLifeClientClass', ""];
	if (_playerClass isEqualTo "") then
	{
		throw "Somehow you got amnesia and are good for nothing but cannon fodder";
	};
	_gangBlacklist = missionNamespace getVariable [(format ["ExileLifeGangBlacklist:%1",_gang]),[]];
	if !(_gangBlacklist isEqualto []) then
	{
		if !((count _gangBlacklist) > 0) exitWith {};
		_playerID = _playerObject getVariable ["ExileDatabaseID", 0];
		{
			_pid = _x select 0;
			_dateAdded = _this select 1;
			_dateExpire = _this select 2;
			if (_pid isEqualTo _playerID) exitWith
			{
				[_sessionID,"beatup",[0.2]] call ExileServer_system_network_send_to;
				_msg = true;
				throw "Your Blacklisted! Thought we forgot did you?";
			};
		}forEach _gangBlacklist;
	};
	if (_position isEqualTo []) then
	{
		throw "Error getting position";
	};
	_vehicleArray =
	[
		"Exile_Car_Hatchback_Beige",
		"Exile_Car_Hatchback_Sport_Beige",
		"Exile_Car_Hatchback_Sport_Green",
		"Exile_Car_Lada_Green",
		"Exile_Car_Landrover_Green",
		"Exile_Car_Landrover_Sand",
		"Exile_Car_Octavius_Black",
		"Exile_Car_Octavius_White",
		"Exile_Car_Offroad_Beige",
		"Exile_Car_Van_Guerilla01",
		"Exile_Car_Volha_Brown",
		"ExileLife_Car_Hatchback_Red",
		"ExileLife_Car_Skoda_White",
		"ExileLife_Truck_Datsun_Open"
	];
	_vehicle = [_playerObject,(selectRandom _vehicleArray),_position] call ExileLifeServer_system_jobs_util_vehicle_persistent;
	if (isNull _vehicle) then
	{
		throw "Error spawning vehicle";
	};
	_playerObject setVariable ["ExileLifeJobVehicle",netID _vehicle];
	_vehicleEH = _vehicle addEventHandler ["getIn",
	{
		_vehicle = _this select 0;
		_unit = _this select 2;
		if ((netID _unit) in (_vehicle getVariable ["ExileLifePermittedDrivers",[]])) then
		{
			_playerUID = getPlayerUID _unit;
			_sessionID = _playerUID call ExileLifeServer_system_session_getIDfromUID;
			[_sessionID] call ExilelifeServer_system_jobs_process_network_progressJobRequest;
			_getinEH = _vehicle getVariable ["ExileLifeGetInEH",-1];
			_vehicle removeEventHandler ["getIn",_getinEH];
		};
	}];
	_vehicle setVariable ["ExileLifeGetInEH",_vehicleEH];
	_vehicleEH = _vehicle addEventHandler ["killed",
	{
		_vehicle = _this select 0;
		_drivers = _vehicle getVariable ["ExileLifePermittedDrivers",[]];
		_unit = objectFromNetId (_drivers select 0);
		if !((_vehicle getVariable ["ExileLifeJobVehicle",""]) isEqualTo "") then
		{
			_playerUID = getPlayerUID _unit;
			_sessionID = _playerUID call ExileLifeServer_system_session_getIDfromUID;
			[_sessionID, "toastRequest", ["ErrorTitleAndText", ["DESTROYED", "Your job vehicle was destroyed... oh oh..."]]] call ExileServer_system_network_send_to;
			[_sessionID] call ExilelifeServer_system_jobs_process_network_failJobRequest;
		};
	}];
	[_vehicle,"B_Carryall_ocamo"] call ExileClient_util_containerCargo_add;
	switch (toLower _playerClass) do
	{
		case "thief" : 		{
								[_vehicle,"ExileLife_Item_HashCatXL"] call ExileClient_util_containerCargo_add;
								[_vehicle,"Exile_Item_Laptop"] call ExileClient_util_containerCargo_add;
							};
		case "smuggler" : 	{
							};
		case "murderer" : 	{
							};
		case "thug" :		{
								[_vehicle,"democharge_remote_mag"] call ExileClient_util_containerCargo_add;
							};
		default {  throw "You somehow got amnesia and forgot everything about anything"; };
	};
	_pincode = _vehicle getVariable ["ExileAccessCode", "000000"];
	if (_vehiclePinCode isEqualTo "000000") then
	{
		throw "Error Spawning Persistant Vehicle!";
	};
	_titleMsg = format["Remember this Pincode: %1",_pincode];
	 [_sessionID, "baguetteRequest", [[_titleMsg]]] call ExileServer_system_network_send_to;
	_playerObject setVariable ["ExileMoney", (_money - _membershipCost), true];
	format["setPlayerMoney:%1:%2", _playerMoney, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	_gangBankName = format ["ExileLifeGangBank:%1",_gang];
	_gangBankBalance = missionNamespace getVariable [_gangBankName,-1];
	_newgangBankBalance = _gangBankBalance + _membershipCost;
	missionNamespace setVariable [_gangBankName,_newgangBankBalance];
	format["updateGangBank:%1:%2",_newgangBankBalance,_gang] call ExileServer_system_database_query_fireAndForget;
}
catch
{
	_result = [_msg,_exception];
};
_result
