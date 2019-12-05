/**
                    * ExileClientOverwrites_gui_virtualGarageDialog_event_onLocationChanged
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

                    private["_display","_dropdown","_listbox","_confirmButton","_nicknameBox","_index","_flag","_storedVehicles","_nickname","_nearVehicles"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileVirtualGarageDialog", displayNull];
_dropdown = _display displayCtrl 4005;
_listbox = _display displayCtrl 4006;
_confirmButton = _display displayCtrl 4007;
_nicknameBox = _display displayCtrl 4010;
_confirmButton ctrlEnable false;
_nicknameBox ctrlSetText "";
_index = _dropdown lbValue (lbCurSel _dropdown);
lbClear _listbox;
_flag = player call ExileClient_util_world_getTerritoryAtPosition;
if (isNull _flag) exitWith {};
_display setVariable ["ExileSelectedVehicle", ""];
switch (_index) do
{
	case 0:
	{
		_confirmButton ctrlSetText "Retrieve Vehicle";
		_nicknameBox ctrlEnable false;
		_storedVehicles = _flag getVariable ["ExileTerritoryStoredVehicles", []];
		if !(_storedVehicles isEqualTo []) then 
		{
			{
				_nickname = _x select 1;
				_index = _listbox lbAdd _nickname;
				_listbox lbSetData [_index, str(_x)];
			}
			forEach _storedVehicles;
		};
	};
	case 1:
	{
		_confirmButton ctrlSetText "Store Vehicle";
		_nicknameBox ctrlEnable true;
		_nearVehicles = nearestObjects [player, getArray(missionConfigFile >> "CfgVirtualGarage" >> "allowedVehicleTypes"), _flag getVariable ["ExileTerritorySize", 0]];
		{
			if (local _x) then
			{
				if (alive _x) then
				{
					_index = _listbox lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
					_listbox lbSetData [_index, str([typeOf _x,netId _x])];
				};
			};
		}
		forEach _nearVehicles;
	};
	default {};
};