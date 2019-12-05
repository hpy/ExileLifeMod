/**
                    * ExilelifeClient_system_prisonRecords_network_getPrisonerRecordsResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    ExileLifeCriminalRecordID = _this select 0;
ExileLifeCriminalRecord = _this select 1;
ExileLifeCriminalRecordsList = _this select 2;
call ExileLifeClient_gui_xm8_slide_criminalHistory_event_onUpdate;
