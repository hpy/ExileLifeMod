/**
                    * ExilelifeClient_object_player_injury_blood_network_drawBloodResponse
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_damageAmount"];
_damageAmount = _this select 0;
["InfoTitleOnly", ["You feel lightheaded as some blood was taken from your body"]] call ExileClient_gui_toaster_addTemplateToast;
[player,_damageAmount,true] call ExileLifeClient_util_health_damageAllHitpoints;
// Make their screen like they are dizzy?