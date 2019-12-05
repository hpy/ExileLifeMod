/**
                    * ExilelifeClient_gui_virtualGarageDialog_event_onVehicleListBoxSelectionChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_listBox","_index","_dialog","_dropdown","_netID","_vehicle","_vehicleClass","_damage","_fuel","_pinCode","_vehIndex","_vehicleInfo"];
disableSerialization;
_listBox = _this select 0;
_index = _this select 1;
_dialog = uiNameSpace getVariable ["RscExileLifeVirtualGarageDialog", displayNull];
_dropdown = _dialog displayCtrl 21102;
if ((lbCursel _dropdown) isEqualTo 1) then
{
	_netID = _listBox lbData _index;
	_vehicle = objectFromNetid _netID;
	_vehicleClass = typeOf _vehicle;
	_damage = damage _vehicle;
	_fuel = fuel _vehicle;
	_pinCode = _vehicle getVariable ["ExileAlreadyKnownCode",[4,false,false,true] call ExileLifeClient_util_string_generate];
	[_netID,_vehicleClass,_damage,_fuel,_pinCode] call ExileLifeClient_gui_virtualGarageDialog_updateVehicle;
}
else
{
	_vehIndex = _listBox lbValue _index;
	_vehicleInfo = ExileLifeVirtualGarage select _vehIndex;
	_pinCode = _vehicleInfo select 5;
	if !(_vehicleInfo select 6 isEqualTo getPlayerUID player) then
	{
		_pinCode = [4,false,false,true] call ExileLifeClient_util_string_generate;
	};
	[
		str(_vehicleInfo select 0),
		_vehicleInfo select 1,
		_vehicleInfo select 2,
		_vehicleInfo select 3,
		_pinCode
	]
	call ExileLifeClient_gui_virtualGarageDialog_updateVehicle;
};
true