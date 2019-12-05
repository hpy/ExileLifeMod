/**
                    * ExilelifeClient_object_farming_digGarden
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_pos","_cutter","_container"];
["Strength",100] call ExileLifeClient_object_player_skills_updateSkillRequest;
_pos = getposATL _this; 
_cutter = createVehicle ["Land_ClutterCutter_medium_F", _pos, [], 0, "CAN_COLLIDE"];   
_container = createVehicle ["ExileLife_Farming_DirtPlot", _pos, [], 0, "CAN_COLLIDE"]; 
_container setdir (getDirVisual player); 
_container setPosATL [_pos select 0,_pos select 1,0]; 
_container setVectorUp surfaceNormal _pos; 
deletevehicle _this; 
["plantGardenRequest",[netID _container]] call ExileClient_system_network_send; 
