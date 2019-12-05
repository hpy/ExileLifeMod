/**
                    * ExilelifeClient_system_process_resetVar
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    ExileLifeDebug = true;
if (isNil "ExileLifePlayerJoinedAlready") then
{
	ExileLifePlayerJoinedAlready = false;
};
UberJobsQueue = [];
handleDamageDelay = 0;
ExileLifeClientEscortPlayerChk = -1;
ExileLifeActionMenu = false;
ExileLifeClientInteractionChk = false;
ExileLifeClientXM8IsVisible = false;
ExileLifeClientXM8IsPowerOn = false;
ExileLifeClientXM8NextPossiblePowerToggleTime = diag_tickTime;
ExileLifeClientXM8CurrentSlide = "apps";
ExileLifeClientXM8IsMessageVisible = false;
ExileLifeClientXM8IsWarningVisible = false;
ExileLifeClientXM8IsConfirmVisible = false;
ExileLifeClientXM8InputBoxFocused = false;
ExileLifeClientXM8XM8APP1 = false;
ExileLifeClientXM8XM8APP2 = false;
ExileLifeClientXM8XM8APP3 = false;
ExileLifeClientXM8XM8APP4 = false;
ExileLifeClientXM8XM8APP5 = false;
ExileLifeClientXM8XM8APP6 = false;
ExileLifeClientXM8XM8APP7 = false;
ExileLifeClientXM8XM8APP8 = false;
ExileLifeClientXM8XM8APP9 = false;
ExileLifeClientXM8XM8APP10 = false;
ExileLifeClientXM8XM8APP11 = false;
ExileLifeClientXM8XM8APP12 = false;
ExileLifeClientXM8XM8APP13 = false;
ExileLifeClientXM8XM8APP14 = false;
ExileLifeHasLock = false;
ExileLifeClientSpecialInteractionObject = false;
ExileLifeClientPlayerLastRefineryZoneCheckAt = 0;
ExileLifeClientPlayerLastResourceZoneCheckAt = 0;
ExileLifeClientPlayerLastGangZoneCheckAt = 0;
ExileLifeClientPlayerLastPrisonZoneCheckAt = 0;
ExileLifeClientGangZone = false;
ExileLifeClientResourceZone = false;
ExileLifeClientRefineryZone = false;
ExileLifeClientPrisonZone = false;
ExileLifeResourceZone = "";
ExileLifeResourceType = "";
ExileLifeRefineryType = "";
ExileLifeGangTerritory = "";
ExileLifeClientHeartBeatThread = -1;
ExileLifePoison = -1;
ExileLifeFruitTree = [];
ExileLifeShiftState = false;
ExileLifeCurrentWeapon = "";
ExileLifeAnimalSpawnChk = diag_tickTime;
ExileLifeFishingBerley = false;
ExileLifeClientInteractionObject = objNull;
ExileLifeClientInteractionHandles = [];
ExileLifeClientInteractionName = "";
ExileLifeNearestAction = [];
ExileLifeClientCamTimer = false;
ExileLifeHouses = getArray(missionconfigFile >> "CfgHousing" >> worldname >> "Houses");
ExileLifeClientFadeControl = false;
ExileLifeTypeText2 = false; 
ExileLifeClientDigHoeTimer = -1;
ExileLifeClientDigHoeCount = 0;
ExileLifeClientSpamProtection = 0; 
ExileLifeDoPoo = false;
ExileLifeDoPooTimer = 0;
ExileLifeCannotBuild = false;
ExileLifeConstructionColor = [];
ExileLifeSittingDown = false;
ExileLifeClientPrisonAllowance = -1;
ExileLifeClientAllowanceRequest = false;
ExileLifeClientAllowanceRequest = false;
ExileLifeClientGangAllowance = -1;
ExileLifeActionRepeatOverride = false;
ExileLifeClientPlayerIsBleeding = false;
ExileLifeClientLastBleedUpdateAt = -1;
ExileLifeClientBleedingCountDownEnd = -1;
ExileLifeClientBleedOutRate = 0.01;
ExileLifeClientPlayerDamage = 0;
ExileLifeClientPlayerIsUnconscious = false;
ExileLifeClientLastUnconsciousUpdateAt = -1;
ExileLifeClientUnconsciousCountDownEnd = -1;
ExileLifeClientUnconsciousFadeUpdateAt = -1;
ExileLifeClientPlayerIsPartlyUnconscious = false;
ExileLifeClientPlayerIsPartlyUnconsciousCountDownEnd = -1;
ExileLifeWaitASecondOrTwo = -1; 
ExileLifeClientUnconsciousFade = false;
ExileLifeClientCamTimer	= false;
ExileLifeBlackMarketSelectedClassname = "";
ExileLifeBlackMarketInventory = [];
ExileLifePrimaryWeaponJammed 			= "";
ExileLifeHandgunWeaponJammed 			= "";
ExileLifeReloadInProgress 				= false;
ExileLifeGasMaskTimeLastRemovedAt		= diag_tickTime;
ExileLifePlayerHearingLossActive		= false;
ExileLifePlayerLastLostHearing 			= diag_tickTime;
ExileLifeHearingLossTimeout				= 0;
ExileLifePlayerLastLostHearingPlayed  	= diag_tickTime;
ExileLifeClientIsPlayerForcedWalking 	= false;
ExileLifeClientRadiationProtected		= false;
ExileLifeClientCanPlayerClimbOrDrop		= true;
ExileLifeClientThreadKeepFromTurning    = -1;
ExileLifeNoGasMaskNextSoundAt			= 0;
ExileLifeProcessedBloodVials			= [];
if !(isNil "ExileLifeJobTaskClearQueue") then {
	{
		player removeSimpleTask _x;
	}
	forEach ExileLifeJobTaskClearQueue;
};
if !(isNil "ExileLifeCurrentJobTaskMarker") then {
	if !(ExileLifeCurrentJobTaskMarker isEqualTo "") then
	{
		removeMissionEventHandler ["Draw3D",ExileLifeCurrentJobTaskMarker];
	};
};
ExileLifeSelectedJobBoard = [];
ExileLifeParentJobTask ="";
ExileLifeCurrentJobTask = "";
ExileLifeCurrentJobTaskMarker = "";
ExileLifeJobBoard = [];
ExileLifeJobsBoardThread = -1;
ExileLifeJobBoard_Current = [];
ExileLifeCurrentJob = [];
ExileLifeFailedJobs = [];
ExileLifeCompletedJobs = [];
ExileLifeJobTaskClearQueue = [];
ExileLifeJobManagmentIsOpen = false;
ExileLifeUberJobID = "";
ExileLifeLogs_Client_Debug = [];
ExileLifeVirtualGarage = [];
ExileClientPinCode = "";
ExileLifeHackCheck = false;
ExileLifeCurrentJobCanForfeit = true;
ExileLifeParentJobTaskLongDescription = "";
ExileLifeParentJobTaskShortDescription = "";
ExileLifeParentJobTaskShortName = "";
ExileLifeJumpInProgress = false;
ExileLifeMeleeInProgress = false;
ExileLifeClientPlayerNames = [];
ExileLifeStringedDiks = [];
ExileLifeForbiddenStringedDiks = [];
ExileLifeKeybindsUp = locationNull;
ExileLifeKeybindsDown = locationNull;
ExileLifeActiveKeyDown = [];
ExileLifeActiveKeyUp = [];
ExileLifeKeybindLastSelected = "";
ExileLifeKeybindWaitingForKeypress = false;
ExileLifeKeybindModifingID = "";
ExileLifeKeybindModified = [];
ExileLifeKeybindCurrentBinds = [];
ExileLifeKeybindActiveBinds = [[],[]];
ExileLifeNotifications = [];
ExileLifeClientCharacterInfoDone = false;
ExileLifeCharacterInfoKnown = nil;
ExileLifeCharacterInfo = [];
ExileLifeMessages = [[],[]];
ExileLifeGangStats = [["Mafia",0],["Cartel",0],["Yakuza",0],["Syndicate",0],["Guard",0],["Rogue",0]];
ExileLifeGangStatsUpdateTime = 0;
ExileLifeCharacter2 = false;
ExileLifeClientSpawnPlayer1CamPos = [13492.5,12170.3,1.4]; 
ExileLifeClientSpawnPlayer2CamPos = [13494.7,12177,1.8]; 
ExileLifeClientSpawnPlayer1CamLightPos = [13483.3,12171.4,5]; 
ExileLifeClientSpawnPlayer2CamLightPos = [13494.7,12177,5]; 
ExileLifeClientSpawnStartPos = [13390,12162.4,0];
ExileLifeClientSpawnPlayerCamPlayerPos1 = [13494.1,12168.4,0.00172082];
ExileLifeClientSpawnPlayerCamPlayerPos2 = [13497.8,12175.4,0.00187585];
ExileLifeClientSpawnThiefPos = [13489.8,12138.4,0.570559];
ExileLifeClientSpawnSmugglerPos = [13486.5,12139.8,1.0277];
ExileLifeClientSpawnMurdererPos = [13480.2,12142.7,1.89858];
ExileLifeClientSpawnThugPos = [13476.9,12145.1,2.40585];
ExileLifeClientSmugglerCamPos = [13488.3,12142.5,3];
ExileLifeClientThiefCamPos = [13491.6,12142,2.2];
ExileLifeClientThugCamPos = [13480.7,12146.8,3.6];
ExileLifeClientMurdererCamPos = [13484,12145.2,3.4];
ExileLifeClientSmugglerCamLightPos = [13488.3,12142.5,3];
ExileLifeClientThiefCamLightPos = [13491.6,12142,2.2];
ExileLifeClientThugCamLightPos = [13480.7,12146.8,3.8];
ExileLifeClientMurdererCamLightPos = [13484,12145.2,3.4];
ExileLifeCriminalRecord = [];
ExileLifeCriminalRecordID = [];
ExileLifeCriminalRecordsList = [];
ExileLifeCriminalRecordsFines = [];
