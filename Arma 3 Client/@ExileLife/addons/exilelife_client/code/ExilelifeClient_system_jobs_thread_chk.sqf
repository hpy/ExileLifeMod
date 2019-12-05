/**
                    * ExilelifeClient_system_jobs_thread_chk
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    try
{ 
    if (count ExileLifeCurrentJob > 0) then
    {
        throw false;
    };
    if (isNull player) then
    {
        throw false;
    };
    if !(alive player) then
    {
        throw false;
    };
    ["checkJobs",[]] call ExileClient_system_network_send;
}
catch
{
    _exception;
};
