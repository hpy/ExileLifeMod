/**
                    * ExilelifeClient_action_collectPrisonOre_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_vehicleNetID"];
_vehicleNetID = _this;
["progressJobRequest",[]] call ExileClient_system_network_send;
