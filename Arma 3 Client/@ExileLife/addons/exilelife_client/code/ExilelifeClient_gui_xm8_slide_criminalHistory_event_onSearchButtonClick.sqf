/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistory_event_onSearchButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_prisonerID","_prisonerName","_pid","_prisoner"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_prisonerID = _display displayCtrl 4152;
_prisonerName = _display displayCtrl 4153;
_pid = ctrlText _prisonerID;
_name = ctrlText _prisonerName;
if(count _pid < 4)then{
    _prisoner = _name call ExileLifeClient_util_player_searchPlayerByName;
    if(isNil "_prisoner")exitWith{systemchat "Invalid Prisoner ID/Name";};
    _pid = _prisoner getVariable ["ExileLifePrisonerID",""];
    _name = [_prisoner] call ExileLifeClient_util_player_name;
};
if(count _pid < 4 || (toLower(_pid) find 'ex' != 0))exitWith{
    _prisonerID ctrlSetText "Invalid";
    _prisonerName ctrlSetText "Invalid";
};
_pid call ExileLifeClient_system_PrisonRecords_getPrisonerRecords;
ExileLifeCriminalRecordID = [_pid,_name];
_prisonerID ctrlSetText "";
_prisonerName ctrlSetText "";
ExileLifeCriminalRecord = [];
ExileLifeCriminalRecordsList = [];
