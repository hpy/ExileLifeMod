/**
                    * ExileClientOverwrites_action_repairVehicle_completed
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

                    ["Repair",150] call ExileLifeClient_object_player_skills_updateSkillRequest;
_this setDamage 0;
//increase skill here