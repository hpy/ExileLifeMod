/**
                    * ExileClientOverwrites_object_player_network_loadPlayerResponse
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

                    private["_playerNetID","_player","_scoreString","_kills","_deaths","_hunger","_thirst","_alcohol","_clanData","_temperature","_wetness","_gangArmband"];
_playerNetID = _this select 0;
_player = objectFromNetId _playerNetID;
_scoreString = _this select 1;
_kills = _this select 2;
_deaths = _this select 3;
_hunger = _this select 4;
_thirst = _this select 5;
_alcohol = _this select 6;
_clanData = _this select 7;
_temperature = _this select 8;
_wetness = _this select 9;
ExileLifeClientClass = _this select 10;
ExileLifeClientRank = _this select 11;
ExileLifeClientGang = _this select 12;
ExileLifeClientSkillLockpick = _this select 13;
ExileLifeClientSkillStrength = _this select 14;
ExileLifeClientSkillSpeed = _this select 15;
ExileLifeClientSkillHeal = _this select 16;
ExileLifeClientSkillRepair = _this select 17;
ExileLifeClientGangTax = _this select 18;
ExileLifeClientGangWage = _this select 19;
ExileLifeBlackMarketInventory = _this select 20;
ExileLifeCurrentJob = _this select 21;
ExileLifeFailedJobs = _this select 22;
ExileLifeCompletedJobs = _this select 23;
ExileLifeJobBoard = _this select 24;
ExileLifeVirtualGarage = _this select 25;
ExileLifeCharacterInfo = _this select 26;
ExileLifeMessages = _this select 27;
ExileLifePlayerBloodType = _this select 29;
_player call ExileClient_object_player_initialize;
ExileLifeClientPlayerDamage = player call ExileLifeClient_util_health_getAverageHealth;
ExileClientPlayerAttributes =
[
	(1 - ExileLifeClientPlayerDamage) * 100,
	(1 - getFatigue player) * 100,
	_hunger,
	_thirst,
	_alcohol,
	_temperature,
	_wetness,
	_this select 28
];
ExileClientPlayerAttributesASecondAgo =
[
	ExileClientPlayerAttributes select 0,
	ExileClientPlayerAttributes select 1,
	ExileClientPlayerAttributes select 2,
	ExileClientPlayerAttributes select 3,
	ExileClientPlayerAttributes select 4,
	ExileClientPlayerAttributes select 5,
	ExileClientPlayerAttributes select 6
];
ExileClientPlayerIsSpawned = true;
call ExileClient_object_player_initStamina;
call ExileClient_system_rating_balance;
ExileClientPlayerScore = parseNumber _scoreString;
ExileClientPlayerKills = _kills;
ExileClientPlayerDeaths = _deaths;
_clanData call ExileClient_system_clan_network_updateClanInfoFull;
if!(_clanData isEqualTo [])then
{
	if!(isNull (_clanData select 5))then
	{
		ExileClientPartyID = netid (_clanData select 5);
	};
};
ExileClientPlayerIsBambi = false;
ExileClientPlayerBambiStateExpiresAt = 0;
ExileLifeClientRockHit = 0;
if !(ExileClientPartyID isEqualTo -1) then
{
	[player] joinSilent (groupFromNetId ExileClientPartyID);
};
call ExileLifeClient_system_process_removeVar;
false call ExileClient_gui_hud_showSurvivalInfo;
[] call ExileLifeClient_object_player_skills_event_onLoad;
if (profileNameSpace getVariable ["ExileLifeMapMarkers", false]) then
{
	[["Fruit","Mining","Artefacts","Drugs","Refinery","BlackMarket"]] call ExileLifeClient_system_world_loadResources;
}
else
{
	[[]] call ExileLifeClient_system_world_loadResources;
};
if (profileNameSpace getVariable ["ExileLifePaymentMsgs", true]) then
{
	ExileLifeClientPaymentMSGS = true;
}
else
{
	ExileLifeClientPaymentMSGS = false;
};
if !(isNil "ExileLifeSwitchCharacterTemp") then
{
	deleteVehicle ExileLifeSwitchCharacterTemp;
};
if !(isNil "ExileLifeClientSwitchCharacter") then
{
	deleteVehicle ExileLifeClientSwitchCharacter;
};
call ExileLifeClient_util_gang_countOnline;
if(player getVariable ["ExileLifeClient:Guard",false] || ExileLifeClientGang == "Guard") then {
	ExileLifeGuard = True;
}else{
	if(ExileLifeClientGang isEqualTo "")then{
		ExileLifeClientGang = "Rogue";
	};
	if (!(isNil 'ExileLifeClientGang') && !(ExileLifeClientGang isEqualTo "Rogue")) then
	{
		_gangArmband = format ["ExileLife_Clothing_%1_Armband",ExileLifeClientGang];
		if !((hmd player) isEqualTo _gangArmband) then
		{
			player unlinkItem hmd player;
			player linkItem _gangArmband;
		};
	};
};
true
