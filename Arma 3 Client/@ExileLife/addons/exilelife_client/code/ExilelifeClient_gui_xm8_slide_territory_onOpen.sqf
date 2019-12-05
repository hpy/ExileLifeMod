/**
                    * ExilelifeClient_gui_xm8_slide_territory_onOpen
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_territoryDropDown","_playerUID","_flag","_buildRights","_size","_level","_parts","_index","_kickButton","_leaveButton","_promoteButton","_demoteButton","_radiusButton"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_territoryDropDown = _display displayCtrl 4132;
lbClear _territoryDropDown;
_playerUID = getPlayerUID player;
{
	_flag = _x;
	_buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
	if (_playerUID in _buildRights) then
	{
		_name = _flag getVariable ["ExileTerritoryName", ""];
		_size = _flag getVariable ["ExileTerritorySize", 0];
		_level = _flag getVariable ["ExileTerritoryLevel", 0];
		_parts = count (_flag nearObjects ["Exile_Construction_Abstract_Static", _size]);
		_index = _territoryDropDown lbAdd (format ["%1 (Level: %2, Radius: %3m, Parts: %4)",_name, _level, _size, _parts]);
		_territoryDropDown lbSetData [_index, netId _flag];
	};
}
forEach (allMissionObjects "ExileLife_Construction_SleepingBag_Static");
_kickButton = _display displayCtrl 4134;
_kickButton ctrlEnable false;
_leaveButton = _display displayCtrl 4135;
_leaveButton ctrlEnable false;
_promoteButton = _display displayCtrl 4136;
_promoteButton ctrlEnable false;
_demoteButton = _display displayCtrl 4137;
_demoteButton ctrlEnable false;
_radiusButton = _display displayCtrl 4138;
_radiusButton ctrlShow false;
_territoryDropDown lbSetCurSel 0;
true
