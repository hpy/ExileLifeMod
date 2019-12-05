/**
                    * ExilelifeClient_action_doPoo_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_pooPot","_potpos","_quantity","_weaponHolder"];
_pooPot = _this;
_potpos = getPosATL _pooPot;
_quantity = floor(random 6) + 1;
call ExileLifeClient_object_player_action_sitting_standUp;
deleteVehicle _pooPot;
_weaponHolder = createVehicle ["GroundWeaponHolder", _potpos, [], 0, "NONE"];
_weaponHolder setPosATL _potpos;
_weaponHolder addMagazineAmmoCargo ["ExileLife_Item_Fertilizer", 1, _quantity];
ExileLifeDoPooTimer = time + 900; 
["Speed",50] call ExileLifeClient_object_player_skills_updateSkillRequest;
["SuccessTitleAndText", ["Success!", "You did a poo!"]] call ExileClient_gui_toaster_addTemplateToast;
