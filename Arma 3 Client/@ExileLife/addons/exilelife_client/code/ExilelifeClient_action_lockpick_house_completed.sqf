/**
                    * ExilelifeClient_action_lockpick_house_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_house","_door"];
_house = _this select 0;
_door = _this select 1;
["Lockpick",100] call ExileLifeClient_object_player_skills_updateSkillRequest;
["lockPickHouseRequest", [(netId _house),_door]] call ExileClient_system_network_send;