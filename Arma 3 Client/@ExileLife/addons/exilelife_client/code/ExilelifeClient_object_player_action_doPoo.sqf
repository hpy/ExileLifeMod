/**
                    * ExilelifeClient_object_player_action_doPoo
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_potpos","_pooPot"];
[true] call ExileLifeClient_object_player_action_holsterweapon;
_potpos = player modelToWorld [0,-0.1,0];    
_pooPot = createVehicle ["ExileLife_Cosmetic_empty_pot", _potpos, [], 0, "CAN_COLLIDE"];   
_pooPot setDir random 360;    
_pooPot setPosATL _potpos; 
_pooPot call ExileLifeClient_object_player_action_sitting_sitDown;
closeDialog 0;
["DoPoo", _pooPot] call ExileClient_action_execute;
