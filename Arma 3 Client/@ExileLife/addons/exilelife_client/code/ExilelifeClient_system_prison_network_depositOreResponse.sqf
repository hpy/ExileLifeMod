/**
                    * ExilelifeClient_system_prison_network_depositOreResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_quantity","_classname"];
_quantity = _this select 0;
[player, _classname,_quantity] call ExileClient_util_playercargo_removeQuantity;
ExileClientIsWaitingForServerTradeResponse = false;