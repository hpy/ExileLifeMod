/**
                    * ExilelifeClient_action_breakCementShoes_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_target"];
_target = _this;
_target setVariable ['ExileLifeCementShoes',false,true];
{
  detach _x;
} forEach attachedObjects _target;
["Strength",50] call ExileLifeClient_object_player_skills_updateSkillRequest;
