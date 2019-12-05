/**
                    * ExilelifeClient_gui_farming_seedSelection_onLoad
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_pic","_plantButton"];
disableSerialization;
ExileLifeSelectedSeed = "";
createDialog "RscExileLifeSeedSelectionDialog";
waitUntil
{
	!isNull (findDisplay 20100);
};
_display = uiNameSpace getVariable ["RscExileLifeSeedSelectionDialog", displayNull];
_pic = _display displayCtrl 20107;
ctrlSetFocus _pic;
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
_plantButton = _display displayCtrl 20110;
_plantButton ctrlRemoveAllEventHandlers "ButtonClick";
_plantButton ctrlSetEventHandler ["ButtonClick","call ExileLifeClient_gui_farming_seedSelection_event_onButtonClick"];
call ExileLifeClient_gui_farming_seedSelection_event_onInventoryUpdate;
waitUntil
{
	isNull (findDisplay 20100);
};
false call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
ExileLifeSelectedSeed