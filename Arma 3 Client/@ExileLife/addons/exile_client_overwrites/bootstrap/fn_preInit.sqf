/**
                    * Pre-Initialization
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

                    private ['_code', '_function', '_file'];

                    {
                        _code = '';
                        _function = _x select 0;
                        _file = _x select 1;

                        _code = compileFinal (preprocessFileLineNumbers _file);

                        missionNamespace setVariable [_function, _code];
                    }
                    forEach
                    [
                    	['ExileClient_action_execute', 'exile_client_overwrites\code\ExileClientOverwrites_action_execute.sqf'],
	['ExileClient_action_event_onKeyDown', 'exile_client_overwrites\code\ExileClientOverwrites_action_event_onKeyDown.sqf'],
	['ExileClient_action_hotwireVehicle_completed', 'exile_client_overwrites\code\ExileClientOverwrites_action_hotwireVehicle_completed.sqf'],
	['ExileClient_action_hotwireVehicle_condition', 'exile_client_overwrites\code\ExileClientOverwrites_action_hotwireVehicle_condition.sqf'],
	['ExileClient_action_hotwireVehicle_failed', 'exile_client_overwrites\code\ExileClientOverwrites_action_hotwireVehicle_failed.sqf'],
	['ExileClient_action_repairVehicle_completed', 'exile_client_overwrites\code\ExileClientOverwrites_action_repairVehicle_completed.sqf'],
	['ExileClient_action_repairVehicle_condition', 'exile_client_overwrites\code\ExileClientOverwrites_action_repairVehicle_condition.sqf'],
	['ExileClient_construction_beginNewObject', 'exile_client_overwrites\code\ExileClientOverwrites_construction_beginNewObject.sqf'],
	['ExileClient_construction_handleAbort', 'exile_client_overwrites\code\ExileClientOverwrites_construction_handleAbort.sqf'],
	['ExileClient_construction_thread', 'exile_client_overwrites\code\ExileClientOverwrites_construction_thread.sqf'],
	['ExileClient_gui_baguette_show', 'exile_client_overwrites\code\ExileClientOverwrites_gui_baguette_show.sqf'],
	['ExileClient_gui_crafting_show', 'exile_client_overwrites\code\ExileClientOverwrites_gui_crafting_show.sqf'],
	['ExileClient_gui_escape_abort', 'exile_client_overwrites\code\ExileClientOverwrites_gui_escape_abort.sqf'],
	['ExileClient_gui_escape_respawn', 'exile_client_overwrites\code\ExileClientOverwrites_gui_escape_respawn.sqf'],
	['ExileClient_gui_escape_suicide', 'exile_client_overwrites\code\ExileClientOverwrites_gui_escape_suicide.sqf'],
	['ExileClient_gui_hud_initialize', 'exile_client_overwrites\code\ExileClientOverwrites_gui_hud_initialize.sqf'],
	['ExileClient_gui_hud_renderWeaponPanel', 'exile_client_overwrites\code\ExileClientOverwrites_gui_hud_renderWeaponPanel.sqf'],
	['ExileClient_gui_hud_showSurvivalInfo', 'exile_client_overwrites\code\ExileClientOverwrites_gui_hud_showSurvivalInfo.sqf'],
	['ExileClient_gui_hud_toggle', 'exile_client_overwrites\code\ExileClientOverwrites_gui_hud_toggle.sqf'],
	['ExileClient_gui_hud_event_onAction', 'exile_client_overwrites\code\ExileClientOverwrites_gui_hud_event_onAction.sqf'],
	['ExileClient_gui_hud_event_onDraw3d', 'exile_client_overwrites\code\ExileClientOverwrites_gui_hud_event_onDraw3d.sqf'],
	['ExileClient_gui_hud_event_onKeyDown', 'exile_client_overwrites\code\ExileClientOverwrites_gui_hud_event_onKeyDown.sqf'],
	['ExileClient_gui_hud_event_onKeyUp', 'exile_client_overwrites\code\ExileClientOverwrites_gui_hud_event_onKeyUp.sqf'],
	['ExileClient_gui_hud_thread_update', 'exile_client_overwrites\code\ExileClientOverwrites_gui_hud_thread_update.sqf'],
	['ExileClient_gui_interactionMenu_hook', 'exile_client_overwrites\code\ExileClientOverwrites_gui_interactionMenu_hook.sqf'],
	['ExileClient_gui_interactionMenu_unhook', 'exile_client_overwrites\code\ExileClientOverwrites_gui_interactionMenu_unhook.sqf'],
	['ExileClient_gui_interactionMenu_update', 'exile_client_overwrites\code\ExileClientOverwrites_gui_interactionMenu_update.sqf'],
	['ExileClient_gui_inventory_event_onLoad', 'exile_client_overwrites\code\ExileClientOverwrites_gui_inventory_event_onLoad.sqf'],
	['ExileClient_gui_inventory_event_onSlotDoubleClick', 'exile_client_overwrites\code\ExileClientOverwrites_gui_inventory_event_onSlotDoubleClick.sqf'],
	['ExileClient_gui_itemDetails_show', 'exile_client_overwrites\code\ExileClientOverwrites_gui_itemDetails_show.sqf'],
	['ExileClient_gui_itemDetails_event_onCraftingRecipeDoubleClick', 'exile_client_overwrites\code\ExileClientOverwrites_gui_itemDetails_event_onCraftingRecipeDoubleClick.sqf'],
	['ExileClient_gui_itemDetails_event_onTabButtonClicked', 'exile_client_overwrites\code\ExileClientOverwrites_gui_itemDetails_event_onTabButtonClicked.sqf'],
	['ExileClient_gui_selectSpawnLocation_show', 'exile_client_overwrites\code\ExileClientOverwrites_gui_selectSpawnLocation_show.sqf'],
	['ExileClient_gui_toaster_addTemplateToast', 'exile_client_overwrites\code\ExileClientOverwrites_gui_toaster_addTemplateToast.sqf'],
	['ExileClient_gui_toaster_addToast', 'exile_client_overwrites\code\ExileClientOverwrites_gui_toaster_addToast.sqf'],
	['ExileClient_gui_toaster_pushToBottom', 'exile_client_overwrites\code\ExileClientOverwrites_gui_toaster_pushToBottom.sqf'],
	['ExileClient_gui_traderDialog_updateStoreListBox', 'exile_client_overwrites\code\ExileClientOverwrites_gui_traderDialog_updateStoreListBox.sqf'],
	['ExileClient_gui_virtualGarageDialog_show', 'exile_client_overwrites\code\ExileClientOverwrites_gui_virtualGarageDialog_show.sqf'],
	['ExileClient_gui_virtualGarageDialog_updateVehicle', 'exile_client_overwrites\code\ExileClientOverwrites_gui_virtualGarageDialog_updateVehicle.sqf'],
	['ExileClient_gui_virtualGarageDialog_event_onConfirmButtonClicked', 'exile_client_overwrites\code\ExileClientOverwrites_gui_virtualGarageDialog_event_onConfirmButtonClicked.sqf'],
	['ExileClient_gui_virtualGarageDialog_event_onLocationChanged', 'exile_client_overwrites\code\ExileClientOverwrites_gui_virtualGarageDialog_event_onLocationChanged.sqf'],
	['ExileClient_gui_virtualGarageDialog_event_onUnload', 'exile_client_overwrites\code\ExileClientOverwrites_gui_virtualGarageDialog_event_onUnload.sqf'],
	['ExileClient_gui_virtualGarageDialog_event_onVehicleChanged', 'exile_client_overwrites\code\ExileClientOverwrites_gui_virtualGarageDialog_event_onVehicleChanged.sqf'],
	['ExileClient_gui_xm8_show', 'exile_client_overwrites\code\ExileClientOverwrites_gui_xm8_show.sqf'],
	['ExileClient_gui_xm8_showTerritorySlide', 'exile_client_overwrites\code\ExileClientOverwrites_gui_xm8_showTerritorySlide.sqf'],
	['ExileClient_gui_xm8_slide', 'exile_client_overwrites\code\ExileClientOverwrites_gui_xm8_slide.sqf'],
	['ExileClient_gui_xm8_togglePower', 'exile_client_overwrites\code\ExileClientOverwrites_gui_xm8_togglePower.sqf'],
	['ExileClient_gui_xm8_slide_extraApps_onClose', 'exile_client_overwrites\code\ExileClientOverwrites_gui_xm8_slide_extraApps_onClose.sqf'],
	['ExileClient_gui_xm8_slide_extraApps_onOpen', 'exile_client_overwrites\code\ExileClientOverwrites_gui_xm8_slide_extraApps_onOpen.sqf'],
	['ExileClient_gui_xm8_slide_extraApps_showApp', 'exile_client_overwrites\code\ExileClientOverwrites_gui_xm8_slide_extraApps_showApp.sqf'],
	['ExileClient_object_construction_move', 'exile_client_overwrites\code\ExileClientOverwrites_object_construction_move.sqf'],
	['ExileClient_object_handcuffs_breakfree', 'exile_client_overwrites\code\ExileClientOverwrites_object_handcuffs_breakfree.sqf'],
	['ExileClient_object_handcuffs_searchGear', 'exile_client_overwrites\code\ExileClientOverwrites_object_handcuffs_searchGear.sqf'],
	['ExileClient_object_handcuffs_use', 'exile_client_overwrites\code\ExileClientOverwrites_object_handcuffs_use.sqf'],
	['ExileClient_object_handcuffs_network_freeRequest', 'exile_client_overwrites\code\ExileClientOverwrites_object_handcuffs_network_freeRequest.sqf'],
	['ExileClient_object_item_construct', 'exile_client_overwrites\code\ExileClientOverwrites_object_item_construct.sqf'],
	['ExileClient_object_item_consume', 'exile_client_overwrites\code\ExileClientOverwrites_object_item_consume.sqf'],
	['ExileClient_object_item_use', 'exile_client_overwrites\code\ExileClientOverwrites_object_item_use.sqf'],
	['ExileClient_object_lock_scan', 'exile_client_overwrites\code\ExileClientOverwrites_object_lock_scan.sqf'],
	['ExileClient_object_player_identifyBody', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_identifyBody.sqf'],
	['ExileClient_object_player_initialize', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_initialize.sqf'],
	['ExileClient_object_player_save', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_save.sqf'],
	['ExileClient_object_player_death_forceRespawn', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_death_forceRespawn.sqf'],
	['ExileClient_object_player_death_startBleedingOut', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_death_startBleedingOut.sqf'],
	['ExileClient_object_player_event_hook', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_event_hook.sqf'],
	['ExileClient_object_player_event_onFired', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_event_onFired.sqf'],
	['ExileClient_object_player_event_onFIredNear', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_event_onFIredNear.sqf'],
	['ExileClient_object_player_event_onHandleDamage', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_event_onHandleDamage.sqf'],
	['ExileClient_object_player_event_onHit', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_event_onHit.sqf'],
	['ExileClient_object_player_event_onKilled', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_event_onKilled.sqf'],
	['ExileClient_object_player_event_onLeaveSafezone', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_event_onLeaveSafezone.sqf'],
	['ExileClient_object_player_event_onPlayerKilled', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_event_onPlayerKilled.sqf'],
	['ExileClient_object_player_event_onPut', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_event_onPut.sqf'],
	['ExileClient_object_player_event_onTake', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_event_onTake.sqf'],
	['ExileClient_object_player_event_unhook', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_event_unhook.sqf'],
	['ExileClient_object_player_network_createPlayerResponse', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_network_createPlayerResponse.sqf'],
	['ExileClient_object_player_network_loadPlayerResponse', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_network_loadPlayerResponse.sqf'],
	['ExileClient_object_player_network_updateStatsRequest', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_network_updateStatsRequest.sqf'],
	['ExileClient_object_player_stats_update', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_stats_update.sqf'],
	['ExileClient_object_player_stats_updateTemperature', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_stats_updateTemperature.sqf'],
	['ExileClient_object_player_thread_bleedToDeath', 'exile_client_overwrites\code\ExileClientOverwrites_object_player_thread_bleedToDeath.sqf'],
	['ExileClient_system_music_initialize', 'exile_client_overwrites\code\ExileClientOverwrites_system_music_initialize.sqf'],
	['ExileClient_system_music_earplugs_toggle', 'exile_client_overwrites\code\ExileClientOverwrites_system_music_earplugs_toggle.sqf'],
	['ExileClient_system_network_dispatchIncomingMessage', 'exile_client_overwrites\code\ExileClientOverwrites_system_network_dispatchIncomingMessage.sqf'],
	['ExileClient_system_process_postInit', 'exile_client_overwrites\code\ExileClientOverwrites_system_process_postInit.sqf'],
	['ExileClient_system_process_preInit', 'exile_client_overwrites\code\ExileClientOverwrites_system_process_preInit.sqf'],
	['ExileClient_system_radiation_thread_update', 'exile_client_overwrites\code\ExileClientOverwrites_system_radiation_thread_update.sqf'],
	['ExileClient_system_territory_rebuildTerritoryLocations', 'exile_client_overwrites\code\ExileClientOverwrites_system_territory_rebuildTerritoryLocations.sqf'],
	['ExileClient_system_territory_network_purchaseTerritoryResponse', 'exile_client_overwrites\code\ExileClientOverwrites_system_territory_network_purchaseTerritoryResponse.sqf'],
	['ExileClient_system_thread_addTask', 'exile_client_overwrites\code\ExileClientOverwrites_system_thread_addTask.sqf'],
	['ExileClient_system_trading_network_purchaseItemResponse', 'exile_client_overwrites\code\ExileClientOverwrites_system_trading_network_purchaseItemResponse.sqf'],
	['ExileClient_system_trading_network_wasteDumpResponse', 'exile_client_overwrites\code\ExileClientOverwrites_system_trading_network_wasteDumpResponse.sqf'],
	['ExileClient_util_containerCargo_list', 'exile_client_overwrites\code\ExileClientOverwrites_util_containerCargo_list.sqf'],
	['ExileClient_util_containerCargo_remove', 'exile_client_overwrites\code\ExileClientOverwrites_util_containerCargo_remove.sqf'],
	['ExileClient_util_gear_calculateTotalPrice', 'exile_client_overwrites\code\ExileClientOverwrites_util_gear_calculateTotalPrice.sqf'],
	['ExileClient_util_gear_calculateTotalSellPrice', 'exile_client_overwrites\code\ExileClientOverwrites_util_gear_calculateTotalSellPrice.sqf'],
	['ExileClient_util_inventory_canExchangeItems', 'exile_client_overwrites\code\ExileClientOverwrites_util_inventory_canExchangeItems.sqf'],
	['ExileClient_util_inventory_contains', 'exile_client_overwrites\code\ExileClientOverwrites_util_inventory_contains.sqf'],
	['ExileClient_util_inventory_getItemsCarried', 'exile_client_overwrites\code\ExileClientOverwrites_util_inventory_getItemsCarried.sqf'],
	['ExileClient_util_inventory_replaceMagazine', 'exile_client_overwrites\code\ExileClientOverwrites_util_inventory_replaceMagazine.sqf'],
	['ExileClient_util_item_getMainStats', 'exile_client_overwrites\code\ExileClientOverwrites_util_item_getMainStats.sqf'],
	['ExileClient_util_playerCargo_add', 'exile_client_overwrites\code\ExileClientOverwrites_util_playerCargo_add.sqf'],
	['ExileClient_util_playerCargo_canAdd', 'exile_client_overwrites\code\ExileClientOverwrites_util_playerCargo_canAdd.sqf'],
	['ExileClient_util_playerCargo_remove', 'exile_client_overwrites\code\ExileClientOverwrites_util_playerCargo_remove.sqf'],
	['ExileClient_util_playerCargo_takeAll', 'exile_client_overwrites\code\ExileClientOverwrites_util_playerCargo_takeAll.sqf'],
	['ExileClient_util_playerEquipment_add', 'exile_client_overwrites\code\ExileClientOverwrites_util_playerEquipment_add.sqf'],
	['ExileClient_util_playerEquipment_clear', 'exile_client_overwrites\code\ExileClientOverwrites_util_playerEquipment_clear.sqf'],
	['ExileClient_util_string_trim', 'exile_client_overwrites\code\ExileClientOverwrites_util_string_trim.sqf'],
	['ExileClient_util_territory_getNumberOfTerritories', 'exile_client_overwrites\code\ExileClientOverwrites_util_territory_getNumberOfTerritories.sqf'],
	['ExileClient_util_world_canBuildHere', 'exile_client_overwrites\code\ExileClientOverwrites_util_world_canBuildHere.sqf'],
	['ExileClient_util_world_getTerritoryAtPosition', 'exile_client_overwrites\code\ExileClientOverwrites_util_world_getTerritoryAtPosition.sqf'],
	['ExileClient_util_world_isInTerritory', 'exile_client_overwrites\code\ExileClientOverwrites_util_world_isInTerritory.sqf']
];

call ExileClient_fnc_oldPreInit;

true