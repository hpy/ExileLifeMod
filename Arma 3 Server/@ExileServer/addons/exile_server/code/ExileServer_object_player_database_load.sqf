/**
                    * ExileServer_object_player_database_load
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

                    private["_data","_oldPlayerObject","_playerUID","_sessionID","_ExileLifeData","_gangname","_totalweight","_position","_direction","_player","_clanID","_clanName","_clanData","_clanGroup","_prisonerID","_criminalRecord","_sessionId","_currentJobArray","_jobArray","_jobClassname","_jobProgression","_extDBEndTime","_jobPos","_jobExtras","_currentTime","_timeLeft","_timeToComplete","_filePath","_code","_result","_gangStats","_dualAccount","_devFriendlyMode","_devs","_hasAdminAccess","_headgear","_goggles","_binocular","_primaryWeapon","_handgunWeapon","_secondaryWeapon","_currentWeapon","_uniform","_vest","_backpack","_uniformContainer","_vestContainer","_backpackContainer","_assignedItems","_messages"];
_data = _this select 0;
_oldPlayerObject = _this select 1;
_playerUID = _this select 2;
_sessionID = _this select 3;
_ExileLifeData = _this select 4;
_gangname = _ExileLifeData select 6;
_totalweight = 0;
_name = name _oldPlayerObject;
_position = [_data select 11, _data select 12, _data select 13];
_direction = _data select 10;
if ((_ExileLifeData select 4) isEqualTo "Guard") then
{
	_player = (createGroup blufor) createUnit ["ExileLife_Unit_Guard", _position, [], 0, "CAN_COLLIDE"];
	_player setVariable ["ExileLifeClient:Guard",true,true];
	ExileLifeOnlineGuards pushback _sessionID;
}
else
{
	_player = (createGroup independent) createUnit ["Exile_Unit_Player", _position, [], 0, "CAN_COLLIDE"];
	_player setVariable ["ExileLifeClient:Guard",false,true];
};
_player setDir _direction;
_player setPosATL _position;
_player disableAI "FSM";
_player disableAI "MOVE";
_player disableAI "AUTOTARGET";
_player disableAI "TARGET";
_player disableAI "CHECKVISIBLE";
_clanID = (_data select 42);
_clanName = (_data select 43);
if !((typeName _clanID) isEqualTo "SCALAR") then
{
	_clanID = -1;
	_clanData = [];
}
else
{
	_clanData = missionnamespace getVariable [format ["ExileServer_clan_%1",_clanID],[]];
	if(isNull (_clanData select 5))then
	{
		_clanGroup = createGroup independent;
		_clanData set [5,_clanGroup];
		_clanGroup setGroupIdGlobal [_clanData select 0];
		missionNameSpace setVariable [format ["ExileServer_clan_%1",_clanID],_clanData];
	}
	else
	{
		_clanGroup = (_clanData select 5);
	};
	[_player] joinSilent _clanGroup;
};
_player setDamage (_data select 3);
_player setName _name;
_player setVariable ['ExileLifeClientClass', (_ExileLifeData select 4)];
_player setVariable ["ExileLifeClientRank", (_ExileLifeData select 5)];
_player setVariable ['ExileLifeClientGang', (_ExileLifeData select 6),true];
_player setVariable ["ExileLifeSkill:Lockpick", [(_ExileLifeData select 7), (_ExileLifeData select 8)],true];
_player setVariable ["ExileLifeSkill:Strength", [(_ExileLifeData select 9), (_ExileLifeData select 10)],true];
_player setVariable ["ExileLifeSkill:Speed", [(_ExileLifeData select 11), (_ExileLifeData select 12)],true];
_player setVariable ["ExileLifeSkill:Heal", [(_ExileLifeData select 13), (_ExileLifeData select 14)],true];
_player setVariable ["ExileLifeSkill:Repair", [(_ExileLifeData select 15), (_ExileLifeData select 16)],true];
_player setVariable ["ExileLifePID", (_ExileLifeData select 18)];
_prisonerID = (_ExileLifeData select 18) call ExileLifeServer_system_session_createPrisonerID;
_player setVariable ["ExileLifePrisonerID", _prisonerID,true];
_player setVariable ["ExileLifeName",[(_ExileLifeData select 0),(_ExileLifeData select 1)], true];
_player setVariable ["ExileLifeCharacterInfo",[(_ExileLifeData select 0),(_ExileLifeData select 1),(_ExileLifeData select 2),(_ExileLifeData select 3)]];
_player setVariable ["ExileLifeJobs:Completed",(_ExileLifeData select 21)];
_player setVariable ["ExileLifeJobs:Failed",(_ExileLifeData select 22)];
_player setVariable ["ExileLifeCommittedCrimes", (_ExileLifeData select 23)];
_player setVariable ["ExileLifeVirtualGarage",format["loadPlayersVG:%1",(_ExileLifeData select 18)] call ExileServer_system_database_query_selectFull];
_player setVariable ["ExileLifeMessages", (_ExileLifeData select 24)];
_player setVariable ["ExileLifeExileDate", (_ExileLifeData select 25)];
_player setVariable ["ExileLifeGasMaskTimeLeft", (_ExileLifeData select 28)];
_player setVariable ["ExileLifeForcedConsuming", ""];
_player setVariable ["ExileLifeBloodType", (_ExileLifeData select 26)];
_criminalRecord = format["getPrisonerRecord:%1",(_ExileLifeData select 18)] call ExileServer_system_database_query_selectSingle;
_player setVariable ["ExileLifeCriminalRecord",[_criminalRecord select 2, _criminalRecord select 3],true];
missionNamespace setVariable [format["ExileLifeSessionUID%1", _playerUID], _sessionId];
missionNamespace setVariable [format["ExileLifeSessionPID%1", _prisonerID], _sessionId];
missionNamespace setVariable [format["ExileLifeSessionDBID%1", (_ExileLifeData select 18)], _sessionId];
_currentJobArray = [];
if (count (_ExileLifeData select 20) != 0) then
{
	_jobArray = _ExileLifeData select 20;
	_jobClassname = _jobArray select 0;
	_jobProgression = _jobArray select 1;
	_extDBEndTime = _jobArray select 2;
	_jobPos = _jobArray select 3;
	_jobExtras = _jobArray select 4; 
	_currentTime = call ExileServer_util_time_currentTime;
	_timeLeft = [_extDBEndTime,_currentTime] call ExileLifeServer_util_time_timeLeft;
	_timeToComplete = _extDBEndTime;
	_timeToComplete deleteRange [0,2]; 
	_player setVariable ["ExileLifeJobs:Current",[_jobClassname,_jobProgression,str(_timeLeft),_jobPos,_jobExtras]];
	_player setVariable ["ExileLifeJobTime",_timeToComplete];
	if(count _jobExtras == 0) then
	{
		_filePath = getText (configFile >> "CfgJobs" >> _jobClassname >> "path");
		if !(_filePath isEqualTo "") then
		{
			_code = missionNamespace getVariable [format["ExileLifeServer_system_jobs_scenes_%1_onRestart",_filePath],""];
			if !(_code isEqualTo "") then
			{
				_result = [_sessionID,_player,_jobArray] call _code;
			};
		};
	}
	else
	{
		_code = missionNamespace getVariable [format["%1",_jobExtras select 0],""];
		if !(_code isEqualTo "") then
		{
			_result = [_sessionID,_player,_jobArray] call _code;
		};
	};
};
if !(isNil (_ExileLifeData select 6)) then
{
	_gangStats = [_sessionID,_playerUID,_player,_gangname] call ExileLifeServer_object_player_network_GangStatsRequest;
	_player setVariable ["ExileLifeGangTax", (_gangStats select 1)];
	_player setVariable ["ExileLifeGangWage", (_gangStats select 2)];
}
else
{
	_player setVariable ["ExileLifeGangTax", 0];
	_player setVariable ["ExileLifeGangWage", 0];
};
_player setVariable ["ExileMoney", (_data select 38), true];
_player setVariable ["ExileScore", (_data select 39)];
_player setVariable ["ExileKills", (_data select 40)];
_player setVariable ["ExileDeaths", (_data select 41)];
_player setVariable ["ExileClanID", _clanID];
_player setVariable ["ExileClanData", _clanData];
_player setVariable ["ExileName", _name]; 
_player setVariable ["ExileOwnerUID", _playerUID]; 
_player setVariable ["ExileDatabaseID", _data select 0];
_player setVariable ["ExileHunger", _data select 4];
_player setVariable ["ExileThirst", _data select 5];
_player setVariable ["ExileAlcohol", _data select 6];
_player setVariable ["ExileTemperature", _data select 44];
_player setVariable ["ExileWetness", _data select 45];
_player setVariable ["ExileIsBambi", false];
_player setVariable ["ExileXM8IsOnline", false, true];
_player setOxygenRemaining (_data select 7);
_player setBleedingRemaining (_data select 8);
_player setVariable ["ExileLocker", (_data select 46), true];
[_player, _data select 9] call ExileClient_util_player_applyHitPointMap;
_dualAccount = _oldPlayerObject getVariable ["ExileLifeClientSpawnChoice", ""]; 
if !(_dualAccount isEqualTo "") then
{
	_player setVariable ["ExileLifeClientSpawnChoice", _dualAccount];
};
_devFriendlyMode = getNumber (configFile >> "CfgSettings" >> "ServerSettings" >> "devFriendyMode");
if (_devFriendlyMode isEqualTo 1) then
{
	_devs = getArray (configFile >> "CfgSettings" >> "ServerSettings" >> "devs");
	if (_playerUID in _devs) then
	{
		_player setVariable ["ExileMoney", 500000];
		_player setVariable ["ExileScore", 100000];
	};
};
_hasAdminAccess = format["hasAdminAccess:%1", _playerUID] call ExileServer_system_database_query_selectSingleField;
if (_hasAdminAccess) then
{
	[_sessionID,_player] call ExileLifeServer_admintools_system_security_requestAdminAccess;
};
_player call ExileClient_util_playerCargo_clear;
_headgear = _data select 23;
if (_headgear != "") then
{
	_player addHeadgear _headgear;
};
_goggles = _data select 20;
if (_goggles != "") then
{
	_player addGoggles _goggles;
};
_binocular = _data select 24;
if (_binocular != "") then
{
	_player addWeaponGlobal _binocular;
};
_primaryWeapon = _data select 26;
if (_primaryWeapon != "") then
{
	_player addWeaponGlobal _primaryWeapon;
	removeAllPrimaryWeaponItems _player;
	{
		if (_x != "") then
		{
			_player addPrimaryWeaponItem _x;
		};
	}
	forEach (_data select 27);
};
_handgunWeapon = _data select 22;
if (_handgunWeapon != "") then
{
	_player addWeaponGlobal _handgunWeapon;
	removeAllHandgunItems _player;
	{
		if (_x != "") then
		{
			_player addHandgunItem _x;
		};
	}
	forEach (_data select 21);
};
_secondaryWeapon = _data select 28;
if (_secondaryWeapon != "") then
{
	_player addWeaponGlobal _secondaryWeapon;
	{
		if (_x != "") then
		{
			_player addSecondaryWeaponItem _x;
		};
	}
	forEach (_data select 29);
};
 _currentWeapon = _data select 19;
if (_currentWeapon != "") then
{
	 _player selectWeapon _currentWeapon;
};
{
	_player addWeaponItem [_x select 0, [_x select 1, _x select 2, _x select 3]];
}
forEach (_data select 25);
_uniform = _data select 30;
_vest = _data select 34;
_backpack = _data select 15;
if (_uniform != "") then
{
	_player forceAddUniform _uniform;
};
if (_vest != "") then
{
	_player addVest _vest;
};
if (_backpack != "") then
{
	_player addBackpackGlobal _backpack;
};
_uniformContainer = uniformContainer _player;
if !(isNil "_uniformContainer") then
{
	{
		_uniformContainer addWeaponCargoGlobal _x;
	}
	forEach (_data select 33);
	{
		_uniformContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1];
	}
	forEach (_data select 32);
	{
		_uniformContainer addItemCargoGlobal _x;
	}
	forEach (_data select 31);
};
_vestContainer = vestContainer _player;
if !(isNil "_vestContainer") then
{
	{
		_vestContainer addWeaponCargoGlobal _x;
	}
	forEach (_data select 37);
	{
		_vestContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1];
	}
	forEach (_data select 36);
	{
		_vestContainer addItemCargoGlobal _x;
	}
	forEach (_data select 35);
};
_backpackContainer = backpackContainer _player;
if !(isNil "_backpackContainer") then
{
	{
		_backpackContainer addWeaponCargoGlobal _x;
	}
	forEach (_data select 18);
	{
		_backpackContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1];
	}
	forEach (_data select 17);
	{
		_backpackContainer addItemCargoGlobal _x;
	}
	forEach (_data select 16);
};
_assignedItems = _data select 14;
if !(_assignedItems isEqualTo []) then
{
	{
		_player linkItem _x;
	}
	forEach _assignedItems;
};
_player addMPEventHandler ["MPKilled", {_this call ExileServer_object_player_event_onMpKilled}];
if (getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "thermalVision") isEqualTo 0) then
{
	_player addEventHandler ["WeaponAssembled", {(_this select 1) disableTIEquipment true;}];
};
if (getNumber(missionConfigFile >> "CfgSimulation" >> "enableDynamicSimulation") isEqualTo 1) then
{
	if ((canTriggerDynamicSimulation _player) isEqualTo false) then
	{
		_player triggerDynamicSimulation true;
	  	_player enableDynamicSimulation true;
	};
};
_messages = _player call ExileLifeServer_util_messaging_buildMessageList;
[
	_sessionID,
	"loadPlayerResponse",
	[
		(netId _player),
		str (_player getVariable ["ExileScore", 0]),
		(_player getVariable ["ExileKills", 0]),
		(_player getVariable ["ExileDeaths", 0]),
		(_player getVariable ["ExileHunger", 100]),
		(_player getVariable ["ExileThirst", 100]),
		(_player getVariable ["ExileAlcohol", 0]),
		(_player getVariable ["ExileClanData", []]),
		(_player getVariable ["ExileTemperature", 0]),
		(_player getVariable ["ExileWetness", 0]),
		(_player getVariable ['ExileLifeClientClass', ""]),
		(_player getVariable ["ExileLifeClientRank", 0]),
		(_player getVariable ['ExileLifeClientGang', ""]),
		(_player getVariable ["ExileLifeSkill:Lockpick", [1, 0]]),
		(_player getVariable ["ExileLifeSkill:Strength", [1, 0]]),
		(_player getVariable ["ExileLifeSkill:Speed", [1, 0]]),
		(_player getVariable ["ExileLifeSkill:Heal", [1, 0]]),
		(_player getVariable ["ExileLifeSkill:Repair", [1, 0]]),
		(_player getVariable ["ExileLifeGangTax", 0]),
		(_player getVariable ["ExileLifeGangWage", 0]),
		BlackMarketInventory,
		(_player getVariable ["ExileLifeJobs:Current",[]]),
		(_player getVariable ["ExileLifeJobs:Failed",[]]),
		(_player getVariable ["ExileLifeJobs:Completed",[]]),
		ExileLifeJobBoard,
		(_player getVariable ["ExileLifeVirtualGarage",[]]),
		(_player getVariable ["ExileLifeCharacterInfo",[]]),
		_messages,
		(_player getVariable ["ExileLifeGasMaskTimeLeft", 0]),
		(_player getVariable ["ExileLifeBloodType", ""])
	]
]
call ExileServer_system_network_send_to;
[_sessionID, _player] call ExileServer_system_session_update;
true
