/**
                    * ExilelifeClient_gui_xm8_slide_jobManagement_event_mapZoomToJob
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_jobLocation","_display","_mapControl"];
disableSerialization;
_jobLocation = _this;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_mapControl = _display displayCtrl 31015;
_mapControl ctrlMapAnimAdd [0, 0.2, position player];
ctrlMapAnimCommit _mapControl;
_mapControl ctrlMapAnimAdd [2, 0.1, _jobLocation];
ctrlMapAnimCommit _mapControl;
true
