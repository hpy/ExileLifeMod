/**
                    * ExilelifeClient_gui_selectClass_show
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_fade"];
	disableSerialization;
	ExileClientSpawnLocationSelectionDone = false;
	ExileClientSelectedSpawnLocationMarkerName = "";
	ExileLifeClientClass = "Thug"; 
	ExileLifeClientThiefCam = [[],ExileLifeClientSpawnThiefPos,"Thief"] call ExileLifeClient_gui_spawnCam_createUnit;
	ExileLifeClientSmugglerCam = [[],ExileLifeClientSpawnSmugglerPos,"Smuggler"] call ExileLifeClient_gui_spawnCam_createUnit;
	ExileLifeClientMurdererCam = [[],ExileLifeClientSpawnMurdererPos,"Murderer"] call ExileLifeClient_gui_spawnCam_createUnit;
	ExileLifeClientThugCam = [[],ExileLifeClientSpawnThugPos,"Thug"] call ExileLifeClient_gui_spawnCam_createUnit;
	ExileLifeClientThiefCam setDir 42; 
	ExileLifeClientSmugglerCam setDir 46;
	ExileLifeClientMurdererCam setDir 45; 
	ExileLifeClientThugCam setDir 54;
if (((date select 3)) < 8 || ((date select 3) > 16)) then  
{ 
	ExileLifeClientThiefCamLight = "#lightpoint" createVehicleLocal ExileLifeClientThiefCamLightPos; 
	ExileLifeClientThiefCamLight setLightBrightness 0.7; 
	ExileLifeClientThiefCamLight setLightAmbient [1.0, 1.0, 1.0]; 
	ExileLifeClientThiefCamLight setLightColor [1.0, 1.0, 1.0]; 
	ExileLifeClientSmugglerCamLight = "#lightpoint" createVehicleLocal ExileLifeClientSmugglerCamLightPos; 
	ExileLifeClientSmugglerCamLight setLightBrightness 0.4; 
	ExileLifeClientSmugglerCamLight setLightAmbient [1.0, 1.0, 1.0]; 
	ExileLifeClientSmugglerCamLight setLightColor [1.0, 1.0, 1.0]; 
	ExileLifeClientThugCamLight = "#lightpoint" createVehicleLocal ExileLifeClientThugCamLightPos; 
	ExileLifeClientThugCamLight setLightBrightness 0.5; 
	ExileLifeClientThugCamLight setLightAmbient [1.0, 1.0, 1.0]; 
	ExileLifeClientThugCamLight setLightColor [1.0, 1.0, 1.0]; 
	ExileLifeClientMurdererCamLight = "#lightpoint" createVehicleLocal ExileLifeClientMurdererCamLightPos; 
	ExileLifeClientMurdererCamLight setLightBrightness 0.7; 
	ExileLifeClientMurdererCamLight setLightAmbient [1.0, 1.0, 1.0]; 
	ExileLifeClientMurdererCamLight setLightColor [1.0, 1.0, 1.0]; 
};
	call ExileLifeClient_gui_spawnCam_switchClass;
	uisleep 2;
	createDialog "RscExileLifeClassSelectionChooseClass";
	_display = uiNameSpace getVariable ["RscExileLifeClassSelectionChooseClass", displayNull];
	_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
	_fade = [_display,1,0,[748502,748505,748506],2] spawn ExileLifeClient_gui_util_fade;
	call ExileLifeClient_gui_selectClass_stats_show;
	_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
