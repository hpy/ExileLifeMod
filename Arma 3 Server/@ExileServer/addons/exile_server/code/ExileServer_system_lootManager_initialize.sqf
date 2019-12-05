/**
                    * ExileServer_system_lootManager_initialize
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

                    private["_config","_lootTableName","_lootTable","_itemGroupName","_items"];
ExileServerBuildingNetIdsWithLoot = [];
_config = [configFile >> "CfgExileLootServer", configFile >> "CfgExileEscapeLootServer"] select (getNumber(configFile >> "CfgSettings" >> "Escape" >> "enableEscape") isEqualTo 1);
{
	_lootTableName = configName _x;
	_lootTable = getArray (_config >> "LootTables" >> _lootTableName);
	missionNamespace setVariable ["ExileCachedLootTable" + _lootTableName, _lootTable];
}
forEach (configProperties [_config >> "LootTables"]);
{
	_itemGroupName = configName _x;
	_items = getArray (_config>> "ItemGroups" >> _itemGroupName);
	missionNamespace setVariable ["ExileCachedLootItemGroup" + _itemGroupName, _items];
}
forEach (configProperties [_config >> "ItemGroups"]);
true
