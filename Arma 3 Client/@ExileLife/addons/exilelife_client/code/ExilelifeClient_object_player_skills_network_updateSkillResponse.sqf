/**
                    * ExilelifeClient_object_player_skills_network_updateSkillResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_skill","_newData"];
_skill = _this select 0;
_newData = _this select 1;
missionNamespace setVariable ["ExileLifeClientSkill" + _skill, _newData];
