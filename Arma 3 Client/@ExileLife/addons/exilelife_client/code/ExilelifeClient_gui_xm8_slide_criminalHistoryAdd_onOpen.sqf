/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistoryAdd_onOpen
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_configPermissions","_recordsPermission","_wantedPermission","_armedPermission","_display","_listBoxCtrl","_lastScanned","_lastScannedCtrl","_lastScannedBy","_lastScannedByCtrl","_prisonerRecordName","_wantedCtrl","_wantedStatus","_armedCtrl","_armedStatus","_dropDownCtrl","_crimeTitle","_fineArray","_jailArray","_index"];
disableSerialization;
_configPermissions = missionConfigFile >> "CfgPlayer" >> "CfgExileLifeClasses" >> ExileLifeClientGang >> "Permissions";
_recordsPermission = ExileLifeClientRank in (getArray(_configPermissions >> "setRecords"));
_wantedPermission = ExileLifeClientRank in (getArray(_configPermissions >> "setWanted"));
_armedPermission = ExileLifeClientRank in (getArray(_configPermissions >> "setArmed"));
if !(_recordsPermission) exitWith{
    ['CriminalHistory', 1] call ExileClient_gui_xm8_slide;
};
ExileLifeInfraction = ["",[],0,0,"",[0,[0,0,0]],[0,[0,0,0]]];
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
(_display displayCtrl 5217) ctrlSetText "";
if((count ExileLifeCriminalRecord < 4) || (count ExileLifeCriminalRecordID < 2)) exitWith{[ExileExtraAppsHomePage, 1] call ExileClient_gui_xm8_slide;};
{
    (_display displayCtrl _x) ctrlsetText "";
}forEach[
    5228,
    5224,
    5223,
    5221
];
_listBoxCtrl = _display displayCtrl 5224;
lbClear _listBoxCtrl;
_lastScanned = (ExileLifeCriminalRecord select 0) call ExileLifeClient_util_time_dbTimetoString; 
_lastScannedCtrl = (_display displayCtrl 5207);
_lastScannedCtrl ctrlShow true;
_lastScannedCtrl ctrlSetText _lastScanned;
_lastScannedCtrl ctrlCommit 0;
_lastScannedBy = ExileLifeCriminalRecord select 1;
_lastScannedByCtrl = (_display displayCtrl 5209);
_lastScannedByCtrl ctrlShow true;
_lastScannedByCtrl ctrlSetText _lastScannedBy;
_lastScannedByCtrl ctrlCommit 0;
_prisonerRecordName = _display displayCtrl 5210;
_prisonerRecordName ctrlSetText format["%1 (%2)",ExileLifeCriminalRecordID select 1,ExileLifeCriminalRecordID select 0];
_wantedCtrl = (_display displayCtrl 5204);
_wantedStatus = ExileLifeCriminalRecord select 2;
if(_wantedStatus == 1)then{
    _wantedCtrl ctrlSetTextColor [225/255, 65/255, 65/255, 1];
};
if !(_wantedPermission)then{
    _wantedCtrl ctrlEnable false;
};
_wantedCtrl ctrlCommit 0;
_armedCtrl = (_display displayCtrl 5205);
_armedStatus = ExileLifeCriminalRecord select 3;
if(_armedStatus == 1)then{
    _armedCtrl ctrlSetTextColor [225/255, 65/255, 65/255, 1];
};
if !(_armedPermission)then{
    _armedCtrl ctrlEnable false;
};
_armedCtrl ctrlCommit 0;
_dropDownCtrl = _display displayCtrl 5227;
lbclear _dropDownCtrl;
{
    _crimeTitle = _x select 0;
    _fineArray = _x select 1;
    _jailArray = _x select 2;
    _index = _dropDownCtrl lbAdd _crimeTitle;
    _dropDownCtrl lbSetData [_index, str(_x)];
}forEach getArray(missionConfigFile >> "CfgLaws" >> "offences");
_dropDownCtrl lbSetCurSel 0;
5212 call ExileLifeClient_gui_xm8_slide_criminalHistoryAdd_event_setCrimeStats;
true
