/**
                    * ExilelifeClient_system_allowance_network_allowanceResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_message","_success"];
_message = _this select 0;
_success = _this select 1;
ExileLifeClientAllowanceRequest = false;
if !(ExileLifeClientPaymentMSGS) exitWith {};
if (_success) then 
{
	["InfoTitleAndText", _message] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["ErrorTitleAndText", _message] call ExileClient_gui_toaster_addTemplateToast;
};
