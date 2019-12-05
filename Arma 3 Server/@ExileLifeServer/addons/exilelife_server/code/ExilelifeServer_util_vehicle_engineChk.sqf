/**
                    * ExilelifeServer_util_vehicle_engineChk
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

                    private["_vehicle","_driver","_playerUID","_sessionID","_result"];
_vehicle = _this select 0;
try
{
	if (isNull _vehicle) then
	{
		throw "Null Vehicle";
	};
	if !(alive _vehicle) then
	{
		throw "Dead Vehicle";
	};
	if !(_vehicle getVariable ["ExileLifeOldManVehicle",false]) then
	{
		throw "Not a hire vehicle";
	};
	_driver = driver _vehicle;
	if (isNull _driver) then {
		throw "Driver doesnt exist";
	};
	if !(alive _driver) then {
		throw "Driver is Dead";
	};
	_playerUID = getPlayerUID _driver;
	_sessionID = _playerUID call ExileLifeServer_system_session_getIDfromUID;
	if (_sessionID isEqualTo "") then {
		throw "Failed to recover SessionID";
	};
	if (_vehicle getVariable ["ExileLifeVehicleDisabled",false]) then
	{
		if ((netID _driver) in (_vehicle getVariable ["ExileLifePermittedDrivers",[]])) then
		{
			_vehicle setVariable ["ExileLifeVehicleDisabled",false,true];
			[_sessionID, "vehicleEnabledResponse", [netID _vehicle]] call ExileServer_system_network_send_to;
			throw "ReEnabled Vehicle";
		};
		throw "ReEnable Vehicle Failed";
	};
	if ((netID _driver) in (_vehicle getVariable ["ExileLifePermittedDrivers",[]])) then
	{
		throw "Permitted Driver Ignore";
	};
	_vehicle setVariable ["ExileLifeVehicleDisabled",true,true];
	[_sessionID, "vehicleDisabledResponse", [netID _vehicle]] call ExileServer_system_network_send_to;
}
catch
{
	_result = _exception;
};
