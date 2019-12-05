/**
                    * ExilelifeClient_action_bandage_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_player"];
_player = _this;
player removeItem "Exile_Item_Bandage";
_player setBleedingRemaining 0; 
_player setVariable ['ExileLifeClientBleeding',false,true];
_player setVariable ['ExileLifeClientPlayerIsBleeding',false,true];
["Heal",50] call ExileLifeClient_object_player_skills_updateSkillRequest;
