/**
                    * ExilelifeClient_gui_jobs_trader_hireVehicle_event_onJobVehicleButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_requiredStage"];
if (ExileLifeCurrentJob isEqualTo []) exitWith {};
_requiredStage = -1;
if (getNumber(configFile >> "CfgJobs" >> ExileLifeCurrentJob select 0 >> "hireVehicle")==1) then
{
    _requiredStage = 0; 
};
if (_requiredStage < 0) exitWith {};
if ((ExileLifeCurrentJob select 1) isEqualTo _requiredStage) then 
{
	["progressJobRequest",[]] call ExileClient_system_network_send;
};
closeDialog 0;
