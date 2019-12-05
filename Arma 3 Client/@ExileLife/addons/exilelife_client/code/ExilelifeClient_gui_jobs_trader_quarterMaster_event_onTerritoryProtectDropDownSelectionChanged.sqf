/**
                    * ExilelifeClient_gui_jobs_trader_quarterMaster_event_onTerritoryProtectDropDownSelectionChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_territoryDropDown","_index","_display","_sleepingBag","_radius","_level","_objectsInTerritory","_dialogName","_scene","_button","_popTabAmountPerObject","_popTabAmountForSleepingBag","_totalPopTabAmount","_idc","_baseText","_priceText","_text","_extra","_extraButton","_playerMoney"];
disableSerialization;
_territoryDropDown = _this select 0;
_index = _this select 1;
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
_sleepingBag = objectFromNetId (_territoryDropDown lbData _index);
_radius = _sleepingBag getVariable ["ExileTerritorySize", 15];
_level = _sleepingBag getVariable ["ExileTerritoryLevel", 1];
_name = _sleepingBag getVariable ["ExileTerritoryName", _name];
_objectsInTerritory = _sleepingBag getVariable ["ExileTerritoryNumberOfConstructions", 0];
_dialogName = ExileLifeTempParams select 0;
_scene = ExileLifeTempParams select 1;
_button = ExileLifeTempParams select 2;
_popTabAmountPerObject = getNumber (missionConfigFile >> "CfgTerritories" >> "popTabAmountPerObject");
_popTabAmountForSleepingBag = getNumber (missionConfigFile >> "CfgTerritories" >> "minPopTabAmount");	
_totalPopTabAmount = _level * _popTabAmountPerObject * _objectsInTerritory + _popTabAmountForSleepingBag;
_idc = _display displayCtrl 16105;
_baseText = format ["<t shadow='0' align='center' size='10'><img image='\exilelife_assets\texture\mod\logo_welcome.paa'/></t><br/><t shadow='0' align='center' valign='middle' size='1.8'>Protective Services</t><br/><br/><t shadow='0' size='1'>An excellent choice! <t color='#c72651'>%1</t> is a wonderful piece of realestate, and it truly would be such a shame were you to lose it!</t>",_name];
_priceText = format ["<br/><br/><br/><t shadow='0' align='left'  size='1.2'>The cost is %1<img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1' shadow='true' /></t>",_totalPopTabAmount];
_text = parseText format
[
	"%1 %2",	_baseText,_priceText
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