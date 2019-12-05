/**
                    * ExilelifeClient_gui_gang_recruiter_event_onJoinGangButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_gang"];
_gang = _this;
["startJobRequest",[format ['join%1',_gang]]] call ExileClient_system_network_send;
closeDialog 0;
