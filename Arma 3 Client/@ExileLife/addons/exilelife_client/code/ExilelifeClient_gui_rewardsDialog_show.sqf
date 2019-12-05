/**
                    * ExilelifeClient_gui_rewardsDialog_show
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialog","_dropdown","_claim","_index","_nearVehicles","_background","_title","_claimCode","_edit"];
disableSerialization;
createDialog "RscExileLifeRewardsDialog";
waitUntil { !isNull findDisplay 57347 };
_dialog = uiNameSpace getVariable ["RscExileLifeRewardsDialog", displayNull];
_dropdown = _dialog displayCtrl 2005;
_claim = _dialog displayCtrl 2004;
lbClear _dropdown;
_index = _dropdown lbAdd "Player";
_dropdown lbSetValue [_index, 1];
_dropdown lbSetCurSel 0;
_nearVehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], 80];
{
	if (local _x) then
	{
		if (alive _x) then
		{
			_index = _dropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
			_dropdown lbSetData [_index, netId _x];
			_dropdown lbSetValue [_index, 2];
		};
	};
}
forEach _nearVehicles;
_dropdown ctrlEnable false;
_claim ctrlEnable false;
_dropdown ctrlCommit 0;
_claim ctrlCommit 0;
_background = _dialog displayCtrl 3000;
_title = _dialog displayCtrl 3001;
_claimCode = _dialog displayCtrl 3002;
_edit = _dialog displayCtrl 3003;	
{
	_x ctrlEnable false;
	_x ctrlShow false;
	_x ctrlSetFade 1;
	_x ctrlCommit 0;
} forEach [_background,_title,_edit,_claimCode];
if(isNil "ExileLifeClientPlayerRewards") then {
	["hasRewardsRequest"] call ExileClient_system_network_send;
};
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
call ExileLifeClient_gui_rewardsDialog_updateListBox;
true