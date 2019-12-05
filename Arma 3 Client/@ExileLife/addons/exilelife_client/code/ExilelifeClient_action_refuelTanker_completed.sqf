/**
                    * ExilelifeClient_action_refuelTanker_completed
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
_vehicleObject setFuelCargo 1;
["progressJobRequest",[]] call ExileClient_system_network_send;
