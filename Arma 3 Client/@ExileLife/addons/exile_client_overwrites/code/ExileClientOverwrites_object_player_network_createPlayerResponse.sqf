/**
                    * ExileClientOverwrites_object_player_network_createPlayerResponse
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

                    private["_player","_chuteNetID","_spawnType","_chute","_gangArmband"];
_player = _this select 0;
_chuteNetID = _this select 1;
_spawnType = _this select 10;
if !(_chuteNetID isEqualTo "") then
{
	_chute = objectFromNetId _chuteNetID;
}
else
{
	_chute = objNull;
};
if !(isNull _chute) then
{
	_player disableCollisionWith _chute;
};
_player call ExileClient_object_player_initialize;
ExileClientPlayerIsSpawned = true;
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
switch (_spawnType) do
{
	case 0:
	{
	};
	case 1:
	{
		player action ["GetinDriver", _chute];
		["InfoTitleAndText", ["Watch your landing speed!", "Going faster than 20km/h might kill you."]] call ExileClient_gui_toaster_addTemplateToast;
		ExileJobParachuteFix = [0.25, ExileClient_object_player_parachuteFix, [], true] call ExileClient_system_thread_addtask;
	};
	case 2:
	{
		["InfoTitleAndText", ["Watch your landing speed!", "Going faster than 20km/h might kill you."]] call ExileClient_gui_toaster_addTemplateToast;
		player switchMove "";
		player playMoveNow "HaloFreeFall_non"; 
		player playMoveNow "HaloFreeFall_non";
		player playMoveNow "HaloFreeFall_non";
		player setVelocity [(sin (getDir player)) * 50, (cos (getDir player)) * 50, -5];
		ExileJobParachuteFix = [0.25, ExileClient_object_player_parachuteFix, [], true] call ExileClient_system_thread_addtask;
	};
};
call ExileClient_object_player_initStamina;
false call ExileClient_gui_hud_showSurvivalInfo;
call ExileClient_system_rating_balance;
ExileClientPlayerScore = parseNumber (_this select 2);
ExileClientPlayerKills = _this select 3;
ExileClientPlayerDeaths = _this select 4;
(_this select 9) call ExileClient_system_clan_network_updateClanInfoFull;
if!((_this select 9) isEqualTo [])then
{
	if!(isNull ((_this select 9) select 5))then
	{
		ExileClientPartyID = netid ((_this select 9) select 5);
	};
};
if !(ExileClientPartyID isEqualTo -1) then
{
	[player] joinSilent (groupFromNetId ExileClientPartyID);
};
if !(isNull ExileClientLastDiedPlayerObject) then
{
	[ExileClientLastDiedPlayerObject] joinSilent (createGroup independent);
};
if !(getText(missionConfigFile >> "Header" >> "gameType") isEqualTo "Escape") then
{
	(_this select 8) call ExileClient_object_player_bambiStateBegin;
};
ExileLifeClientClass = _this select 11;
ExileLifeClientRank = _this select 12;
ExileLifeClientGang = _this select 13;
ExileLifeClientSkillLockpick = _this select 14;
ExileLifeClientSkillStrength = _this select 15;
ExileLifeClientSkillSpeed = _this select 16;
ExileLifeClientSkillHeal = _this select 17;
ExileLifeClientSkillRepair = _this select 18;
ExileLifeClientGangTax = _this select 19;
ExileLifeClientGangWage = _this select 20;
ExileLifeBlackMarketInventory = _this select 21;
ExileLifeJobBoard = _this select 22;
ExileLifeVirtualGarage = _this select 23;
ExileLifeCurrentJob = _this select 24;
ExileLifeFailedJobs = _this select 25;
ExileLifeCompletedJobs = _this select 26;
ExileLifeCharacterInfo = _this select 27;
ExileLifeMessages = _this select 28;
ExileLifePlayerBloodType = _this select 30;
ExileLifeClientRockHit = 0;
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
if(player getVariable ["ExileLifeClient:Guard",false]) then {
	ExileLifeGuard = True;
}else{
	if (!(isNil 'ExileLifeClientGang') && !(ExileLifeClientGang isEqualTo "") && !(ExileLifeClientGang isEqualTo "Rogue")) then
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
