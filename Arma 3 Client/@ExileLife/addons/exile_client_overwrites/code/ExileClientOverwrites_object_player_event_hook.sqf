/**
                    * ExileClientOverwrites_object_player_event_hook
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

                    player addEventHandler ["Killed", { _this call ExileClient_object_player_event_onKilled}];
player addEventHandler ["Fired", { _this call ExileClient_object_player_event_onFired}];
player addEventHandler ["FiredNear", { _this call ExileClient_object_player_event_onFiredNear}];
player addEventHandler ["Explosion", { _this call ExileClient_object_player_event_onExplosion}];
player addEventHandler ["Hit", { _this call ExileClient_object_player_event_onHit}];
player addEventHandler ["HandleDamage", { _this call ExileClient_object_player_event_onHandleDamage}];
player addEventHandler ["Dammaged", { _this call ExileLifeClient_object_player_event_onDammaged}];
player addEventHandler ["Put", { _this call ExileClient_object_player_event_onPut}];
player addEventHandler ["Take", { _this call ExileClient_object_player_event_onTake}];
player addEventHandler ["InventoryOpened", { _this call ExileClient_object_player_event_onInventoryOpened}];
player addEventHandler ["InventoryClosed", { _this call ExileClient_object_player_event_onInventoryClosed}];
player addEventHandler ["SeatSwitchedMan", { _this call ExileLifeClient_object_player_event_onSeatSwitchedMan}];
player addEventHandler ["GetInMan", { _this call ExileLifeClient_object_player_event_onGetInMan}];
player addEventHandler ["GetOutMan", { _this call ExileLifeClient_object_player_event_onGetOutMan}];
true
