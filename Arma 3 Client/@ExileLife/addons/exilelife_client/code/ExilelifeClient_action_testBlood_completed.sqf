/**
                    * ExilelifeClient_action_testBlood_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_bloodVial","_cancel"];
_bloodVial = _this;
_cancel = "";
["bloodTestRequest", [_bloodVial]] call ExileClient_system_network_send;
