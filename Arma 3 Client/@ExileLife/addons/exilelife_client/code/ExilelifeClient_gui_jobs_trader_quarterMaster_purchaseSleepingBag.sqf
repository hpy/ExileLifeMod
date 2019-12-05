/**
                    * ExilelifeClient_gui_jobs_trader_quarterMaster_purchaseSleepingBag
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialogName","_scene","_button","_disabled","_display","_idc","_baseText","_config","_price","_priceText","_furnishings","_furnishingsText","_text","_extra","_extraButton"];
disableSerialization;
_dialogName = _this select 0;
_scene = _this select 1;
_button = _this select 2;
_disabled = false;
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
(_display displayCtrl 16111) ctrlShow false;
(_display displayCtrl 16113) ctrlShow false;
(_display displayCtrl 16114) ctrlShow false;
_idc = _display displayCtrl 16105;
_baseText = getText(configFile >> "CfgDialogs" >> _dialogName >> "Main" >> _scene >> _button >> "body");
_config = (getArray(missionConfigFile >> "CfgTerritories" >> "prices")) select 0;
_price = _config select 0;
if (_price > (player getVariable ["ExileMoney", 0])) then
{
	_disabled = true;
	_baseText = getText(configFile >> "CfgDialogs" >> _dialogName >> "Main" >> _scene >> _button >> "body2");
};
_priceText = format ["<br/><br/><br/><t shadow='0' align='left' size='1.2'>The cost is %1<img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1' shadow='true' /></t>",_price];
_furnishings = _config select 2;
_furnishingsText = format ["<br/><t shadow='0' align='left' size='1.2'>You can place %1 Items</t>", _furnishings];
_text = parseText format
[
	"%1 %2 %3",	_baseText,_priceText,_furnishingsText
];
_idc ctrlSetStructuredText _text;
_idc call BIS_fnc_ctrlTextHeight;
_extra = configFile >> "CfgDialogs" >> _dialogName >> "Main" >> _scene >> _button >> "extraButton";
if !(getText(_extra) isEqualTo "") then
{
	_extraButton = configFile >> "CfgDialogs" >> _dialogName >> "Extras" >> (getText _extra);
	if (isClass (_extraButton)) then
	{
		if !(_disabled) then 
		{
			_idc = _display displayCtrl 16111;
			_idc ctrlSetText getText(_extraButton >> "name");
			_idc ctrlRemoveAllEventHandlers "ButtonClick";
			_idc ctrlAddEventHandler ["ButtonClick",format["(_this select 0) ctrlEnable false; %1",getText(_extraButton >> "action")]];
			_idc ctrlShow true;
		};
	};
};
true
