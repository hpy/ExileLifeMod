/**
                    * ExilelifeClient_gui_selectCharacter_show
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    playMusic "ExileLifeTrack01";
ExileClientSpawnLocationSelectionDone = false;
ExileClientSelectedSpawnLocationMarkerName = "";
ExileLifeClientCharacterSwap = false;
ExileLifeGuard = false; 
if (ExileClientGasMaskVisible) then 
{
	false call ExileClient_gui_gasMask_toggle;
};
[] call ExileClient_object_player_stats_reset;
[] call ExileClient_gui_postProcessing_reset;
if (ExileClientGasMaskVisible) then 
{
	false call ExileClient_gui_gasMask_toggle;
};
[] spawn ExileLifeClient_gui_spawnCam_create;
