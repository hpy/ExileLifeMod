/**
                    * ExilelifeClient_gui_chemlab_mixing_cam_create
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_mixingCamAimPosModel","_mixingCamAimPosWorld","_mixingCamPosModel","_mixingCamPosWorld","_headpos"];
if !(ExileClientInteractionObject getVariable ["ChemLab",false]) exitWith {};
_mixingCamAimPosModel  = ExileClientInteractionObject selectionPosition ["mixing", "memory"];
_mixingCamAimPosWorld = ExileClientInteractionObject modelToWorld _mixingCamAimPosModel;
_mixingCamPosModel  = [0.95,-0.48,0.843883];
_mixingCamPosWorld = ExileClientInteractionObject modelToWorld _mixingCamPosModel;
_headpos = player modelToWorld (player selectionPosition "head");
ExileLifeClientChemLabPlayerCam = "camera" camCreate _headpos;
ExileLifeClientChemLabPlayerCam cameraeffect ["internal", "back"];
showcinemaBorder false;
ExileLifeClientChemLabPlayerCam camPrepareTarget _mixingCamAimPosWorld;
ExileLifeClientChemLabPlayerCam camPrepareFOV 0.4;
ExileLifeClientChemLabPlayerCam camCommitPrepared 0;
ExileLifeClientChemLabPlayerCam camSetPos _mixingCamPosWorld;
ExileLifeClientChemLabPlayerCam camCommitPrepared 1.5;
waitUntil {camCommitted ExileLifeClientChemLabPlayerCam};
call ExileLifeClient_gui_chemlab_mixing_show;
