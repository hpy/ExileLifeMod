/**
                    * ExilelifeClient_action_forceConsume_completed
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
_target setVariable ['ExileLifeClientForce',false,true];
_target setVariable ['ExileLifeClientForcedBy',"",true];
try
{
	if !([player, _item] call ExileLifeClient_util_playercargo_contains) then
	{
		systemchat format["You dont have a %1 on you!",_item];
		throw false;
	};
	if([_item,"isDrinkItem"] call ExileLifeClient_util_item_isType)then{
		["waterOtherPlayerRequest", [netId(_target), _item]] call ExileClient_system_network_send;
		throw true;
	};
	if([_item,"isFoodItem"] call ExileLifeClient_util_item_isType)then{
		["feedOtherPlayerRequest", [netId(_target), _item]] call ExileClient_system_network_send;
		throw true;
	};
}
catch
{
	_exception;
};
