/**
                    * ExilelifeClient_gui_xm8_slide_settings_event_onShowPaymentMessagesChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_cambo"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_cambo = _display displayCtrl 5016;
profileNamespace setVariable ["ExileLifePaymentMsgs", ((lbCurSel _cambo) isEqualTo 0)];
if (profileNameSpace getVariable ["ExileLifePaymentMsgs", true]) then
{
	ExileLifeClientPaymentMSGS = true;
}
else 
{
	ExileLifeClientPaymentMSGS = false;
};
