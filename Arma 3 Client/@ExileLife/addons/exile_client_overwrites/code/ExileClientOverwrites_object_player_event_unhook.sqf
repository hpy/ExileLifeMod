/**
                    * ExileClientOverwrites_object_player_event_unhook
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

                    player removeAllEventHandlers "Killed";
player removeAllEventHandlers "Fired";
player removeAllEventHandlers "FiredNear";
player removeAllEventHandlers "Explosion";
player removeAllEventHandlers "HandleDamage";
player removeAllEventHandlers "Dammaged";
player removeAllEventHandlers "Put";
player removeAllEventHandlers "Take";
player removeAllEventHandlers "InventoryOpened";
player removeAllEventHandlers "InventoryClosed";
