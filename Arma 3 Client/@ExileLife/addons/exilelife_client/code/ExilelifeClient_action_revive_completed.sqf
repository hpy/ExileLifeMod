/**
                    * ExilelifeClient_action_revive_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_victim"];
_victim = _this;
["onReviveRequest",[netid _victim]] call ExileClient_system_network_send;
