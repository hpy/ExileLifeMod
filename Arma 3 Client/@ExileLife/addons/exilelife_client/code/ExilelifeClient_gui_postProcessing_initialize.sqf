/**
                    * ExilelifeClient_gui_postProcessing_initialize
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    ExileClientPostProcessingColorCorrections = ppEffectCreate ["colorCorrections", 1500];
ExileClientPostProcessingColorCorrections ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0.39, 0.32, 0.25, 1], [0.5,0.5,0.5,0], [0,0,0,0,0,0,4]]; 
ExileClientPostProcessingColorCorrections ppEffectCommit 0;
ExileClientPostProcessingColorCorrections ppEffectEnable true;
ExileClientPostProcessingBorderVignette = ppEffectCreate ["colorCorrections", 1502];
ExileClientPostProcessingBorderVignette ppEffectAdjust [0.7,1,-0.2,[0,0,0,0],[1,1,1,1],[0,0,0,0],[0.85,0.85,0,0,0,0,4]];
ExileClientPostProcessingBorderVignette ppEffectCommit 0;
ExileClientPostProcessingBorderVignette ppEffectEnable false;
ExileClientPostProcessingBackgroundBlur = ppEffectCreate ["dynamicBlur", 401];
ExileClientPostProcessingBackgroundBlur ppEffectAdjust [1];
ExileClientPostProcessingBackgroundBlur ppEffectCommit 0;
ExileClientPostProcessingBackgroundBlur ppEffectEnable false;
ExileClientPostProcessingDelirium = ppEffectCreate ["wetDistortion", 301];
ExileClientPostProcessingDelirium ppEffectAdjust [2, 0.1, 0.1, 0.2, 0.2, 2, 2, 0.01, 0.01, 0.01, 0.01, 0.01, 0.1, 2, 2];
ExileClientPostProcessingDelirium ppEffectCommit 0;
ExileClientPostProcessingDelirium ppEffectEnable false;
ExileClientPostProcessingSecurityCameraFilmGrain = ppEffectCreate ["FilmGrain",2000];
ExileClientPostProcessingSecurityCameraFilmGrain ppEffectAdjust [0.4,3.5,5,0.6,0.6,true];
ExileClientPostProcessingSecurityCameraFilmGrain ppEffectCommit 0;
ExileClientPostProcessingSecurityCameraFilmGrain ppEffectEnable false;
ExileLifeClientPostProcessingLSD = ppEffectCreate ["ColorInversion", 501];
ExileLifeClientPostProcessingLSD ppEffectAdjust [random 1,random 1,random 1]; 
ExileLifeClientPostProcessingLSD ppEffectCommit 1;
ExileLifelientPostProcessingLSD ppEffectEnable false;
ExileLifeClientPostProcessingColor = ppEffectCreate["ColorCorrections",100];
ExileLifeClientPostProcessingColor ppEffectCommit 3;
ExileLifeClientPostProcessingColor ppEffectEnable true;
ExileLifeClientPostProcessingColor ppEffectAdjust[1,1,0,[1,1,1,0],[1,1,1,0.0],[1,1,1,1.0]];
ExileLifeClientPostProcessingColor ppEffectCommit 3;
ExileLifeClientPostProcessingColor ppEffectEnable false;
ExileLifeClientPostProcessingBlur = ppEffectCreate["dynamicBlur",200];
ExileLifeClientPostProcessingBlur ppEffectEnable true;
ExileLifeClientPostProcessingBlur ppEffectAdjust[0.5];
ExileLifeClientPostProcessingBlur ppEffectCommit 3;
ExileLifeClientPostProcessingBlur ppEffectEnable false;
ExileLifeClientPostProcessingInversion = ppEffectCreate["colorInversion",300];
ExileLifeClientPostProcessingInversion ppEffectEnable true;
ExileLifeClientPostProcessingInversion ppEffectAdjust[1,1,1];
ExileLifeClientPostProcessingInversion ppEffectCommit 3;
ExileLifeClientPostProcessingInversion ppEffectEnable false;
ExileLifeClientPostProcessingGrain = ppEffectCreate["filmGrain",400];
ExileLifeClientPostProcessingGrain ppEffectEnable true;
ExileLifeClientPostProcessingGrain ppEffectAdjust[0.02,1,1,0,1];
ExileLifeClientPostProcessingGrain ppEffectCommit 3;
ExileLifeClientPostProcessingGrain ppEffectEnable false;
true