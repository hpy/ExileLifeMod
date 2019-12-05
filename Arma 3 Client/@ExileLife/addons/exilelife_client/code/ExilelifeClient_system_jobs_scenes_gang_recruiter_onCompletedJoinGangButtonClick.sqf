/**
                    * ExilelifeClient_system_jobs_scenes_gang_recruiter_onCompletedJoinGangButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_result"];
try
{ 
	if !((ExileLifeCurrentJob select 0) isEqualTo "joinGang") then
	{
		throw false;
	};
	if !((ExileLifeCurrentJob select 1) isEqualTo 1) then 
	{
		throw false;
	};
	["progressJobRequest",[]] call ExileClient_system_network_send;	
}
catch
{
	_result = _exception;
};
closeDialog 0;