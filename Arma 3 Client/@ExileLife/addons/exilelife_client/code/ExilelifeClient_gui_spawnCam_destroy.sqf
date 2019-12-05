/**
                    * ExilelifeClient_gui_spawnCam_destroy
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if !(isNil "ExileLifeClientSpawnPlayerCam") then
{
	ExileLifeClientSpawnPlayerCam cameraEffect ["terminate", "back"];
	camDestroy ExileLifeClientSpawnPlayerCam;
};
if !(isNil "ExileLifeClientSpawnPlayer1CamLight") then
{
	deleteVehicle ExileLifeClientSpawnPlayer1CamLight;
};
if !(isNil "ExileLifeClientSpawnPlayer2CamLight") then
{
	deleteVehicle ExileLifeClientSpawnPlayer2CamLight;
};
if !(isNil "ExileLifeClientSpawnPlayerCamPlayer1") then
{
	deleteVehicle ExileLifeClientSpawnPlayerCamPlayer1;
};
if !(isNil "ExileLifeClientSpawnPlayerCamPlayer2") then
{
	deleteVehicle ExileLifeClientSpawnPlayerCamPlayer2;
};
if !(isNil "ExileLifeGuard") then
{
	if !(ExileLifeGuard) then
	{
		if !(isNil "ExileLifeClientThiefCam") then
		{
			deleteVehicle ExileLifeClientThiefCam;
		};
		if !(isNil "ExileLifeClientSmugglerCam") then
		{
			deleteVehicle ExileLifeClientSmugglerCam;
		};
		if !(isNil "ExileLifeClientMurdererCam") then
		{
			deleteVehicle ExileLifeClientMurdererCam;
		};
		if !(isNil "ExileLifeClientThugCam") then
		{
			deleteVehicle ExileLifeClientThugCam;
		};
		if !(isNil "ExileLifeClientThiefCamLight") then
		{
			deleteVehicle ExileLifeClientThiefCamLight;
		};
		if !(isNil "ExileLifeClientSmugglerCamLight") then
		{
			deleteVehicle ExileLifeClientSmugglerCamLight;
		};
		if !(isNil "ExileLifeClientMurdererCamLight") then
		{
			deleteVehicle ExileLifeClientMurdererCamLight;
		};
		if !(isNil "ExileLifeClientThugCamLight") then
		{
			deleteVehicle ExileLifeClientThugCamLight;
		};		
	};
};
