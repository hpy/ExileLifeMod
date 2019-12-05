/**
                    * ExileClientOverwrites_gui_virtualGarageDialog_show
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

                    private["_flag","_buildRights","_territoryLevel","_maxNumberOfVehicles","_display","_confirmButton","_dropdown","_index"];
disableSerialization;
try
{
	if ((getNumber(missionConfigFile >> 'CfgVirtualGarage' >> 'enableVirtualGarage')) isEqualTo 0) then
	{
		throw "This server has Virtual Garage disabled! Ask the server owner to enable it!";
	};
	if ((getNumber(missionConfigFile >> "CfgVirtualGarage" >> "canAccessGarageInCombat") isEqualTo 1) && {ExileClientPlayerIsInCombat}) then
	{
		throw "You cannot access Virtual Garage while in combat!";
	};
	_flag = player call ExileClient_util_world_getTerritoryAtPosition;
	if (isNull _flag) then
	{
		throw "You must be in your territory in order to access Virtual Garage";
	};
	_buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
	if !((getPlayerUID player) in _buildRights) then
	{
		throw "You do not have permission to access this territory's Virtual Garage";
	};
	_territoryLevel = _flag getVariable ["ExileTerritoryLevel", 1];
	_maxNumberOfVehicles = getArray(missionConfigFile >> "CfgVirtualGarage" >> "numberOfVehicles") select ((_territoryLevel - 1) max 0);
	if (_maxNumberOfVehicles isEqualTo -1) then
	{
		throw "Your territory isn't allowed to store any vehicles.<br />Upgrade your territory to gain access to Virtual Garage";
	};
	createDialog "RscExileVirtualGarageDialog";
	_display = uiNameSpace getVariable ["RscExileVirtualGarageDialog", displayNull];
	false call ExileClient_gui_hud_toggle;
	false call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
	if(ExileClientIsAutoRunning)then{
		call ExileClient_system_autoRun_stop;
	};
	_confirmButton = _display displayCtrl 4007;
	_confirmButton ctrlEnable false;
	_dropdown = _display displayCtrl 4005;
	lbClear _dropdown;
	_index = _dropdown lbAdd "Retrieve Vehicle";
	_dropdown lbSetValue [_index, 0];
	_index = _dropdown lbAdd "Store Vehicle";
	_dropdown lbSetValue [_index, 1];
	_dropdown lbSetCurSel 0;
	call ExileClient_gui_modelBox_create;
}
catch
{
	["ErrorTitleAndText", ["ERROR!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
true
