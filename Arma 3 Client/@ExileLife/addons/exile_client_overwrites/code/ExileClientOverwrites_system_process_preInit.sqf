/**
                    * ExileClientOverwrites_system_process_preInit
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    CBA_fnc_globalSay = compileFinal "true";
CBA_fnc_globalExecute = compileFinal "true";
CBA_fnc_globalSay3D = compileFinal "true";
CBA_fnc_globalEvent = compileFinal "true";
CBA_fnc_createMarker = compileFinal "true";
if (hasInterFace) then
{
	if (uiNameSpace getVariable ["ExileNeedsPreloading", true]) then
	{
		[] spawn
		{
			"Preloading materials..." call ExileClient_util_log;
			waitUntil {10 preloadObject "Exile_Preloader"};
			"Preloading completed!" call ExileClient_util_log;
			uiNameSpace setVariable ["ExileNeedsPreloading", false];
		};
	};
};
if (missionName isEqualTo "ExileIntro") then
{
	"Intro PreInit..." call ExileClient_util_log;
}
else
{
	if (hasInterface) then
	{
		"Client PreInit..." call ExileClient_util_log;
		ExileClientSessionId = "";
		ExileClientIsWaitingForInventoryMoneyTransaction = false;
		ExileClientLastDiedPlayerObject = objNull;
		ExileClientSafeZoneVehicle = objNull;
		ExileClientIsWaitingForServerTradeResponse = false;
		ExileClientPlayerLastSafeZoneCheckAt = 0;
		ExileClientPartyMapMarkers = [];
		ExilePartyEspMode = 0;
		ExileClientPlayerIsInSecurityCamera = false;
		ExileClientBush = objNull;
		ExileClientIsInBush = false;
		ExileClientIsHandcuffed = false;
		ExileClientBreakFreeActionHandle = -1;
		ExileClientHostageTaker = objNull;
		ExileClientAllowPartyMarkers = (getNumber (missionConfigFile >> "CfgExileParty" >> "showESP")) isEqualTo 1;
		ExileIsPlayingRussianRoulette = false;
		ExileRussianRouletteHudVisible = false;
		ExileRussianRouletteChair = objNull;
		ExileRussianRouletteCountDownThread = -1;
		ExileRussianRouletteCanEscape = false;
		ExileRussianRouletteNextShotIsFatal = false;
		ExileClientEnvironmentTemperature = 20;
		ExileClientLastTemperatureUpdateAt = diag_tickTime;
		ExileClientCurrentAnimal = objNull;
		ExileClientGasMaskVisible = false;
		ExileClientToasts = [];
		ExileClientToastAreaVisible = false;
		ExileClientLastToastTickAt = diag_tickTime;
		ExileBaguetteIsVisible = false;
		ExileClientBaguetteAreaVisible = false;
		ExileClientXM8IsVisible = false;
		ExileClientXM8IsPowerOn = false;
		ExileClientXM8NextPossiblePowerToggleTime = diag_tickTime;
		ExileClientXM8CurrentSlide = "extraApps";
		ExileClientXM8Page = 0;
		ExileClientXM8IsMessageVisible = false;
		ExileClientXM8IsWarningVisible = false;
		ExileClientXM8IsConfirmVisible = false;
		ExileClientXM8InputBoxFocused = false;
		ExileClientLoginHasPlayerResponse = nil;
		ExileClientSkipNextRespawnEvent = true;
		ExileClientBleedOutThread = -1;
		ExileLifeClientUnconsciousThread = -1;
		ExileClientLastLocation = "";
		ExileClientIsAutoRunning = false;
		ExileClientLastTakeAllAt = diag_tickTime;
		ExileClientPartyID = -1;
		ExileClientPendingPartyInvitionGroup = objNull;
		ExileClientPendingClanInvite = [];
		ExileClientClanInfo = [];
		ExileClinetInClan = 0;
		ExileClientCurrentInventoryContainer = objNull;
		ExileClientCurrentInventorySecondaryContainer = objNull;
		ExilePlayerInSafezone = false;
		ExileClientLastVehicle = objNull;
		ExileClientEndBambiStateThread = -1;
		ExileClientDeliriumThread = -1;
		ExileClientServerIsInitializing = false;
		ExileClientSelectedInventoryItem = nil;
		ExileClientPlayerIsSpawned = false;
		ExileClientLastStatusIconBlinkAt = diag_tickTime;
		ExileClientStatusIconsVisible = false;
		ExileClientInventoryOpened = false;
		ExileClientShowHUDDetails = false;
		ExileClientPlayerIsInjured = false;
		ExileClientEarplugsInserted = false;
		ExileClientBulletCamShouldBeVisible = false;
		ExileClientBulletCamIsVisible = false;
		ExileClientBulletCamera = nil;
		ExileClientBulletCameraThread = nil;
		ExileClientInteractionObject = objNull;
		ExileClientInteractionHandles = [];
		ExileClientInteractionLastHookTime = 0;
		ExileClientConstructionMode = 1;
		ExileClientConstructionConfig = objNull;
		ExileClientConstructionShowHint = true;
		ExileClientIsInConstructionMode = false; 
		ExileClientConstructionOffset = [0, 5, 1];
		ExileClientConstructionPosition = [0, 0, 0];
		ExileClientConstructionRotation = 0;
		ExileClientConstructionStartPosition = [0, 0, 0];
		ExileClientConstructionObject = objNull; 
		ExileClientConstructionKitClassName = ""; 
		ExileClientConstructionObjectDisplayName = ""; 
		ExileClientConstructionResult = 0;
		ExileClientConstructionProcess = 0;
		ExileClientConstructionBoundingRadius = 0;
		ExileClientConstructionPossibleSnapPositions = [];
		ExileClientConstructionSnapToObjectClassNames = [];
		ExileClientConstructionSupportSnapMode = false;
		ExileClientConstructionIsSnapped = false;
		ExileClientConstructionCanPlaceObject = false;
		ExileClientConstructionCurrentSnapToObject = objNull;
		ExileClientConstructionIsInSelectSnapObjectMode = false;
		ExileClientConstructionModePhysx = false;
		ExileClientConstructionLock = false;
		ExileClientConstructionGrid = [1, 1, 0.25];
		ExileClientNotificationQueue = [];
		ExileClientNotificationSlides = [0,1,2,3,4,5,6,7,8,9];
		ExileClientNotificationIsShown = false;
		ExileClientNotificationRun = diag_tickTime;
		ExileLockIsShown = false;
		ExileClientLastDeathMarker = "";
		ExileDisplayCurrentLimits = [];
		ExileClientHungerDecay = (getNumber(missionConfigFile >> "CfgPlayer" >> "hungerDecay") * 60);
		ExileClientThirstDecay = (getNumber(missionConfigFile >> "CfgPlayer" >> "thirstDecay") * 60);
		ExileClientHealthDecay = getNumber(missionConfigFile >> "CfgPlayer" >> "healthDecay");
		ExileClientThirstRegen = getNumber(missionConfigFile >> "CfgPlayer" >> "thirstRegen");
		ExileClientHungerRegen = getNumber(missionConfigFile >> "CfgPlayer" >> "hungerRegen");
		ExileClientRecoveryAmmount = (getNumber(missionConfigFile >> "CfgPlayer" >> "recoveryPerMinute") / 100);
		ExileCameraSystemBase = objNull;
		ExileCameraRightClickDown = false;
		ExileClientCameraObject = objNull;
		ExileClientCameraParrentObject = objNull;
		ExileClientCameraNVG = false;
		ExileGuiControlClick = false;
		ExileClientActionDelayShown = false;
		ExileClientActionDelayAbort = false;
		ExileClientClanInfo = [];
		ExileClientMapKeyUpEH = -1;
		ExileClientMapPositionClick = [0,0];
		ExileClientBreachingChargePlanted = false;
		ExileCurrentBreachingObject = objNull;
		ExileClientLastBreach = 0;
		ExileClientWaypoints = [];
		ExileBaguetteIsVisible = false;
		ExileClientAllowedSpectate = [];
		ExileClientCanSpectate = [];
		ExileClientPlayerIsSpectating = false;
		[] call ExileClient_object_player_stats_reset;
		[] call ExileClient_gui_postProcessing_initialize;
		[] call ExileClient_gui_hud_event_hook;
		[] call ExileClient_system_thread_initialize;
		if (isMultiplayer) then
		{
			if !(getRemoteSensorsDisabled) then
			{
				disableRemoteSensors true;
			};
			[] spawn
			{
				waitUntil { !(isNull player) };
				[] execFSM "exilelife_client\fsm\login.fsm";
				true
			};
		}
		else
		{
		};
	};
};
true
