/**
                    * ExilelifeClient_action_stealCargo_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_vehicle","_jobClassname"];
_vehicle = _this select 0;
_jobClassname = _this select 1;
["stealCargo", [_jobClassname, (netID _vehicle)]] call ExileClient_system_network_send;
