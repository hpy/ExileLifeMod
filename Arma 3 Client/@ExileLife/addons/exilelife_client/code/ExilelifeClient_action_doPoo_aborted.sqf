/**
                    * ExilelifeClient_action_doPoo_aborted
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_pooPot"];
_pooPot = _this;
call ExileLifeClient_object_player_action_sitting_standUp;
if !(isNull _pooPot) then 
{
	deleteVehicle _pooPot;
};
[player, "ExileLife_Item_Pot"] call ExileLifeClient_util_playerCargo_addOrDrop;
