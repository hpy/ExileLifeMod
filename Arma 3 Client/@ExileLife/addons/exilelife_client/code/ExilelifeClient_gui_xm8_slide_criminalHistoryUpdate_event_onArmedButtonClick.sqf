/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistoryUpdate_event_onArmedButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_configPermissions","_display","_armedCtrl","_armedStatus"];
disableSerialization;
_configPermissions = missionConfigFile >> "CfgPlayer" >> "CfgExileLifeClasses" >> ExileLifeClientGang >> "Permissions";
if !(ExileLifeClientRank in (getArray(_configPermissions >> "setArmed")))exitWith{};
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_armedCtrl = (_display displayCtrl 5305);
_armedStatus = ExileLifeCriminalRecord select 3;
if(_armedStatus == 1)then{
    ExileLifeCriminalRecord set [3, 0];
    _armedCtrl ctrlSetTextColor [252/255, 253/255, 255/255, 1];
}else{
    ExileLifeCriminalRecord set [3, 1];
    _armedCtrl ctrlSetTextColor [225/255, 65/255, 65/255, 1];
};
_armedCtrl ctrlCommit 0;
ctrlSetFocus (_display displayCtrl 5216);
true
