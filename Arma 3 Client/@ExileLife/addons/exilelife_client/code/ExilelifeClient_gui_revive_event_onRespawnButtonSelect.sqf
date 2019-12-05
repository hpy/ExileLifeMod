/**
                    * ExilelifeClient_gui_revive_event_onRespawnButtonSelect
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if !(ExileLifeReviveScreenIsVisible)exitWith{};
ExileLifeReviveScreenIsVisible = false; 
closeDialog 1;
player setVariable ['ExileLifeClientReviveState', 5,true];
player allowDamage true;
player setDamage 1;
