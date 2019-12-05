/**
                    * ExilelifeClient_object_player_event_onFired_knife
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

                    private["_damage"];
systemchat "11";
if !(ExileLifeShiftState) then
{systemchat "0";
    try
    { 
        if (isNull ExileClientInteractionObject) then 
        {
            systemchat "1";
            throw false;
        };
        if !(alive ExileClientInteractionObject) then 
        {systemchat "2";
            throw false;
        };
        if !(ExileClientInteractionObject iskindof "Exile_Animal_Abstract") then 
        {systemchat "3";
            throw false;
        };  
        if (player distance ExileClientInteractionObject > 1.5) then 
        {systemchat "4";
            throw false;
        };
        throw true;  
    }
    catch
    {
        if(_exception) then 
        {systemchat "5";
            ExileClientPlayerIsInCombat = false;
            ExileClientPlayerLastCombatAt = 0;
            false call ExileClient_gui_hud_toggleCombatIcon;  
            _damage = damage ExileClientInteractionObject;
            ExileClientInteractionObject setDamage (_damage + 0.2);
        }; 
    };
};
