/**
                    * ExilelifeClient_action_lockpick_house_failed
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
["Lockpick",50] call ExileLifeClient_object_player_skills_updateSkillRequest;
player removeItem "Exile_Item_Knife";
["ErrorTitleOnly", ["Your knife broke!"]] call ExileClient_gui_toaster_addTemplateToast;