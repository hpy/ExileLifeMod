/**
                    * ExilelifeClient_gui_keypadHack_show
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_ctrlButtonOK","_ctrlButtonCancel","_screenText","_fakeButton"];
disableSerialization;
ExileClientPinCodeLength = _this;
ExileClientPinCode = "";
createDialog "RscExileLifeHackKeypad";
waitUntil
{
	!isNull (findDisplay 24038);
};
_display = uiNameSpace getVariable ["RscExileLifeHackKeypad", displayNull];
_ctrlButtonOK = _display displayCtrl 4000;
_ctrlButtonCancel = _display displayCtrl 4002;
_screenText = _display displayCtrl 4001;
_screenText ctrlSetText "HASHCAT XL";
_fakeButton = _display displayCtrl 4013;
ctrlSetFocus _fakeButton;
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
_ctrlButtonCancel ctrlSetEventHandler ["ButtonClick","call ExileClient_gui_keypadDialog_event_onAbortButtonClick"];
[2] call ExileLifeClient_gui_keypadHack_updateControls;
waitUntil 
{
	isNull (findDisplay 24038);
};
false call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
if((count ExileClientPinCode) != ExileClientPinCodeLength)then
{
	ExileClientPinCode = "";
};
ExileClientPinCode