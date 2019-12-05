/**
                    * ExilelifeClient_gui_spawnCam_create
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    disableSerialization;
ExileLifeClientSpawnPlayerCamPlayer1 = [ExileLifeClientCharacterSelection1,ExileLifeClientSpawnPlayerCamPlayerPos1,"character1"] call ExileLifeClient_gui_spawnCam_createUnit;
ExileLifeClientSpawnSelectedCharacter = ExileLifeClientSpawnPlayerCamPlayer1;
ExileLifeClientSpawnChoice = "character1";
ExileLifeClientClass = (ExileLifeClientCharacterSelection1 select 1)select 0;
ExileLifeGuard = false; 
if (((date select 3)) < 8 || ((date select 3) > 16)) then
{
	ExileLifeClientSpawnPlayer1CamLight = "#lightpoint" createVehicleLocal ExileLifeClientSpawnPlayer1CamLightPos;
	ExileLifeClientSpawnPlayer1CamLight setLightBrightness 1.3;
	ExileLifeClientSpawnPlayer1CamLight setLightAmbient [1.0, 1.0, 1.0];
	ExileLifeClientSpawnPlayer1CamLight setLightColor [1.0, 1.0, 1.0];
	ExileLifeClientSpawnPlayer2CamLight = "#lightpoint" createVehicleLocal ExileLifeClientSpawnPlayer2CamLightPos;
	ExileLifeClientSpawnPlayer2CamLight setLightBrightness 0.9;
	ExileLifeClientSpawnPlayer2CamLight setLightAmbient [1.0, 1.0, 1.0];
	ExileLifeClientSpawnPlayer2CamLight setLightColor [1.0, 1.0, 1.0];
};
ExileLifeClientSpawnPlayerCamPlayer1 setDir 290;
ExileLifeClientSpawnPlayerCamAimPos = getPos ExileLifeClientSpawnSelectedCharacter;
ExileLifeClientSpawnPlayerCamAimPos = [(ExileLifeClientSpawnPlayerCamAimPos select 0),(ExileLifeClientSpawnPlayerCamAimPos select 1),(ExileLifeClientSpawnPlayerCamAimPos select 2) + 1.25];
ExileLifeClientSpawnPlayerCam = "camera" camcreate ExileLifeClientSpawnStartPos;
ExileLifeClientSpawnPlayerCam cameraeffect ["internal", "back"];
showcinemaBorder false;
ExileLifeClientSpawnPlayerCam camPrepareTarget ExileLifeClientSpawnPlayerCamAimPos;
ExileLifeClientSpawnPlayerCam camPrepareFOV 0.75;
ExileLifeClientSpawnPlayerCam camCommitPrepared 0;
ExileLifeClientSpawnPlayerCamPos = ExileLifeClientSpawnPlayer1CamPos;
ExileLifeClientSpawnPlayerCam camSetPos ExileLifeClientSpawnPlayerCamPos;
if !(ExileLifePlayerJoinedAlready) then
{
	ExileLifePlayerJoinedAlready = true;
	ExileLifeClientSpawnPlayerCam camCommitPrepared 6;
	uisleep 0.5;
	[3] call ExileLifeClient_gui_selectCharacter_mainMenu;
	uisleep 3;
	[4] call ExileLifeClient_gui_selectCharacter_mainMenu;
	waitUntil {camCommitted ExileLifeClientSpawnPlayerCam};
	[0,-1] call ExileLifeClient_gui_selectCharacter_mainMenu;
}
else
{
	ExileLifeClientSpawnPlayerCam camCommitPrepared 0.5;
	waitUntil {camCommitted ExileLifeClientSpawnPlayerCam};
	[0,1] call ExileLifeClient_gui_selectCharacter_mainMenu;
};
if (ExileLifeDebug) then
{
	["SuccessTitleAndText", ["Debug Mode Enabled","ExileLifeDebug has been set true disable before final build!"]] call ExileClient_gui_toaster_addTemplateToast;
};
