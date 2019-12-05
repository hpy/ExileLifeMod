/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistoryAdd_event_onWantedButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_configPermissions","_display","_wantedCtrl","_wantedStatus"];
disableSerialization;
_configPermissions = missionConfigFile >> "CfgPlayer" >> "CfgExileLifeClasses" >> ExileLifeClientGang >> "Permissions";
if !(ExileLifeClientRank in (getArray(_configPermissions >> "setWanted")))exitWith{};
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_wantedCtrl = (_display displayCtrl 5204);
_wantedStatus = ExileLifeCriminalRecord select 2;
if(_wantedStatus == 1)then{
    ExileLifeCriminalRecord set [2, 0];
    _wantedCtrl ctrlSetTextColor [252/255, 253/255, 255/255, 1];
}else{
    ExileLifeCriminalRecord set [2, 1];
    _wantedCtrl ctrlSetTextColor [225/255, 65/255, 65/255, 1];
};
_wantedCtrl ctrlCommit 0;
ctrlSetFocus (_display displayCtrl 5216);
true
