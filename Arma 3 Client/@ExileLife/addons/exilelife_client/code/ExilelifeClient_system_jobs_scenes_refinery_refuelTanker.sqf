/**
                    * ExilelifeClient_system_jobs_scenes_refinery_refuelTanker
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if (((ExileLifeCurrentJob select 0) isEqualTo "fuelstationRefuel") && ((ExileLifeCurrentJob select 1) isEqualTo 1)) then
{
	["RefuelTanker", (player getVariable ["ExileLifeJobVehicle",""])] call ExileClient_action_execute;
};