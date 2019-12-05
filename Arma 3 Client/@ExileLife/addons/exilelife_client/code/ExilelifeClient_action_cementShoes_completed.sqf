/**
                    * ExilelifeClient_action_cementShoes_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_target","_targetpos","_concreteShoe1","_concreteShoe2"];
_target = _this;
{
	[player,_x] call ExileClient_util_playerCargo_remove;
}forEach ["Exile_Item_Cement","Exile_Item_Sand","Exile_Item_WaterCanisterDirtyWater"];
_targetpos = getPosATL _target;
_concreteShoe1 = "ExileLife_Item_CementBlock" createVehicle _targetpos; 
_concreteShoe1 attachTo [_target, [0,-0.07,-0.25], "leftfoot"];
_concreteShoe2 = "ExileLife_Item_CementBlock" createVehicle _targetpos; 
_concreteShoe2 attachTo [_target, [0,-0.07,-0.25], "rightfoot"];
_target setVariable ['ExileLifeCementShoes', true,true];
