/**
                    * ExilelifeClient_object_player_thread_init
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if(ExileLifeClientJoined) then
{
    [10, ExileLifeClient_object_player_event_thread_checkResourceZone, [], true,"Resource Zone"] call ExileClient_system_thread_addtask;
    [10, ExileLifeClient_object_player_event_thread_checkRefineryZone, [], true,"Refinery Zone"] call ExileClient_system_thread_addtask;
    [10, ExileLifeClient_object_player_event_thread_checkGangZone, [], true,"Gang Zone"] call ExileClient_system_thread_addtask;
    [10, ExileLifeClient_object_player_event_thread_checkPrisonZone, [], true,"Prison Zone"] call ExileClient_system_thread_addtask;
    call ExileLifeClient_system_allowance_thread_initialize; 
    call ExileLifeClient_system_jobs_thread_initialize; 
    call ExileLifeClient_system_jobs_uber_thread_initialize; 
    ExileLifeClientJoined = false;
};
