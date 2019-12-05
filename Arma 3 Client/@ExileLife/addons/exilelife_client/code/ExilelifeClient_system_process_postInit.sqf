/**
                    * ExilelifeClient_system_process_postInit
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if (missionName isEqualTo "ExileIntro") then
{
	"ExileLife Intro PostInit..." call ExileClient_util_log;
}
else
{
	if (hasInterface) then
	{
		if (!isServer) then
		{
			"ExileLife Client PostInit..." call ExileClient_util_log;
			ExileLifeClientJoined = true; 
		};
	};
};
true
