/**
                    * ExilelifeClient_system_jobs_scenes_fuelStation_refuelFuelStation
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if (((ExileLifeCurrentJob select 0) isEqualTo "fuelstationRefuel") && ((ExileLifeCurrentJob select 1) isEqualTo 2)) then
{
	["RefuelFuelStation", (player getVariable ["ExileLifeJobVehicle",""])] call ExileClient_action_execute;
};