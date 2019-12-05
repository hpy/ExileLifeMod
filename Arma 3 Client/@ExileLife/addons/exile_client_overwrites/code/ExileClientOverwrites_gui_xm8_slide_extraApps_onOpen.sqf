/**
                    * ExileClientOverwrites_gui_xm8_slide_extraApps_onOpen
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_display","_loadedApps","_row","_col","_apps","_appIndex","_i","_appName","_appID","_extraControlGroup","_appTile","_buttonOnLoadFunction","_fwdBtn","_backBtn","_enable"];
 disableSerialization;
 _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
ExileExtraAppsHomePage = "extraApps";
 {
     (_display displayCtrl _x) ctrlShow false;
 }forEach [5100,
 5101,
 5102,
 5103];
 _loadedApps = ExileClientXM8Apps select ExileClientXM8Page;
  _row = 0;
  _col = 0;
  _apps = [];
 _appIndex = 0;
  for "_i" from 1 to 14 do
  {
      _row = (_i - 1) % 3;
 	if(_i <= (count _loadedApps))then
 	{
        _appName = _loadedApps select (_i - 1);
 		_appID = format["XM8_App_%1_Button",_appName];
 		if !(getText(missionConfigFile >> _appID >> "text") isEqualTo "") then
 		{
 			_extraControlGroup = _display displayCtrl 5000;
 			_appTile = _display ctrlCreate [_appID, -1, _extraControlGroup];
 			_appTile ctrlSetPosition [(1 + (6.5 * _col)) * (0.025), (2 + (5.5 * _row)) * (0.04)];
 			_appTile ctrlCommit 0;
            if !(getText(missionConfigFile >> _appID >> "resource") isEqualTo "") then{
                _appTile ctrlRemoveAllEventHandlers "ButtonClick";
                _appTile ctrlAddEventHandler ["ButtonClick", format["'%1' call ExileClient_gui_xm8_slide_extraAppsTransition_showApp", _appID]];
            };
            _buttonOnLoadFunction = missionNamespace getVariable [format ["ExileLifeClient_gui_xm8_button_%1_onLoad", _appName], ""];
            if !(_buttonOnLoadFunction isEqualTo "") then
            {
                _appTile call _buttonOnLoadFunction;
            }
            else
            {
                _buttonOnLoadFunction = missionNamespace getVariable [format ["ExileClient_gui_xm8_button_%1_onLoad", _appName], ""];
                if !(_buttonOnLoadFunction isEqualTo "") then
                {
                    _appTile call _buttonOnLoadFunction;
                };
            };
 			_apps pushBack _appTile;
 		};
 	};
    if (_row isEqualTo 2) then
    {
        _col = _col + 1;
    };
 };
_fwdBtn = false;
_backBtn = false;
  if((count _loadedApps == 14) && (ExileClientXM8Page < ExileClientXM8MaxPage)) then {
      _fwdBtn = true;
  };
  if(ExileClientXM8Page > 0)then {
      _backBtn = true;
  };
  _enable = [];
  if(_backBtn && _fwdBtn) then {
      _enable = [5100,
      5101];
  }else {
      if(_backBtn && !_fwdBtn) then{
          _enable = [5102];
      }else {
          if(_fwdBtn && !_backBtn)then{
              _enable = [5103];
          };
      };
  };
  {
      (_display displayCtrl _x) ctrlShow true;
  }forEach _enable;
 _display setVariable ["ExileExtraApps", _apps];
