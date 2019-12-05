/**
                    * ExilelifeClient_object_player_injury_blood_toggleBleeding
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

                    ExileLifeClientBleedOutRate = param [1, 0.01];
if(!isNil "ExileLifeClientPlayerIsBleeding" && ExileLifeClientPlayerIsBleeding)then{
    ExileLifeClientPlayerIsBleeding = false;
    ExileLifeClientBleedingCountDownEnd = -1;
    false call ExileLifeClient_gui_hud_toggleBleedingIcon;
    player setVariable ["ExileLifeClientBleeding",false,true];
}else{
    ExileLifeClientPlayerIsBleeding = true;
    ExileLifeClientBleedingCountDownEnd = param [0, 120];
    true call ExileLifeClient_gui_hud_toggleBleedingIcon;
    player setVariable ["ExileLifeClientBleeding",true,true];
};
