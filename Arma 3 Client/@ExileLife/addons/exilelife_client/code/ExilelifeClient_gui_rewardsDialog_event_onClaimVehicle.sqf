/**
                    * ExilelifeClient_gui_rewardsDialog_event_onClaimVehicle
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialog","_itemClassName","_background","_title","_claim","_edit"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLifeRewardsDialog", displayNull];
_itemClassName = _this;
if(_itemClassName isKindOf "AllVehicles") then {
	_background = _dialog displayCtrl 3000;
	_title = _dialog displayCtrl 3001;
	_claim = _dialog displayCtrl 3002;
	_edit = _dialog displayCtrl 3003;
	{
		_x ctrlEnable true;
		_x ctrlShow true;
		_x ctrlSetFade 0;
		_x ctrlCommit 0;
	} forEach [_background,_title,_edit,_claim];
} else {
	["ErrorTitleAndText", ["Vehicle Claim Aborted", "Not a valid Vehicle"]] call ExileClient_gui_toaster_addTemplateToast;
};