/**
                    * ExilelifeClient_gui_jobs_trader_quarterMaster_event_onTerritoryUpgradeDropDownSelectionChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_territoryDropDown","_index","_display","_sleepingBag","_level","_territoryConfig","_territoryLevels","_territoryPrice","_territoryFurnishings","_dialogName","_scene","_button","_idc","_baseText","_cost","_numberOfFurnishings","_text","_extra","_extraButton","_playerMoney","_totalPopTabAmount"];
disableSerialization;
_territoryDropDown = _this select 0;
_index = _this select 1;
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
_sleepingBag = objectFromNetId (_territoryDropDown lbData _index);
_name = _sleepingBag getVariable ["ExileTerritoryName", _name];
_level = _sleepingBag getVariable ["ExileTerritoryLevel", 1];
_territoryConfig = getArray(missionConfigFile >> "CfgTerritories" >> "Prices");
_territoryLevels = count _territoryConfig;
if((_level + 1) > _territoryLevels)then
{
	_territoryPrice = (_territoryConfig select (_territoryLevels - 1)) select 0;
	_territoryFurnishings = (_territoryConfig select (_territoryLevels - 1)) select 1;
}
else
{
	_territoryPrice = (_territoryConfig select _level) select 0;
	_territoryFurnishings = (_territoryConfig select _level) select 1;	
};
_dialogName = ExileLifeTempParams select 0;
_scene = ExileLifeTempParams select 1;
_button = ExileLifeTempParams select 2;
_idc = _display displayCtrl 16105;
_baseText = format ["<t shadow='0' align='center' size='10'><img image='\exilelife_assets\texture\mod\logo_welcome.paa'/></t><br/><t shadow='0' align='center' valign='middle' size='1.8'>Upgrade Dwelling</t><br/><br/><t shadow='0' size='1'> To upgrade <t color='#c72651'>%1</t> this is the deal:</t>",_name];
_cost = format ["<br/><br/><br/><t shadow='0' align='left'  size='1.2'>The cost is %1<img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1' shadow='true' /></t>",_territoryPrice];
_numberOfFurnishings = format ["<br/><t size='1.2'>You can place %1 Items</t>",_territoryFurnishings];
_level = format ["<br/><t size='1.2'>Dwelling Level %1/%2</t>",_level + 1,_territoryLevels];
_text = parseText format
[
	"%1 %2 %3 %4",	_baseText,_cost,_numberOfFurnishings,_level
];
_idc ctrlSetStructuredText _text;
_idc call BIS_fnc_ctrlTextHeight;
_extra = configFile >> "CfgDialogs" >> _dialogName >> "Main" >> _scene >> _button >> "extraButton";
if !(getText(_extra) isEqualTo "") then
{
	_extraButton = configFile >> "CfgDialogs" >> _dialogName >> "Extras" >> (getText _extra);
	if (isClass (_extraButton)) then
	{
		_idc = _display displayCtrl 16111;
		_idc ctrlSetText getText(_extraButton >> "name");
		_idc ctrlRemoveAllEventHandlers "ButtonClick";
		_idc ctrlAddEventHandler ["ButtonClick",format["(_this select 0) ctrlEnable false; %1",getText(_extraButton >> "action")]];
		_idc ctrlShow true;
	};
};
_playerMoney = player getVariable ["ExileMoney", 0];
if (_playerMoney >= _totalPopTabAmount) then 
{
	_idc ctrlEnable true;
}
else 
{
	_idc ctrlEnable false;
};