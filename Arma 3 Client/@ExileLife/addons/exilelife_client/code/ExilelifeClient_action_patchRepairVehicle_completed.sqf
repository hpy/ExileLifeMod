/**
                    * ExilelifeClient_action_patchRepairVehicle_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    ["Repair",50] call ExileLifeClient_object_player_skills_updateSkillRequest;
_this setDamage 0;
player removeItem "Exile_Item_DuctTape";
