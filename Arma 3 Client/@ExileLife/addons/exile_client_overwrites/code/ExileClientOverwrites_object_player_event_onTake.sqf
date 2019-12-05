/**
                    * ExileClientOverwrites_object_player_event_onTake
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

                    private["_unit","_container","_itemClassName","_itemType","_itemTypeMainCategory","_itemTypeSecondaryCategory","_gangArmband","_removed"];
_unit = _this select 0;
_container = _this select 1;
_itemClassName = _this select 2;
_itemType = [_itemClassName] call BIS_fnc_itemType;
_itemTypeMainCategory = _itemType select 0;
_itemTypeSecondaryCategory = _itemType select 1;
if (_itemTypeSecondaryCategory isEqualTo "NVGoggles") then
{
	if !(player getVariable ["ExileLifeClient:Guard",false]) then
	{
		["ErrorTitleAndText", ["Denied!", "You cannot use these!"]] call ExileClient_gui_toaster_addTemplateToast;
		player unassignitem _itemClassName;
		player removeitem _itemClassName;
	};
};
if (ExileClientPlayerIsBambi) then
{
	if (_itemTypeMainCategory isEqualTo "Weapon") then
	{
		call ExileClient_object_player_bambiStateEnd;
	};
};
if (isClass(configFile>>"cfgWeapons">>_itemClassName>>"Melee")) then
{
	if (getNumber (configFile>>"cfgWeapons">>_itemClassName>>"Melee">>"unlimitedAmmo")==1) then
	{
		if (!([player, "ExileLife_Melee_Magazine"] call ExileLifeClient_util_playercargo_contains)||(player ammo secondaryWeapon player < 50)) then 
		{
			[player,"ExileLife_Magazine_Melee"] call ExileLifeClient_util_playerCargo_addOrDrop;
		};
	};
};
if ((_container getVariable ["ExileIsLocked",1]) isEqualTo -1)then
{
	Exiled = format
	[
		"Me %1(%2) tried to open a locked storage (%3 at (%4)%5) by glitching. :( and i got cought :((",
		profileName,getPlayerUID player,typeOf _container,mapGridPosition _container,getPosATL _container
	];
	publicVariableServer "Exiled";
};
if ("ArmBand" in (_itemClassName splitString "_")) then
{
	_gangArmband = format ["ExileLife_Clothing_%1_ArmBand",ExileLifeClientGang];
	if !(_itemClassName isEqualTo _gangArmband) then
	{
		systemchat "You cannot don enemy tags!";
		player unlinkItem hmd player;
		if !([_container, _gangArmband] call ExileClient_util_containerCargo_remove) then
		{
			_removed = [player, _gangArmband] call ExileLifeClient_util_playerCargo_remove;
		};
		player linkItem _gangArmband;
		[player,_itemClassName] call ExileLifeClient_util_playerCargo_addOrDrop;
	};
};
try
{
	if (_container iskindof "exilelife_methlab_rv") then 
	{
		switch (_itemClassName) do 
		{ 
			case "ExileLife_Item_Beaker_Clean" : {  throw 0; }; 
			case "ExileLife_Item_Beaker_Dirty" : {  throw 1; }; 
			case "ExileLife_Item_Beaker_Acetone_Clean" : {  throw 2; }; 
			case "ExileLife_Item_Beaker_Phosphoricacid_Clean" : {  throw 3; }; 
			case "ExileLife_Item_Beaker_Hydrochloricacid_Clean" : {  throw 4; }; 
			case "ExileLife_Item_Beaker_Acetone_Dirty" : {  throw 5; }; 
			case "ExileLife_Item_Beaker_Phosphoricacid_Dirty" : {  throw 6; }; 
			case "ExileLife_Item_Beaker_Hydrochloricacid_Dirty" : {  throw 7; }; 		
			case "Exile_Item_Vishpirin" : {  throw 8; }; 
			case "ExileLife_Item_Filter" : {  throw 9; }; 
			case "ExileLife_Item_OvenCleaner" : {  throw 11; }; 
			case "ExileLife_Item_GasCooker" : {  throw 12; }; 
			default {}; 
		};
	};
}
catch
{
	[_itemClassName,_exception] call ExileLifeClient_object_chemlab_removeFromBench;
};
true
