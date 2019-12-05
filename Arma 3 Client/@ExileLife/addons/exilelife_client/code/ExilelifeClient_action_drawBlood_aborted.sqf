/**
                    * ExilelifeClient_action_drawBlood_aborted
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_targetType","_target"];
_targetType = _this;
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
if (_target getVariable ['ExileLifeClientForcedBy', ""] == netId player) then
{
	_target setVariable ['ExileLifeClientForce',false,true];
	_target setVariable ['ExileLifeClientForcedBy',"",true];
};