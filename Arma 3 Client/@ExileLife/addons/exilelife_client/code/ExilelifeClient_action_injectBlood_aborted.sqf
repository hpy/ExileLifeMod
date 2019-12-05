/**
                    * ExilelifeClient_action_injectBlood_aborted
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
if (_target getVariable ['ExileLifeClientForcedBy', ""] == netId player) then
{
	_target setVariable ['ExileLifeClientForce',false,true];
	_target setVariable ['ExileLifeClientForcedBy',"",true];
};
