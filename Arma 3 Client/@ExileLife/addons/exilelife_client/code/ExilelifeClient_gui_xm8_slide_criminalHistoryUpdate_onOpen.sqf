/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistoryUpdate_onOpen
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_configPermissions","_recordsPermission","_wantedPermission","_armedPermission","_display","_currentCrime","_title","_text","_history","_historyList","_criminalRecordID","_listBoxCtrl","_items","_itemName","_quantity","_index","_lastScanned","_lastScannedCtrl","_lastScannedBy","_lastScannedByCtrl","_prisonerRecordName","_wantedCtrl","_wantedStatus","_armedCtrl","_armedStatus","_notepadCtrl","_dropDownCtrl","_dropDownIndex","_currentCrimeTitle","_crimeTitle","_fineArray","_jailArray"];
disableSerialization;
_configPermissions = missionConfigFile >> "CfgPlayer" >> "CfgExileLifeClasses" >> ExileLifeClientGang >> "Permissions";
_recordsPermission = ExileLifeClientRank in (getArray(_configPermissions >> "setRecords"));
_wantedPermission = ExileLifeClientRank in (getArray(_configPermissions >> "setWanted"));
_armedPermission = ExileLifeClientRank in (getArray(_configPermissions >> "setArmed"));
try{
    if !(_recordsPermission)exitWith{
        ['CriminalHistory', 1] call ExileClient_gui_xm8_slide;
    };
    if(isNil "ExileLifeCurrentCrimeIndex" || ExileLifeCurrentCrimeMaxIndex < 0)then{
        throw false;
    };
    if((count ExileLifeCriminalRecord < 4) || (count ExileLifeCriminalRecordID < 2))then{
        throw false;
    };
}catch{
    ['CriminalHistory', 1] call ExileClient_gui_xm8_slide;
};
ExileLifeInfraction = ["",[],0,0,"",[0,[0,0,0]],[0,[0,0,0]],-1];
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
(_display displayCtrl IDC_EXILE_XM8_SLIDE_CRIMINAL_HISTORY_UPDATE_RECORDS_LISTBOX) ctrlSetText "";
{
    (_display displayCtrl _x) ctrlsetText "";
}forEach[
    5326,
    5316,
    5333,
    5318
];
_currentCrime = (ExileLifeCriminalRecordsList select ExileLifeCurrentCrimeIndex);
_title = "";
_text = "";
_history = [];
if (_currentCrime isEqualTo [])then{
    ['CriminalHistory', 1] call ExileClient_gui_xm8_slide;
};
_historyList = _currentCrime select 2;
if (_historyList isEqualTo [])exitWith{
    ['CriminalHistory', 1] call ExileClient_gui_xm8_slide;
};
_history = _historyList select 0;
if (_history isEqualTo [])exitWith{
    ['CriminalHistory', 1] call ExileClient_gui_xm8_slide;
};
ExileLifeOldInfraction = [_history select 0, _history select 9];
_criminalRecordID = _currentCrime select 0;
ExileLifeInfraction set [7, _criminalRecordID];
_listBoxCtrl = _display displayCtrl 5316;
lbClear _listBoxCtrl;
_items = +(_history select 4);
{
    _itemName = _x select 0;
    _quantity = _x select 1;
	_index = _listBoxCtrl lbAdd format["%1",_itemName];
	_listBoxCtrl lbSetTextRight [_index,format["%1",_quantity]];
	_listBoxCtrl lbSetData [_index, str([_itemName,_quantity])];
}forEach _items;
ExileLifeInfraction set [1,_items];
_lastScanned = (ExileLifeCriminalRecord select 0) call ExileLifeClient_util_time_dbTimetoString; 
_lastScannedCtrl = (_display displayCtrl 5308);
_lastScannedCtrl ctrlShow true;
_lastScannedCtrl ctrlSetText _lastScanned;
_lastScannedCtrl ctrlCommit 0;
_lastScannedBy = ExileLifeCriminalRecord select 1;
_lastScannedByCtrl = (_display displayCtrl 5310);
_lastScannedByCtrl ctrlShow true;
_lastScannedByCtrl ctrlSetText _lastScannedBy;
_lastScannedByCtrl ctrlCommit 0;
_prisonerRecordName = _display displayCtrl 5311;
_prisonerRecordName ctrlSetText format["%1 (%2)",ExileLifeCriminalRecordID select 1,ExileLifeCriminalRecordID select 0];
_wantedCtrl = (_display displayCtrl 5304);
_wantedStatus = ExileLifeCriminalRecord select 2;
if(_wantedStatus == 1)then{
    _wantedCtrl ctrlSetTextColor [225/255, 65/255, 65/255, 1];
};
if !(_wantedPermission)then{
    _wantedCtrl ctrlEnable false;
};
_wantedCtrl ctrlCommit 0;
_armedCtrl = (_display displayCtrl 5305);
_armedStatus = ExileLifeCriminalRecord select 3;
if(_armedStatus == 1)then{
    _armedCtrl ctrlSetTextColor [225/255, 65/255, 65/255, 1];
};
if !(_armedPermission)then{
    _armedCtrl ctrlEnable false;
};
_armedCtrl ctrlCommit 0;
_notepadCtrl = _display displayCtrl 5326;
_notepadCtrl ctrlsetText (_history select 5);
ExileLifeInfraction set [4, _history select 5];
_dropDownCtrl = _display displayCtrl 5322;
lbclear _dropDownCtrl;
_dropDownIndex = 0;
_currentCrimeTitle = _history select 1;
{
    _crimeTitle = _x select 0;
    _fineArray = _x select 1;
    _jailArray = _x select 2;
    _index = _dropDownCtrl lbAdd _crimeTitle;
    _dropDownCtrl lbSetData [_index, str(_x)];
    if (_crimeTitle == _currentCrimeTitle)then{
        _dropDownIndex = _index;
    };
}forEach getArray(missionConfigFile >> "CfgLaws" >> "offences");
_dropDownCtrl lbSetCurSel _dropDownIndex; 
5329 call ExileLifeClient_gui_xm8_slide_criminalHistoryUpdate_event_setCrimeStats;
true
