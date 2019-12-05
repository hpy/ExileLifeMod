/**
                    * ExilelifeClient_gui_xm8_slide_jobManagement_event_onAcceptButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_uberJobs","_job","_jobID"];
try
{
    if(isNull player)then{
        throw "Ummm you dont exist?";
    };
    if !(alive player)then{
        throw "Ummm you are dead?";
    };
    _uberJobs = player getVariable ['ExileLifeClientUberJobs',[]];
    if (_uberJobs isEqualTo [])then{
        throw "The job is no longer available!";
    };
    _job = _uberJobs select 0;
    if(_job isEqualTo [])then{
        throw "The job is no longer available!";
    };
    _jobID = _job select 0;
    if(_jobID!=ExileLifeUberJobID)then{
        throw "The job is no longer available!";
    };
    _uberJobs deleteAt 0;
    player setVariable ['ExileLifeClientUberJobs',_uberJobs];
    ["onUberJobRequest",[ExileLifeUberJobID]] call ExileClient_system_network_send;
    [ExileExtraAppsHomePage, 1] call ExileClient_gui_xm8_slide;
    ExileLifeJobManagmentIsOpen = false;
    ExileLifeUberJobID = "";
}
catch
{
    ["ErrorTitleOnly", [_exception]] call ExileClient_gui_toaster_addTemplateToast;
};
