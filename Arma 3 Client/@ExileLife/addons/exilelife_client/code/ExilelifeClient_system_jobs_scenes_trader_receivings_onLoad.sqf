/**
                    * ExilelifeClient_system_jobs_scenes_trader_receivings_onLoad
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if ((profileNameSpace getVariable ["ExileLifeCompletedTutorial","COMPLETED"]) isEqualTo "STARTED") then
{
	["completeJobRequest",[]] call ExileClient_system_network_send;
	profileNamespace setVariable ["ExileLifeCompletedTutorial","COMPLETED"];
	saveProfileNamespace;
};
true
// why do it onLoad? shouldnt it be on handOver?