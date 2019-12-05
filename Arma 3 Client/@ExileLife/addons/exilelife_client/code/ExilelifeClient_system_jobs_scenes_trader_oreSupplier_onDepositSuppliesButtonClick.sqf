/**
                    * ExilelifeClient_system_jobs_scenes_trader_oreSupplier_onDepositSuppliesButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_current"];
_current = getText(configFile >> "CfgJobs" >> (ExileLifeCurrentJob select 0) >> "path");
if ((_current isEqualTo "oreCollection") && ((ExileLifeCurrentJob select 1) isEqualTo 1)) then
{
    ["progressJobRequest",[]] call ExileClient_system_network_send;
};
closeDialog 0;
