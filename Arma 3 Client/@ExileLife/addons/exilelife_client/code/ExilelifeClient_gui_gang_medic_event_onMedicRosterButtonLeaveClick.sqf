/**
                    * ExilelifeClient_gui_gang_medic_event_onMedicRosterButtonLeaveClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_requestType"];
_requestType = _this;
closeDialog 0;
["uberPlayerUnAvailable",[_requestType]] call ExileClient_system_network_send;
