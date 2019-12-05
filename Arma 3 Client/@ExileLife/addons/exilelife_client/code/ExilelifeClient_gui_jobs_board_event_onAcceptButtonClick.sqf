/**
                    * ExilelifeClient_gui_jobs_board_event_onAcceptButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_selectedValue","_selectedData"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeJobsBoard",displayNull];
_selectedValue = lbValue [17105, lbCursel(17105)];
_selectedData = lbData [17105, _selectedValue];
if(_selectedData == "-1") exitWith{};
if (player getVariable ["ExileLifeJobMultiJob",""] != "")exitWith{};
["addJobRequest",[(ExileLifeJobBoard select _selectedValue) select 0,(ExileLifeJobBoard select _selectedValue) select 1]] call ExileClient_system_network_send;
_display closeDisplay 0;
true
