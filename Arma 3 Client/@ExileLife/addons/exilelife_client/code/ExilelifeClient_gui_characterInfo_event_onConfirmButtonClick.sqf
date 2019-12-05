/**
                    * ExilelifeClient_gui_characterInfo_event_onConfirmButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_ageDropdown","_reasonDropdown","_fnameEdit","_lnameEdit","_playerFName","_playerLName","_age","_reason"];
disableSerialization;
_display = findDisplay 23500;
_ageDropdown = _display displayCtrl 23512;
_reasonDropdown = _display displayCtrl 23514;
_fnameEdit = _display displayCtrl 23508;
_lnameEdit = _display displayCtrl 23510;
_playerFName = (ctrlText _fnameEdit);
_playerLName = (ctrlText _lnameEdit);
_age = ((getArray(missionConfigFile >> "CfgPlayer" >> "CfgExileLifeCharacterInfo" >> "ages") select (_ageDropdown lbValue (lbCursel _ageDropdown))));
_reason = ((getArray(missionConfigFile >> "CfgPlayer" >> "CfgExileLifeCharacterInfo" >> "reasons") select (_reasonDropdown lbValue (lbCursel _reasonDropdown))));
["updatePlayerInfoRequest",[_playerFName, _playerLName,_age,_reason,ExileLifeClientSpawnChoice]] call ExileClient_system_network_send;
ExileLifeCharacterInfo = [_playerFName, _playerLName,_age,_reason];
ExileLifeClientCharacterInfoDone = true;
ExileLifeCharacterInfoPrisonerID = nil;
closeDialog 1;
true