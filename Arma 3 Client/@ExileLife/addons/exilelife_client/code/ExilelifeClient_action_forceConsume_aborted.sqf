/**
                    * ExilelifeClient_action_forceConsume_aborted
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_target","_item"];
_target = _this select 0;
_item = _this select 1;
if (_target getVariable ['ExileLifeClientForcedBy', ""] == netId player) then
{
	_target setVariable ['ExileLifeClientForce',false,true];
	_target setVariable ['ExileLifeClientForcedBy',"",true];
};