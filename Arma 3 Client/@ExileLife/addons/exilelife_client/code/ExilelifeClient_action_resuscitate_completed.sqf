/**
                    * ExilelifeClient_action_resuscitate_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_player"];
_player = _this;
player removeItem "Exile_Item_Instadoc";
_player setVariable ['ExileLifeClientUnconscious',false,true];
