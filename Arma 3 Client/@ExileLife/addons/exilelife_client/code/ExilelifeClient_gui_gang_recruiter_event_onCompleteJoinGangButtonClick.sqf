/**
                    * ExilelifeClient_gui_gang_recruiter_event_onCompleteJoinGangButtonClick
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
["completeJobRequest",[]] call ExileClient_system_network_send;
closeDialog 0;
