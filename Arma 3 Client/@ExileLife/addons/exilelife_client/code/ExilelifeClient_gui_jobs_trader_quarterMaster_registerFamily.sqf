/**
                    * ExilelifeClient_gui_jobs_trader_quarterMaster_registerFamily
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialogName","_scene","_button","_disabled","_display","_idc","_registrationFee","_baseText","_priceText","_text","_nameInput","_extra","_extraButton"];
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
_registrationFee = getNumber (missionConfigFile >> "CfgClans" >> "registrationFee");
_baseText = getText(configFile >> "CfgDialogs" >> _dialogName >> "Main" >> _scene >> _button >> "body");
_priceText = format ["<br/><br/><t shadow='0' align='left' size='1.2'>The cost is %1<img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1' shadow='true' /></t>",_registrationFee];
if !(ExileClientClanInfo isEqualTo []) then 
{
	_priceText = "";
	_disabled = true;
	_baseText = getText(configFile >> "CfgDialogs" >> _dialogName >> "Main" >> _scene >> _button >> "body2");
};
_text = parseText format
[
	"%1 %2 ",	_baseText,_priceText
];
_idc ctrlSetStructuredText _text;
_idc call BIS_fnc_ctrlTextHeight;
if ((player getVariable ["ExileMoney", 0]) < _registrationFee) then 
{
	_disabled = true;
};
if !(_disabled) then 
{
	_nameInput = _display displayCtrl 16114;
	_nameInput ctrlSetText "";	
	_nameInput ctrlShow true;
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
};
true
