/**
                    * ExilelifeClient_gui_virtualGarageDialog_updateVehicleListBox
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialog","_itemListControl","_option","_retrieveButton","_nearVehicles","_index","_className"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLifeVirtualGarageDialog", displayNull];
_itemListControl = _dialog displayCtrl 21103;
lbClear _itemListControl;
_option = _this select 0;
if (_option isEqualTo "ADD") then
{
	_retrieveButton = _dialog displayCtrl 21104;
	_retrieveButton ctrlSetText "Store Vehicle";
	_nearVehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], 80];
	{
		if (((locked _x) != -1) && (locked _x) != 1) then
		{
			if (local _x) then
			{
				if (alive _x) then
				{
					if !(_x getVariable ["ExileLifeProp", false]) then
					{
						_index = _itemListControl lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
						_itemListControl lbSetData [_index, netId _x];
					};
				};
			};
		};
	}
	forEach _nearVehicles;
}
else
{
	_retrieveButton = _dialog displayCtrl 21104;
	_retrieveButton ctrlSetText "Retrieve Vehicle";
	{
		_className = _x select 1;
		_index = _itemListControl lbAdd getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_itemListControl lbSetValue [_index,_forEachIndex];
	}
	forEach ExileLifeVirtualGarage;
};
true