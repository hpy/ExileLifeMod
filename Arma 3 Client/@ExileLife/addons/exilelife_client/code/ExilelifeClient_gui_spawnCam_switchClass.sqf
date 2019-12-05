/**
                    * ExilelifeClient_gui_spawnCam_switchClass
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if (ExileLifeClientCamTimer) exitWith {};
ExileLifeClientCamTimer = true;
[] call ExileLifeClient_gui_selectClass_stats_hide;
switch (ExileLifeClientClass) do
{
    case "Thief": 
    {
    	ExileLifeClientClass = "Smuggler";
	 	ExileLifeClientSpawnSelectedClass = ExileLifeClientSmugglerCam;  
        ExileLifeClientSpawnPlayerCamPos = ExileLifeClientSmugglerCamPos;   
        ExileLifeClientSpawnPlayerCam camSetFov 0.5; 	 	   	
        ExileLifeClientSpawnPlayerCamAimPos = getPosATL ExileLifeClientSpawnSelectedClass; 
        ExileLifeClientSpawnPlayerCamAimPos = [(ExileLifeClientSpawnPlayerCamAimPos select 0),(ExileLifeClientSpawnPlayerCamAimPos select 1),(ExileLifeClientSpawnPlayerCamAimPos select 2) + 1.1];         
    };
    case "Smuggler": 
    {
    	ExileLifeClientClass = "Murderer";
	 	ExileLifeClientSpawnSelectedClass = ExileLifeClientMurdererCam;  
        ExileLifeClientSpawnPlayerCamPos = ExileLifeClientMurdererCamPos;   
        ExileLifeClientSpawnPlayerCam camSetFov 0.44;         
        ExileLifeClientSpawnPlayerCamAimPos = getPosATL ExileLifeClientSpawnSelectedClass; 
        ExileLifeClientSpawnPlayerCamAimPos = [(ExileLifeClientSpawnPlayerCamAimPos select 0),(ExileLifeClientSpawnPlayerCamAimPos select 1),(ExileLifeClientSpawnPlayerCamAimPos select 2) + 1.1];         
    };
    case "Murderer": 
    {
    	ExileLifeClientClass = "Thug";
	 	ExileLifeClientSpawnSelectedClass = ExileLifeClientThugCam;  
        ExileLifeClientSpawnPlayerCamPos = ExileLifeClientThugCamPos;   
        ExileLifeClientSpawnPlayerCam camSetFov 0.44; 
        ExileLifeClientSpawnPlayerCamAimPos = getPosATL ExileLifeClientSpawnSelectedClass; 
        ExileLifeClientSpawnPlayerCamAimPos = [(ExileLifeClientSpawnPlayerCamAimPos select 0),(ExileLifeClientSpawnPlayerCamAimPos select 1),(ExileLifeClientSpawnPlayerCamAimPos select 2) + 1];         
    };
    case "Thug": 
    {
    	ExileLifeClientClass = "Thief";
	 	ExileLifeClientSpawnSelectedClass = ExileLifeClientThiefCam;  
        ExileLifeClientSpawnPlayerCamPos = ExileLifeClientThiefCamPos; 
        ExileLifeClientSpawnPlayerCam camSetFov 0.44; 
        ExileLifeClientSpawnPlayerCamAimPos = getPosATL ExileLifeClientSpawnSelectedClass; 
        ExileLifeClientSpawnPlayerCamAimPos = [(ExileLifeClientSpawnPlayerCamAimPos select 0),(ExileLifeClientSpawnPlayerCamAimPos select 1),(ExileLifeClientSpawnPlayerCamAimPos select 2) + 1.1];         
    };
};
[] spawn
{
    ExileLifeClientSpawnPlayerCam camSetPos ExileLifeClientSpawnPlayerCamPos;
    ExileLifeClientSpawnPlayerCam camPrepareTarget ExileLifeClientSpawnPlayerCamAimPos; 
    ExileLifeClientSpawnPlayerCam camCommitPrepared 2; 
    waitUntil {camCommitted ExileLifeClientSpawnPlayerCam};
    call ExileLifeClient_gui_selectClass_stats_show;
    ExileLifeClientCamTimer = false;
};
true