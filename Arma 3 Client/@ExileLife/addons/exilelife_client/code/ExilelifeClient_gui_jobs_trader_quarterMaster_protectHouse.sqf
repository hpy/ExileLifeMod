/**
                    * ExilelifeClient_gui_jobs_trader_quarterMaster_protectHouse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialogName","_scene","_button","_result","_display","_territoryDropDown","_playerUID","_sleepingBag","_buildRights","_territoryZone","_index","_idc","_baseText","_text"];
disableSerialization;
_dialogName = _this select 0;
_scene = _this select 1;
_button = _this select 2;
ExileLifeTempParams = [];
_result = false;
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
(_display displayCtrl 16111) ctrlShow false;
(_display displayCtrl 16113) ctrlShow false;
(_display displayCtrl 16114) ctrlShow false;
_territoryDropDown = _display displayCtrl 16113;
_territoryDropDown ctrlRemoveAllEventHandlers "LBSelChanged";
_territoryDropDown ctrlAddEventHandler ["LBSelChanged",{_this call ExileLifeClient_gui_jobs_trader_quarterMaster_event_onTerritoryProtectDropDownSelectionChanged}];
_territoryDropDown ctrlShow true;
_playerUID = getPlayerUID player;
lbClear _territoryDropDown;
{
	_sleepingBag = _x;
	_buildRights = _sleepingBag getVariable ["ExileTerritoryBuildRights", []];
	if (_playerUID in _buildRights) then
	{ 
		_territoryZone = _sleepingBag getVariable ["ExileLifeTerritoryZone",""];
		if (_territoryZone isEqualTo ExileLifeCurrentTradersGang) then 
		{
			_result = true;
			_name = _sleepingBag getVariable ["ExileTerritoryName", ""];
			_index = _territoryDropDown lbAdd _name;
			_territoryDropDown lbSetData [_index, netId _sleepingBag]; 
		}
	};
}
forEach (allMissionObjects "ExileLife_Construction_SleepingBag_Static");
_idc = _display displayCtrl 16105;
if (_result) then 
{
	_baseText = getText(configFile >> "CfgDialogs" >> _dialogName >> "Main" >> _scene >> _button >> "body");
}
else
{
	_baseText = getText(configFile >> "CfgDialogs" >> _dialogName >> "Main" >> _scene >> _button >> "body2");	
	_territoryDropDown ctrlShow false;
};
_text = parseText format
[
	_baseText
];
_idc ctrlSetStructuredText _text;
_idc call BIS_fnc_ctrlTextHeight;
ExileLifeTempParams = [_dialogName,_scene,_button];
true
