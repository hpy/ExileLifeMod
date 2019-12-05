/**
                    * ExilelifeClient_system_jobs_scenes_gang_recruiter_onJoinGangButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_gang","_result"];
try
{
	switch (ExileLifeCurrentJob select 0) do
	{
		case "joinCartel" : {  _gang = "cartel"; };
		case "joinMafia" : {  _gang = "mafia"; };
		case "joinYakuza" : {  _gang = "yakuza"; };
		case "joinSyndicate" : {  _gang = "syndicate"; };
	};
	if !((ExileLifeCurrentJob select 0) isEqualTo "joinGang") then
	{
		throw false;
	};
	if !((ExileLifeCurrentJob select 1) isEqualTo 0) then
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
