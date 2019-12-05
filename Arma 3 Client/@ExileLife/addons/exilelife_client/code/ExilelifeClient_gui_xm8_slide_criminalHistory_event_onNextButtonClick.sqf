/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistory_event_onNextButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display"];
if(ExileLifeCurrentCrimeIndex==ExileLifeCurrentCrimeMaxIndex)exitWith{};
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
ExileLifeCurrentCrimeIndex = ExileLifeCurrentCrimeIndex + 1;
if(ExileLifeCurrentCrimeIndex > 0)then{
    (_display displayCtrl 4168) ctrlShow true;
    (_display displayCtrl 4168) ctrlEnable true;
}else{
    (_display displayCtrl 4168) ctrlEnable false;
};
if(ExileLifeCurrentCrimeIndex < ExileLifeCurrentCrimeMaxIndex)then{
    (_display displayCtrl 4167) ctrlShow true;
    (_display displayCtrl 4167) ctrlEnable true;
}else{
    (_display displayCtrl 4167) ctrlEnable false;
};
(_display displayCtrl 4159) ctrlSetText format["%1/%2",(ExileLifeCurrentCrimeMaxIndex min ExileLifeCurrentCrimeIndex) + 1,ExileLifeCurrentCrimeMaxIndex + 1];
4160 call ExileLifeClient_gui_xm8_slide_criminalHistory_event_showCrimeStats;
true
