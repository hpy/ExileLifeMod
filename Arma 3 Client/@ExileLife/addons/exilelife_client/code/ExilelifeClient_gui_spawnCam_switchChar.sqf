/**
                    * ExilelifeClient_gui_spawnCam_switchChar
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_showStats","_char"];
_this spawn
{
	disableSerialization;
	_showStats = true;
	if(ExileLifeGuard) then 
	{
		_showStats = true;
	};
	if (ExileLifeClientCamTimer) exitWith {};
	ExileLifeClientCamTimer = true;
	[] call ExileLifeClient_gui_selectCharacter_stats_hide;
	if !(ExileLifeCharacter2) then
	{
		ExileLifeCharacter2 = true;
		ExileLifeClientSpawnPlayerCamPlayer2 = [ExileLifeClientCharacterSelection2,ExileLifeClientSpawnPlayerCamPlayerPos2,"character2"] call ExileLifeClient_gui_spawnCam_createUnit;
		ExileLifeClientSpawnPlayerCamPlayer2 setDir 300;
	};
	_char = 1;
	if (_this) then
	{
	 	ExileLifeClientSpawnSelectedCharacter = ExileLifeClientSpawnPlayerCamPlayer1;
	 	ExileLifeClientCharacterSwap = false;
	 	ExileLifeClientSpawnChoice = "character1";
	 	ExileLifeClientSpawnPlayerCamAimPos = getPos ExileLifeClientSpawnSelectedCharacter;
	 	ExileLifeClientSpawnPlayerCamAimPos = [(ExileLifeClientSpawnPlayerCamAimPos select 0),(ExileLifeClientSpawnPlayerCamAimPos select 1),(ExileLifeClientSpawnPlayerCamAimPos select 2) + 1.1];
		ExileLifeClientSpawnPlayerCamPos = ExileLifeClientSpawnPlayer1CamPos;
		ExileLifeClientSpawnPlayerCam camSetPos ExileLifeClientSpawnPlayerCamPos;
	    ExileLifeClientSpawnPlayerCam camSetFov 0.75;
		if (ExileLifeClientGuardRights) then
		{
			ExileLifeGuard = false;
		};
		ExileLifeClientClass = (ExileLifeClientCharacterSelection1 select 1)select 0;
	}
	else
	{
		ExileLifeClientSpawnSelectedCharacter = ExileLifeClientSpawnPlayerCamPlayer2;
		ExileLifeClientCharacterSwap = true;
		ExileLifeClientSpawnChoice = "character2";
		ExileLifeClientSpawnPlayerCamAimPos = getPos ExileLifeClientSpawnSelectedCharacter;
		ExileLifeClientSpawnPlayerCamAimPos = [(ExileLifeClientSpawnPlayerCamAimPos select 0),(ExileLifeClientSpawnPlayerCamAimPos select 1),(ExileLifeClientSpawnPlayerCamAimPos select 2) + 1.1];
		ExileLifeClientSpawnPlayerCamPos = ExileLifeClientSpawnPlayer2CamPos;
		ExileLifeClientSpawnPlayerCam camSetPos ExileLifeClientSpawnPlayerCamPos;
		ExileLifeClientSpawnPlayerCam camSetFov 0.55;
		ExileLifeClientClass = (ExileLifeClientCharacterSelection2 select 1)select 0;
		if (ExileLifeClientGuardRights) then
		{
			ExileLifeGuard = true;
			ExileLifeClientClass = "Guard";
		};
	    _char = 2;
	};
    disableSerialization;
    ExileLifeClientSpawnPlayerCam camPrepareTarget ExileLifeClientSpawnPlayerCamAimPos;
    ExileLifeClientSpawnPlayerCam camCommitPrepared 2;
	uisleep 2;
    if(_showStats) then 
    {
    	[_char] call ExileLifeClient_gui_selectCharacter_stats_show;
    };
    uisleep 1;
    ExileLifeClientCamTimer = false;
};
