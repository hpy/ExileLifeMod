/**
                    * ExilelifeClient_gui_characterInfo_show
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_prisonerID","_ageDropdown","_reasonDropdown","_reasonEdit","_confirmButton","_fnameEdit","_lnameEdit","_index"];
disableSerialization;
createDialog "RscExileLifeCharacterInfo";
waitUntil
{
	_display = findDisplay 23500;
	!isNull _display
};
ExileLifeCharacterInfoThread = -1;
_prisonerID = _display displayCtrl 23506;
_ageDropdown = _display displayCtrl 23512;
_reasonDropdown = _display displayCtrl 23514;
_reasonEdit = _display displayCtrl 23515;
_confirmButton = _display displayCtrl 23516;
_fnameEdit = _display displayCtrl 23508;
_lnameEdit = _display displayCtrl 23510;
_fnameEdit ctrlSetText "";
_lnameEdit ctrlSetText "";
_prisonerID ctrlSetText ExileLifeCharacterInfoPrisonerID;
_confirmButton ctrlEnable false;
if (getNumber(missionConfigFile >> "CfgExileLifeDifficulty" >> "hardcore") isEqualTo 0 && !ExileLifeGuard) then
{
	_reasonEdit ctrlShow false;
	_reasonDropdown ctrlShow true;
	lbClear _reasonDropdown;
	{
		_index = _reasonDropdown lbAdd _x;
		_reasonDropdown lbSetValue [_index, _forEachIndex];
	}
	forEach (getArray(missionConfigFile >> "CfgPlayer" >> "CfgExileLifeCharacterInfo" >> "reasons"));
	_reasonDropdown ctrlAddEventHandler ["LBSelChanged","call ExileLifeClient_gui_characterInfo_event_enableButton"];
}
else
{
	_reasonEdit ctrlShow true;
	_reasonDropdown ctrlShow false;
	_reasonEdit ctrlSetText "";
	_reasonEdit ctrlAddEventHandler ["KeyUp","call ExileLifeClient_gui_characterInfo_event_enableButton"];
};
lbClear _ageDropdown;
{
	_index = _ageDropdown lbAdd _x;
	_ageDropdown lbSetValue [_index, _forEachIndex];
}
forEach (getArray(missionConfigFile >> "CfgPlayer" >> "CfgExileLifeCharacterInfo" >> "ages"));
_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
_lnameEdit ctrlAddEventHandler ["KeyUp","call ExileLifeClient_gui_characterInfo_event_enableButton"];
_fnameEdit ctrlAddEventHandler ["KeyUp","call ExileLifeClient_gui_characterInfo_event_enableButton"];
_ageDropdown ctrlAddEventHandler ["LBSelChanged","call ExileLifeClient_gui_characterInfo_event_enableButton"];
