/**
                    * ExilelifeClient_gui_jobs_trader_quarterMaster_event_onDeliveryJobButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_current"];
disableSerialization;
_current = getText(configFile >> "CfgJobs" >> (ExileLifeCurrentJob select 0) >> "path");
if (_current isEqualTo "basicJob") then
{
    if ((ExileLifeCurrentJob select 1) isEqualTo 1) then 
    {
        ["completeJobRequest",[]] call ExileClient_system_network_send;
    }
    else
    {
        ["progressJobRequest",[]] call ExileClient_system_network_send;
    };
};
closeDialog 0;