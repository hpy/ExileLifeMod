/**
                    * ExilelifeClient_action_refuelFuelStation_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_vehicleNetID","_vehicleObject"];
_vehicleNetID = _this;
_vehicleObject = objectFromNetId _vehicleNetID;
_vehicleObject setFuelCargo 0;
["progressJobRequest",[]] call ExileClient_system_network_send;