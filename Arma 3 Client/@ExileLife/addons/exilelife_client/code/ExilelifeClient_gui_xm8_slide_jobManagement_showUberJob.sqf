/**
                    * ExilelifeClient_gui_xm8_slide_jobManagement_showUberJob
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_job","_jobID","_jobType","_jobTitle","_jobDescriptionText","_jobObjectiveText","_jobRewardArray","_jobEndTime","_jobPosition","_uberJobExtras","_mapTargetPos","_descriptionType","_objType","_currentJobText","_currentJob","_currentObjective","_mapControl"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_job = _this;
_jobID = _job select 0;
_jobType = _job select 1;
_jobTitle = _job select 2;
_jobDescriptionText = _job select 3;
_jobObjectiveText = _job select 4;
_jobRewardArray = _job select 5;
_jobEndTime = _job select 6;
_jobPosition = _job select 9;
_uberJobExtras = _job select 10;
ExileLifeJobManagmentIsOpen = true;
ExileLifeUberJobID = _jobID;
(_display displayCtrl 31015) ctrlEnable false;
(_display displayCtrl 31015) ctrlShow false;
_mapTargetPos = [];
switch (_jobType) do {
    case "requestMedic": {
        (_display displayCtrl 31006) ctrlEnable false;
        (_display displayCtrl 31006) ctrlShow false;
        _descriptionType = _display displayCtrl 31005;
        _descriptionType ctrlSetText "Location";
        _objType = _display displayCtrl 31007;
        _objType ctrlSetText "Patient";
    };
    case "requestGangMedic": {
        (_display displayCtrl 31006) ctrlEnable false;
        (_display displayCtrl 31006) ctrlShow false;
        _descriptionType = _display displayCtrl 31005;
        _descriptionType ctrlSetText "Location";
        _objType = _display displayCtrl 31007;
        _objType ctrlSetText "Patient";
    };
    default {};
};
(_display displayCtrl 31013) ctrlEnable true;
(_display displayCtrl 31013) ctrlShow true;
(_display displayCtrl 31013) ctrlSetText "DECLINE JOB";
(_display displayCtrl 31014) ctrlEnable false;
(_display displayCtrl 31014) ctrlShow false;
(_display displayCtrl 31016) ctrlEnable true;
(_display displayCtrl 31016) ctrlShow true;
_currentJobText = _display displayCtrl 31002;
_currentJobText ctrlSetText "Job Offer";
_currentJob = _display displayCtrl 31003;
_currentJob ctrlSetStructuredText parseText format["<t valign='middle'>%1</t>",_jobTitle];
_currentObjective = _display displayCtrl 31008;
_currentObjective ctrlSetStructuredText parseText format["%1",_jobObjectiveText];
if !(_jobRewardArray isEqualTo [])then{
    _jobRewardArray call ExileLifeClient_gui_xm8_slide_jobManagement_showRewards;
};
if !(_jobPosition isEqualTo [])then{
    [_display,_jobPosition] spawn {
        _display = _this select 0;
        _jobPosition = _this select 1;
        _mapControl = (_display displayCtrl 31015);
        _mapControl ctrlEnable true;
        _mapControl ctrlShow true;
        _mapControl ctrlSetFade 1;
        _mapControl ctrlCommit 0;
        _mapControl ctrlSetFade 0;
        _mapControl ctrlCommit 1;
        uisleep 1;
        _jobPosition call ExileLifeClient_gui_xm8_slide_jobManagement_event_mapZoomToJob;
    };
};
ExileLifeXM8JobThread = [0.1,ExileLifeClient_gui_xm8_slide_jobManagement_thread_update,[],true,"XM8 Timer"] call ExileClient_system_thread_addTask;
call ExileLifeClient_gui_xm8_slide_jobManagement_thread_update;
