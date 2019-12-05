/**
                    * ExilelifeClient_gui_virtualGarageDialog_updateVehicle
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_vehicleID","_vehicleClass","_damage","_fuel","_pinCode","_dialog","_vehicleConfig","_armor","_fuelCapacity","_maximumLoad","_maximumSpeed","_stats","_controlID","_retrieveButton","_pinCodeText"];
disableSerialization;
_vehicleID = _this select 0;
_vehicleClass = _this select 1;
_damage = _this select 2;
_fuel = _this select 3;
_pinCode = _this select 4;
_dialog = uiNameSpace getVariable ["RscExileLifeVirtualGarageDialog", displayNull];
_vehicleConfig = configFile >> "CfgVehicles" >> _vehicleClass;
_armor = getNumber(_vehicleConfig >> "armor");
_fuelCapacity = getNumber(_vehicleConfig >> "fuelCapacity"); 
_maximumLoad = getNumber(_vehicleConfig >> "maximumLoad");
_maximumSpeed = getNumber(_vehicleConfig >> "maxSpeed");
_stats = [];
_stats pushBack ["Health", 				format["%1%2", 		round(1 - _damage) * 100,"%"], 			1 - (_damage / 100)	 					];
_stats pushBack ["Current Fuel", 		format["%1%2", 		round(_fuel * 100), 	 "%"], 			1 - (_fuel / 100)						];
_stats pushBack ["Armor", 				format["%1", 		_armor					    ], 			_armor/5000 			];
_stats pushBack ["Capacity (Max)", 		format["%1", 		_maximumLoad        	    ], 			_maximumLoad/6000 		];
_stats pushBack ["Speed (Max)", 		format["%1km/h", 	_maximumSpeed       	    ], 			_maximumSpeed/1059 	];
_stats pushBack ["Fuel Tank", 			format["%1l", 		_fuelCapacity       	    ], 			_fuelCapacity/4500 	];
_controlID = 21111;
{
	(_dialog displayCtrl _controlID) ctrlShow true;
	(_dialog displayCtrl (_controlID + 2)) ctrlSetText (_x select 0);
	(_dialog displayCtrl (_controlID + 2)) ctrlShow true;
	(_dialog displayCtrl (_controlID + 3)) ctrlSetStructuredText parseText (_x select 1);
	(_dialog displayCtrl (_controlID + 3)) ctrlShow true;
	(_dialog displayCtrl (_controlID + 1)) progressSetPosition (_x select 2);
	(_dialog displayCtrl (_controlID + 1)) ctrlShow true;
	(_dialog displayCtrl (_controlID + 1)) ctrlCommit 1;
	_controlID = _controlID + 4;
}
forEach _stats;
_retrieveButton = _dialog displayCtrl 21104;
_retrieveButton ctrlEnable true;
_pinCodeText = _dialog displayCtrl 21110;
if (profileNameSpace getVariable ["ExileStreamFriendlyUI", false]) then
{
	_pinCode = "****";
};
_pinCodeText ctrlSetStructuredText parseText format["<t>Pin Code: %1</t>",_pinCode];
_vehicleClass call ExileClient_gui_modelBox_update;
uiNameSpace setVariable ["RscExileLifeVirtualGarageDialogVehicle", _vehicleID];