/**
                    * ExilelifeClient_system_jobs_scenes_trader_receivings_onHandOverButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if (((ExileLifeCurrentJob select 0) isEqualTo "ExileLife_Trader_Receivings") && ((ExileLifeCurrentJob select 1) isEqualTo 1)) then
{
	["completeJobRequest",[]] call ExileClient_system_network_send;
};
	closeDialog 0;