/**
                    * ExilelifeClient_object_farming_network_harvestPlantResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_responseCode"];
_responseCode = _this select 0;
ExileClientIsWaitingForServerTradeResponse = false; 
//systemchat format ["Harvest Response == %1",_responseCode];