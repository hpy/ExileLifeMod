/**
                    * ExileClientOverwrites_action_hotwireVehicle_failed
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

                    ["Lockpick",50] call ExileLifeClient_object_player_skills_updateSkillRequest;
player removeItem "Exile_Item_Knife";
["ErrorTitleOnly", ["Your knife broke!"]] call ExileClient_gui_toaster_addTemplateToast;
