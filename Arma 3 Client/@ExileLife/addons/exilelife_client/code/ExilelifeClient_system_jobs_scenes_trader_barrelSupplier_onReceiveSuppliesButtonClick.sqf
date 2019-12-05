/**
                    * ExilelifeClient_system_jobs_scenes_trader_barrelSupplier_onReceiveSuppliesButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if ((((ExileLifeCurrentJob select 0) isEqualTo "generatorRefuel") || ((ExileLifeCurrentJob select 0) isEqualTo "generatorAthira")) && ((ExileLifeCurrentJob select 1) isEqualTo 0)) then
{
	["progressJobRequest",[]] call ExileClient_system_network_send;
};
	closeDialog 0;