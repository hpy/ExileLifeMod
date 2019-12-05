/**
                    * ExilelifeClient_action_injectBlood_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_targetType","_item","_target"];
_targetType = _this select 0;
_item = _this select 1;
switch(_targetType)do{
	case 0:{
		_target = player;
	};
	case 1:{
		_target = ExileClientInteractionObject;
	};
	default {
		_target = player;
	};
};
_target setVariable ['ExileLifeClientForce',false,true];
_target setVariable ['ExileLifeClientForcedBy',"",true];
["injectBloodRequest", [netId(_target), _item]] call ExileClient_system_network_send;
["Heal",50] call ExileLifeClient_object_player_skills_updateSkillRequest;