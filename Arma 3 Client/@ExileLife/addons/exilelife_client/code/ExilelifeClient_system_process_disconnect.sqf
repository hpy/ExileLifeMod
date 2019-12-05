/**
                    * ExilelifeClient_system_process_disconnect
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    disableUserInput false;
0 fadeSound 1;
player enableSimulation false;
[] call ExileLifeClient_gui_spawnCam_destroy;
cutText ["", "BLACK IN", 0.1];
deleteVehicle player; 
endLoadingScreen;
endMission "END6";