/**
                    * ExilelifeClient_gui_xm8_slide_jobManagement_onClose
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
(_display displayCtrl 31013) ctrlSetText "FORFEIT JOB";
(_display displayCtrl 31013) ctrlEnable false;
(_display displayCtrl 31013) ctrlShow false;
(_display displayCtrl 31016) ctrlEnable false;
(_display displayCtrl 31016) ctrlShow false;
(_display displayCtrl 31014) ctrlEnable true;
(_display displayCtrl 31014) ctrlShow true;
(_display displayCtrl 31015) ctrlEnable false;
(_display displayCtrl 31015) ctrlShow false;
ExileLifeJobManagmentIsOpen = false;
ExileLifeUberJobID = "";
