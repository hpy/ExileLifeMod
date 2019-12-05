/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistory_event_onUpdate
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_enableBtns","_displayType","_lastScanned","_lastScannedBy","_wanted","_armed","_index","_history","_recentRecord","_fine","_prisonerRecordName"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if(isNil "ExileLifeCriminalRecord" || count ExileLifeCriminalRecord == 0)exitWith{
    call ExileLifeClient_gui_xm8_slide_criminalHistory_onOpen;
    (_display displayCtrl 4152) ctrlSetText "Invalid";
    (_display displayCtrl 4153) ctrlSetText "Invalid";
};
{
    (_display displayCtrl _x) ctrlShow true;
    (_display displayCtrl _x) ctrlSetTextColor [1, 1, 1, 1];
}forEach [
    4171,
    4172,
    4174,
    4175,
    4176,
    4166
];
(_display displayCtrl 4169) ctrlShow true;
(_display displayCtrl 4169) ctrlEnable true;
{
    (_display displayCtrl _x) ctrlShow true;
}forEach [
    4183,
    4184,
    4185
];
ExileLifeCurrentCrimeIndex = 0;
ExileLifeCurrentCrimeMaxIndex = (count ExileLifeCriminalRecordsList) - 1; 
_enableBtns = false;
if(ExileLifeCurrentCrimeMaxIndex > -1)then{
    _enableBtns = true;
};
{
    (_display displayCtrl _x) ctrlShow _enableBtns;
    (_display displayCtrl _x) ctrlEnable _enableBtns;
}
forEach [
    4163,
    4162,
    4161,
    4160
];
_displayType = 4160;
_lastScanned = (ExileLifeCriminalRecord select 0) call ExileLifeClient_util_time_dbTimetoString; 
_lastScannedBy = ExileLifeCriminalRecord select 1;
_wanted = ExileLifeCriminalRecord select 2; 
_armed = ExileLifeCriminalRecord select 3;
(_display displayCtrl 4155) ctrlShow true;
(_display displayCtrl 4155) ctrlSetTextColor [0.82, 0.82, 0.82, 1];
if(_armed != 0)then {
    (_display displayCtrl 4155) ctrlShow true;
    (_display displayCtrl 4155) ctrlSetTextColor [0.91, 0, 0, 1];
};
(_display displayCtrl 4154) ctrlShow true;
(_display displayCtrl 4154) ctrlSetTextColor [0.82, 0.82, 0.82, 1];
if(_wanted != 0)then {
    try {
        _index = 0;
        {
            _history = _x select 2;
            if !(_history isEqualTo [])then{
                _recentRecord = _history select 0;
                if !(_recentRecord isEqualTo [])then{
                    _fine = _recentRecord select 6;
                        if ((typename _fine == "ARRAY") && !(_fine isEqualTo []))then{
                        _wanted = _fine select 0;
                        if (_wanted == 4)then{
                            throw _forEachIndex;
                        };
                    };
                };
            };
        }forEach ExileLifeCriminalRecordsList; 
    } catch {
        _index = _exception;
    };
    ExileLifeCurrentCrimeIndex = _index;
    _displayType = 4163;
    (_display displayCtrl 4154) ctrlShow true;
    (_display displayCtrl 4154) ctrlSetTextColor [0.91, 0, 0, 1];
};
(_display displayCtrl 4157) ctrlSetText _lastScanned;
(_display displayCtrl 4156) ctrlSetText _lastScannedBy;
_prisonerRecordName = _display displayCtrl 4170;
_prisonerRecordName ctrlSetText format["%1 (%2)",ExileLifeCriminalRecordID select 1,ExileLifeCriminalRecordID select 0];
_displayType call ExileLifeClient_gui_xm8_slide_criminalHistory_event_showCrimeStats;
if (ExileLifeCurrentCrimeMaxIndex > 0)then{
    (_display displayCtrl 4167) ctrlShow true;
    (_display displayCtrl 4168) ctrlShow true;
    (_display displayCtrl 4181) ctrlShow true;
    if(ExileLifeCurrentCrimeIndex > 0)then{
        (_display displayCtrl 4168) ctrlEnable true;
    }else{
        (_display displayCtrl 4168) ctrlEnable false;
    };
    if(ExileLifeCurrentCrimeIndex < ExileLifeCurrentCrimeMaxIndex)then{
        (_display displayCtrl 4167) ctrlEnable true;
    }else{
        (_display displayCtrl 4167) ctrlEnable false;
    };
};
(_display displayCtrl 4159) ctrlSetText format["%1/%2",(ExileLifeCurrentCrimeMaxIndex min ExileLifeCurrentCrimeIndex) + 1,ExileLifeCurrentCrimeMaxIndex + 1];
