/**
                    * ExilelifeServer_admintools_system_security_removeCode
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

                    private["_adminToolsVarsToBeRemoved","_otherVars","_threads","_playerEH","_displayEH","_function","_actVar"];
if (isServer) exitWith {};
disableSerialization;
_adminToolsVarsToBeRemoved = [];
_otherVars =
[
	"ExileLifeTools_DeletePressed","ExileLifeTools_DeleteMePlease","ExileLifeTools_LoginScreenOpen","ExileLifeTools_MainOpen","ExileLifeTools_spawn_option","ExileLifeTools_bags","ExileLifeTools_mags","ExileLifeTools_allWeapons","ExileLifeTools_weapons","ExileLifeTools_items","ExileLifeTools_clothing","ExileLifeTools_attachments","ExileLifeTools_vehicles","ExileLifeTools_ExileLifeMags","ExileLifeTools_goggles","ExileLifeTools_vehicles_ExileLife","ExileLifeTools_PlayerLoggedIn","ExileLifeTools_Topbar","ExileLifeTools_ToggledArray","ExileLifeTools_VehicleDropdownOption","ExileLifeTools_NotificationOrb","ExileLifeTools_PermissionLevel","ExileLifeTools_MyPermissions","ExileLifeTools_FunctionNames","ExileLifeTools_Categories","ExileLifeTools_IDCs_ServerAdministration","ExileLifeTools_IDCs_TargetAdministration","ExileLifeTools_AIESP","ExileLifeTools_HouseESP","ExileLifeTools_LootESP","ExileLifeTools_PlayerESP","ExileLifeTools_VehicleESP","ExileLifeTools_Invisibility_Enabled","ExileLifeTools_Jump_Enabled","ExileLifeTools_Map_TP_Enabled","ExileLifeTools_No_Recoil_Enabled","ExileLifeTools_Vehicle_GodMode_Enabled","ExileLifeTools_Server_Administration_Enabled","ExileLifeTools_Target_Administration_Enabled","ExileLifeTools_Map_Icons_Dead_Players_Enabled","ExileLifeTools_Map_Icons_House_Enabled","ExileLifeTools_House_ESP_Enabled","ExileLifeTools_Map_Icons_Players_Enabled","ExileLifeTools_AI_ESP_Enabled","ExileLifeTools_Disable_Fatigue_Enabled","ExileLifeTools_Map_Icons_Vehicles_Enabled","ExileLifeTools_Map_Icons_AI_Enabled","ExileLifeTools_Infinite_Ammo_Enabled","ExileLifeTools_GodMode_Enabled","ExileLifeTools_Vehicle_ESP_Enabled","ExileLifeTools_Fast_Fire_Enabled","ExileLifeTools_Forward_TP_Enabled","ExileLifeTools_Player_ESP_Enabled","ExileLifeTools_Loot_ESP_Enabled","ExileLifeTools_List_Toggles","ExileLifeTools_List_Spawn","ExileLifeTools_List_Self","ExileLifeTools_List_Target"
];
_threads =
[
	"ExileLifeTools_InfiniteAmmo_Thread","ExileLifeTools_GodMode_Thread","ExileLifeTools_MapIcons_Vehicles_Thread","ExileLifeTools_MapIcons_AI_Thread","ExileLifeTools_MapIcons_Players_Thread","ExileLifeTools_MapIcons_DeadPlayers_Thread","ExileLifeTools_MapIcons_Houses_Thread"
];
_playerEH =
[
	["fired","ExileLifeTools_FiredEH"]
];
_displayEH =
[
	["keyUp","ExileLifeTools_Login_KeyUp", (findDisplay 46)],
	["keyDown","ExileLifeTools_Main_KeyUp", (findDisplay 46)],
	["keyDown","ExileLifeTools_Main_KeyDown", (findDisplay 46)],
	["keyDown","ExileLifeTools_MapTP_KeyDown", (findDisplay 14)]
];
if (!isNil "ExileLifeTools_List_Toggles") then
{
	{
		_function = _x select 0;
		if ((_function find "Spacer") isEqualTo -1) then
		{
			_actVar = format["ExileLifeTools_%1",(_x select 2) select 0];
			if (missionNameSpace getVariable [_actVar,false]) then
			{
				[true] call missionNameSpace getVariable [format["ExileLifeTools_Toggles_%1",_function],{}];
			};
		};
	}
	forEach (ExileLifeTools_List_Toggles select 2);
};
if (!isNil "ExileLifeTools_MainOpen") then
{
    call ExilelifeTools_gui_main_onUnload;
    ExileLifeTools_Topbar cutText ['','PLAIN'];
}
else
{
    closeDialog 0;
};
{
	if !(isNil _x) then
	{
		missionNameSpace setVariable [_x,nil];
	};
}
forEach (_adminToolsVarsToBeRemoved + _otherVars);
{
	if !(isNil (_x select 1)) then
	{
		if !((missionNameSpace getVariable [_x select 1,-1]) isEqualTo -1) then
		{
			player removeEventHandler [_x select 0,missionNameSpace getVariable [_x select 1,nil]];
		};
		missionNameSpace setVariable [_x select 1,nil];
	};
}
forEach _playerEH;
{
	if !(isNil (_x select 1)) then
	{
		if !((missionNameSpace getVariable [_x select 1,-1]) isEqualTo -1) then
		{
			(_x select 2) displayRemoveEventHandler [_x select 0,missionNameSpace getVariable [_x select 1,nil]];
		};
		missionNameSpace setVariable [_x select 1,nil];
	};
}
forEach _displayEH;
{
	if !(isNil _x) then
	{
		if !((missionNameSpace getVariable [_x,-1]) isEqualTo -1) then
		{
			[missionNameSpace getVariable [_x,-1]] call ExileClient_system_thread_removeTask;
			missionNameSpace setVariable [_x,nil];
		};
	};
}
forEach _threads;