/**
                    * ExilelifeClient_system_process_preInit
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
	"ExileLife Intro PreInit..." call ExileClient_util_log;
}
else
{
	if (hasInterface) then
	{
		"ExileLife Client PreInit..." call ExileClient_util_log;
		[] call ExileLifeClient_system_process_resetVar;
  		[] call ExileLifeClient_system_map_initialize;
  		[] call ExileLifeClient_system_keybinding_initialize;
	};
};
true
