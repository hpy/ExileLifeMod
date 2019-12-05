/**
                    * ExilelifeClient_system_jobs_scenes_trader_lumberSupplier_onDepositSuppliesButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if (((ExileLifeCurrentJob select 0) isEqualTo "lumberCollection") && ((ExileLifeCurrentJob select 1) isEqualTo 1)) then
{
	["progressJobRequest",[]] call ExileClient_system_network_send;
};
closeDialog 0;