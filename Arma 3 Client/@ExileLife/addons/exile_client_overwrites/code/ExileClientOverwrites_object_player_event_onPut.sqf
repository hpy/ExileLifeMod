/**
                    * ExileClientOverwrites_object_player_event_onPut
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

                    private["_unit","_container","_itemClassName","_itemType","_itemTypeMainCategory","_itemTypeSecondaryCategory"];
_unit = _this select 0;
_container = _this select 1;
_itemClassName = _this select 2;
_itemType = [_itemClassName] call BIS_fnc_itemType;
_itemTypeMainCategory = _itemType select 0;
_itemTypeSecondaryCategory = _itemType select 1;
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
			default {  
						[ExileClientCurrentInventoryContainer,_unit,_itemClassName] call ExileLifeClient_util_containerCargo_takeFromContainer; 
					}; 
		};
	};
}
catch
{
	[_itemClassName,_exception] call ExileLifeClient_object_chemlab_addToBench;
};
true