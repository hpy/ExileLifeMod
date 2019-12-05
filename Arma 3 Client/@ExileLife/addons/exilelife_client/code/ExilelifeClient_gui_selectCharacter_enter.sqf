/**
                    * ExilelifeClient_gui_selectCharacter_enter
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_bambiCheck"];
(findDisplay 72850) closeDisplay 0;
_bambiCheck = ExileLifeClientSpawnSelectedCharacter getVariable ["ExileLifeClientBambi", ""]; 
if(_bambiCheck isEqualTo false) then 
{
	ExileLifeClientCharacterBambi = false;
	call ExileLifeClient_gui_spawnCam_destroy; 
} 
else 
{
	if (ExileLifeGuard) then
	{
		(findDisplay 74850) closeDisplay 0;
		call ExileLifeClient_gui_spawnCam_destroy; 
	};
		ExileLifeClientCharacterBambi = true;
	["updatePlayerSelectionCharacter",[ExileLifeClientSpawnChoice]] call ExileClient_system_network_send; 
};
ExileLifeClientCharacterChosen = true;
