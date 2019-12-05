/**
                    * ExileServer_object_player_createBambi
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

                    private["_sessionID","_requestingPlayer","_spawnLocationMarkerName","_bambiPlayer","_accountData","_ExileLifeData","_tutorialProgress","_escapeEnabled","_direction","_position","_spawnAreaPosition","_spawnAreaRadius","_clanID","_clanName","_clanData","_clanGroup","_playerUID","_prisonerID","_criminalRecord","_gangStats","_hasAdminAccess","_sessionId","_escapeAccountdata","_devFriendlyMode","_devs","_parachuteNetID","_spawnType","_parachuteObject","_messages","_player"];
_sessionID = _this select 0;
_requestingPlayer = _this select 1;
_spawnLocationMarkerName = _this select 2;
_bambiPlayer = _this select 3;
_accountData = _this select 4;
_ExileLifeData = _this select 5;
_tutorialProgress = _this select 6;
_escapeEnabled = getNumber(configFile >> "CfgSettings" >> "Escape" >> "enableEscape") isEqualTo 1;
_direction = random 360;
if (_escapeEnabled) then
{
	_position = getArray(configFile >> "CfgSettings" >> "Escape" >> worldName >> "startingLocation");
	(uniformContainer _bambiPlayer) call ExileClient_util_containerCargo_clear;
	_bambiPlayer linkItem "ItemGPS";
}
else
{
	if ((count ExileSpawnZoneMarkerPositions) isEqualTo 0) then
	{
		_position = call ExileClient_util_world_findCoastPosition;
		if ((toLower worldName) isEqualTo "namalsk") then
		{
			while {(_position distance2D [76.4239, 107.141, 0]) < 100} do
			{
				_position = call ExileClient_util_world_findCoastPosition;
			};
		};
	}
	else
	{
		_spawnAreaPosition = getMarkerPos _spawnLocationMarkerName;
		_spawnAreaRadius = getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "spawnZoneRadius");
		_position = [_spawnAreaPosition, _spawnAreaRadius] call ExileClient_util_math_getRandomPositionInCircle;
		while {surfaceIsWater _position} do
		{
			_position = [_spawnAreaPosition, _spawnAreaRadius] call ExileClient_util_math_getRandomPositionInCircle;
		};
	};
};
_name = name _requestingPlayer;
_clanID = (_accountData select 3);
_clanName = "";
if !((typeName _clanID) isEqualTo "SCALAR") then
{
	_clanID = -1;
	_clanData = [];
}
else
{
	_clanData = missionNamespace getVariable [format ["ExileServer_clan_%1",_clanID],[]];
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
	[_bambiPlayer] joinSilent _clanGroup;
};
_playerUID = getPlayerUID _requestingPlayer;
_bambiPlayer setPosATL [_position select 0,_position select 1,0];
_bambiPlayer disableAI "FSM";
_bambiPlayer disableAI "MOVE";
_bambiPlayer disableAI "AUTOTARGET";
_bambiPlayer disableAI "TARGET";
_bambiPlayer disableAI "CHECKVISIBLE";
_bambiPlayer setDir _direction;
_bambiPlayer setName _name;
_bambiPlayer setVariable ["ExileMoney", 0, true]; 
_bambiPlayer setVariable ["ExileScore", (_accountData select 0)];
_bambiPlayer setVariable ["ExileKills", (_accountData select 1)];
_bambiPlayer setVariable ["ExileDeaths", (_accountData select 2)];
_bambiPlayer setVariable ["ExileClanID", _clanID];
_bambiPlayer setVariable ["ExileClanData", _clanData];
_bambiPlayer setVariable ["ExileHunger", 100];
_bambiPlayer setVariable ["ExileThirst", 100];
_bambiPlayer setVariable ["ExileTemperature", 37];
_bambiPlayer setVariable ["ExileWetness", 0];
_bambiPlayer setVariable ["ExileAlcohol", 0]; 
_bambiPlayer setVariable ["ExileName", _name]; 
_bambiPlayer setVariable ["ExileOwnerUID", _playerUID]; 
_bambiPlayer setVariable ["ExileIsBambi", !_escapeEnabled];
_bambiPlayer setVariable ["ExileXM8IsOnline", false, true];
_bambiPlayer setVariable ["ExileLocker", (_accountData select 4), true];
_bambiPlayer setVariable ['ExileLifeClientClass', (_ExileLifeData select 4)];
_bambiPlayer setVariable ["ExileLifeClientRank", (_ExileLifeData select 5)];
_bambiPlayer setVariable ['ExileLifeClientGang', (_ExileLifeData select 6),true];
_bambiPlayer setVariable ["ExileLifeSkill:Lockpick", [(_ExileLifeData select 7), (_ExileLifeData select 8)],true];
_bambiPlayer setVariable ["ExileLifeSkill:Strength", [(_ExileLifeData select 9), (_ExileLifeData select 10)],true];
_bambiPlayer setVariable ["ExileLifeSkill:Speed", [(_ExileLifeData select 11), (_ExileLifeData select 12)],true];
_bambiPlayer setVariable ["ExileLifeSkill:Heal", [(_ExileLifeData select 13), (_ExileLifeData select 14)],true];
_bambiPlayer setVariable ["ExileLifeSkill:Repair", [(_ExileLifeData select 15), (_ExileLifeData select 16)],true];
_bambiPlayer setVariable ["ExileLifeJobs:Current",[]];
_bambiPlayer setVariable ["ExileLifeJobs:Completed",(_ExileLifeData select 21)];
_bambiPlayer setVariable ["ExileLifeJobs:Failed",(_ExileLifeData select 22)];
_bambiPlayer setVariable ["ExileLifeCommittedCrimes",[]];
_bambiPlayer setVariable ["ExileLifePID", (_ExileLifeData select 18)];
_prisonerID = (_ExileLifeData select 18) call ExileLifeServer_system_session_createPrisonerID;
_bambiPlayer setVariable ["ExileLifePrisonerID", _prisonerID,true];
_bambiPlayer setVariable ["ExileLifeName",[(_ExileLifeData select 0),(_ExileLifeData select 1)], true];
_bambiPlayer setVariable ["ExileLifeCharacterInfo",[(_ExileLifeData select 0),(_ExileLifeData select 1),(_ExileLifeData select 2),(_ExileLifeData select 3)]];
_bambiPlayer setVariable ["ExileLifeVirtualGarage",format["loadPlayersVG:%1",(_ExileLifeData select 18)] call ExileServer_system_database_query_selectFull];
_bambiPlayer setVariable ["ExileLifeMessages", (_ExileLifeData select 24)];
_bambiPlayer setVariable ["ExileLifeExileDate", (_ExileLifeData select 25)];
_bambiPlayer setVariable ["ExileLifeBloodType", (_ExileLifeData select 26)];
_bambiPlayer setVariable ["ExileLifeGasMaskTimeLeft", (_ExileLifeData select 28)];
_bambiPlayer setVariable ["ExileLifeForcedConsuming", ""];
#define 25				25
#define 26 				26
#define 28 		28
_criminalRecord = format["getPrisonerRecord:%1",(_ExileLifeData select 18)] call ExileServer_system_database_query_selectSingle;
_bambiPlayer setVariable ["ExileLifeCriminalRecord",[_criminalRecord select 2, _criminalRecord select 3],true];
if !(isNil (_ExileLifeData select 6)) then
{
	_gangStats = [_sessionID,_playerUID,_bambiPlayer,(_ExileLifeData select 6)] call ExileLifeServer_object_player_network_GangStatsRequest;
	_bambiPlayer setVariable ["ExileLifeGangTax", (_gangStats select 1)];
	_bambiPlayer setVariable ["ExileLifeGangWage", (_gangStats select 2)];
}
else
{
	_bambiPlayer setVariable ["ExileLifeGangTax", 0];
	_bambiPlayer setVariable ["ExileLifeGangWage", 0];
};
_hasAdminAccess = format["hasAdminAccess:%1", _playerUID] call ExileServer_system_database_query_selectSingleField;
if (_hasAdminAccess) then
{
	[_sessionID, _bambiPlayer] call ExileLifeServer_admintools_system_security_requestAdminAccess;
};
missionNamespace setVariable [format["ExileLifeSessionUID%1", _playerUID], _sessionId];
missionNamespace setVariable [format["ExileLifeSessionPID%1", _prisonerID], _sessionId];
missionNamespace setVariable [format["ExileLifeSessionDBID%1", (_ExileLifeData select 18)], _sessionId];
if (_escapeEnabled) then
{
	_escapeAccountdata = format["getEscapeAccountStats:%1", getPlayerUID _requestingPlayer] call ExileServer_system_database_query_selectSingle;
	_bambiPlayer setVariable ["ExileWins", (_escapeAccountdata select 0)];
	_bambiPlayer setVariable ["ExileMatches", (_escapeAccountdata select 1)];
};
_devFriendlyMode = getNumber (configFile >> "CfgSettings" >> "ServerSettings" >> "devFriendyMode");
if (_devFriendlyMode isEqualTo 1) then
{
	_devs = getArray (configFile >> "CfgSettings" >> "ServerSettings" >> "devs");
	{
		if ((getPlayerUID _requestingPlayer) isEqualTo (_x select 0))exitWith
		{
			if ((name _requestingPlayer) isEqualTo (_x select 1))then
			{
				_bambiPlayer setVariable ["ExileMoney", 500000, true];
				_bambiPlayer setVariable ["ExileScore", 100000];
			};
		};
	}
	forEach _devs;
};
if (_tutorialProgress isEqualto "COMPLETED") then
{
	_bambiPlayer linkItem "ItemMap";
	_bambiPlayer linkItem "Exile_Item_XM8";
};
_parachuteNetID = "";
if ((getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "parachuteSpawning")) isEqualTo 1 && {!(_escapeEnabled)}) then
{
	_position set [2, getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "parachuteDropHeight")];
	if ((getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "haloJump")) isEqualTo 1) then
	{
		_bambiPlayer addBackpackGlobal "B_Parachute";
		_bambiPlayer setPosATL _position;
		_spawnType = 2;
	}
	else
	{
		_parachuteObject = createVehicle ["Steerable_Parachute_F", _position, [], 0, "CAN_COLLIDE"];
		_parachuteObject setDir _direction;
		_parachuteObject setPosATL _position;
		_parachuteObject enableSimulationGlobal true;
		_parachuteNetID = netId _parachuteObject;
		_spawnType = 1;
	};
}
else
{
	_spawnType = 0;
};
if (getNumber(missionConfigFile >> "CfgSimulation" >> "enableDynamicSimulation") isEqualTo 1) then
{
	if ((canTriggerDynamicSimulation _bambiPlayer) isEqualTo false) then
	{
		_bambiPlayer triggerDynamicSimulation true;
	  	_bambiPlayer enableDynamicSimulation true;
	};
};
_bambiPlayer addMPEventHandler ["MPKilled", {_this call ExileServer_object_player_event_onMpKilled}];
if !(_escapeEnabled) then
{
	_bambiPlayer call ExileServer_object_player_database_insert;
	_bambiPlayer call ExileServer_object_player_database_update;
	_messages = _player call ExileLifeServer_util_messaging_buildMessageList;
};
[
	_sessionID,
	"createPlayerResponse",
	[
		_bambiPlayer,
		_parachuteNetID,
		str (_accountData select 0),
		(_accountData select 1),
		(_accountData select 2),
		100,
		100,
		0,
		(getNumber (configFile >> "CfgSettings" >> "BambiSettings" >> "protectionDuration")) * 60, 
		_clanData,
		_spawnType,
		(_bambiPlayer getVariable ['ExileLifeClientClass', ""]),
		(_bambiPlayer getVariable ["ExileLifeClientRank", 0]),
		(_bambiPlayer getVariable ['ExileLifeClientGang', ""]),
		(_bambiPlayer getVariable ["ExileLifeSkill:Lockpick", [0, 0]]),
		(_bambiPlayer getVariable ["ExileLifeSkill:Strength", [0, 0]]),
		(_bambiPlayer getVariable ["ExileLifeSkill:Speed", [0, 0]]),
		(_bambiPlayer getVariable ["ExileLifeSkill:Heal", [0, 0]]),
		(_bambiPlayer getVariable ["ExileLifeSkill:Repair", [0, 0]]),
		(_bambiPlayer getVariable ["ExileLifeGangTax", 0]),
		(_bambiPlayer getVariable ["ExileLifeGangWage", 0]),
		BlackMarketInventory,
		ExileLifeJobBoard,
		(_bambiPlayer getVariable ["ExileLifeVirtualGarage",[]]),
		(_bambiPlayer getVariable ["ExileLifeJobs:Current",[]]),
		(_bambiPlayer getVariable ["ExileLifeJobs:Failed",[]]),
		(_bambiPlayer getVariable ["ExileLifeJobs:Completed",[]]),
		(_bambiPlayer getVariable ["ExileLifeCharacterInfo",[]]),
		_messages,
		(_bambiPlayer getVariable ["ExileLifeGasMaskTimeLeft", 0]),
		(_bambiPlayer getVariable ["ExileLifeBloodType", ""])
	]
]
call ExileServer_system_network_send_to;
if (_escapeEnabled) then
{
	[
		_sessionID,
		"escapeVariables",
		[
			(_escapeAccountdata select 0),
			(_escapeAccountdata select 1)
		]
	]
	call ExileServer_system_network_send_to;
};
[_sessionID, _bambiPlayer] call ExileServer_system_session_update;
true
