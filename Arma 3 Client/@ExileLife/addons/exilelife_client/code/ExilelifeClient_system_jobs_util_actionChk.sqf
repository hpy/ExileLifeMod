/**
                    * ExilelifeClient_system_jobs_util_actionChk
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_jobType","_jobStage","_result"];
_jobType = _this select 0;
_jobStage = _this select 1;
_result = false;
try
{
	if (ExileLifeCurrentJob isEqualTo []) then
	{
		throw false;
	};
	if ((count ExileLifeCurrentJob) < 3) then
	{
		throw false;
	};
	if !((ExileLifeCurrentJob select 0) isEqualTo _jobType) then
	{
		throw false;
	};
	if !((ExileLifeCurrentJob select 1) isEqualTo _jobStage) then
	{
		throw false;
	};
	throw true;
}
catch
{
	_result = _exception;
};
_result
