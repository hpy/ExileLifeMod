/**
                    * ExileClientOverwrites_gui_virtualGarageDialog_updateVehicle
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

                    private["_vehicleClass","_display","_vehicleConfig","_armor","_fuelCapacity","_maximumLoad","_maximumSpeed","_stats","_controlID"];
disableSerialization;
_vehicleClass = _this;
_display = uiNameSpace getVariable ["RscExileVirtualGarageDialog", displayNull];
_vehicleConfig = configFile >> "CfgVehicles" >> _vehicleClass;
_armor = getNumber(_vehicleConfig >> "armor");
_fuelCapacity = getNumber(_vehicleConfig >> "fuelCapacity"); 
_maximumLoad = getNumber(_vehicleConfig >> "maximumLoad");
_maximumSpeed = getNumber(_vehicleConfig >> "maxSpeed");
_stats = [];
_stats pushBack ["Speed", 		format["%1km/h", 	_maximumSpeed], 	_maximumSpeed/1059 	];
_stats pushBack ["Capacity", 	format["%1", 		_maximumLoad], 		_maximumLoad/6000 		];
_stats pushBack ["Armor", 		format["%1", 		_armor], 			_armor/5000 			];
_stats pushBack ["Fuel Tank", 	format["%1l", 		_fuelCapacity], 	_fuelCapacity/4500 	];
_controlID = 4011;
{
	(_display displayCtrl _controlID) ctrlShow true;
	(_display displayCtrl (_controlID + 2)) ctrlSetText (_x select 0);
	(_display displayCtrl (_controlID + 2)) ctrlShow true;
	(_display displayCtrl (_controlID + 3)) ctrlSetStructuredText parseText (_x select 1);
	(_display displayCtrl (_controlID + 3)) ctrlShow true;
	(_display displayCtrl (_controlID + 1)) progressSetPosition (_x select 2);
	(_display displayCtrl (_controlID + 1)) ctrlShow true;
	(_display displayCtrl (_controlID + 1)) ctrlCommit 1;
	_controlID = _controlID + 4;
}
forEach _stats;
_vehicleClass call ExileClient_gui_modelBox_update;