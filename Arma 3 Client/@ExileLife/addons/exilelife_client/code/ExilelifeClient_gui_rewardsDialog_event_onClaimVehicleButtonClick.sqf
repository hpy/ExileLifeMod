/**
                    * ExilelifeClient_gui_rewardsDialog_event_onClaimVehicleButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialog","_rewardsLB","_edit","_pin","_selectedRewardsLBIndex","_vehicleClassName"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLifeRewardsDialog", displayNull];
_rewardsLB = _dialog displayCtrl 2003;
_edit = _dialog displayCtrl 3003;
_pin = ctrlText _edit;
_selectedRewardsLBIndex = lbCurSel _rewardsLB;
if !(_selectedRewardsLBIndex isEqualTo -1) then
{
	_vehicleClassName = _rewardsLB lbData _selectedRewardsLBIndex;
	if !(_vehicleClassName isEqualTo "") then
	{
		if (_vehicleClassName isKindOf "AllVehicles") then 
		{
			closeDialog 0;
			if (count _pin != 4) exitWith {
				["ErrorTitleAndText", ["Vehicle Claim Aborted", "Pin not 4 characters."]] call ExileClient_gui_toaster_addTemplateToast;
			};
			["claimVehicleRequest", [_vehicleClassName,_pin]] call ExileClient_system_network_send;
		};
	};
};