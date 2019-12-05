/**
                    * ExilelifeServer_admintools_util_permissions_compile
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

                    private["_permissionLevel","_functionPermissions","_permissions","_functionNames","_className","_config","_title","_filePrefix","_final","_temp","_configName","_actVar","_option","_color","_permissionConfig","_allowTarget","_targetArray","_arr","_allowServer","_serverArray","_vehicleSpawnOptions","_allowTargetInfoKeybind","_allowLockUnlockKeybind","_allowFlipVehicleKeybind","_allowDeleteObjectKeybind"];
_permissionLevel = _this;
if !(isClass(configFile >> "CfgExileLifePermissions" >> _permissionLevel)) exitWith
{
	format["Permission %1 does not exist in CfgExileLifePermissions",_permissionLevel] call ExileLifeServer_util_log;
	false
};
_functionPermissions = [];
_permissions = [];
_functionNames = [];
{
	_className = _x;
	_config = (configFile >> "CfgExileLifePermissions" >> _permissionLevel >> "Functions" >> _className);
	_title = getText(_config >> "title");
	_filePrefix = getText(_config >> "filePrefix");
	_final = [_title,_filePrefix];
	_temp = [];
	{
		_configName = (_config >> _x);
		_name = getText(_configName >> "name");
		_actVar = getText(_configName >> "actVar");
		_option = getNumber(_configName >> "Option");
		_color = getArray(_configName >> "color");
		if (_option > 0) then
		{
			_temp pushBack [_x,_name,[_option,_color]];
		}
		else
		{
			if !(_actVar isEqualTo "") then
			{
				_temp pushBack [_x,_name,[_actVar,_color]];
			}
			else
			{
				_temp pushBack [_x,_name,[_color]];
			};
		};
		_functionNames pushbackUnique toLower(format["%1_%2",_className,_x]);
	}
	forEach ("true" configClasses (_config) apply {configName _x});
	_final pushback _temp;
	_functionPermissions pushback [_x,_final];
}
forEach ([configFile >> "CfgExileLifePermissions" >> _permissionLevel >> "Functions"] call ExileLifeClient_util_config_getSubClasses);
_permissionConfig = configFile >> "CfgExileLifePermissions" >> _permissionLevel >> "Permissions";
_allowTarget = getNumber(_permissionConfig >> "allowTargetAdministration") isEqualTo 1;
_targetArray = [];
if (_allowTarget) then
{
	_arr = getArray(_permissionConfig >> "targetAdministrationOptions");
	if !(_arr isEqualTo []) then
	{
		_targetArray = _arr;
	};
};
_allowServer = getNumber(_permissionConfig >> "allowServerAdministration") isEqualTo 1;
_serverArray = [];
if (_allowServer) then
{
	_arr = getArray(_permissionConfig >> "serverAdministrationOptions");
	if !(_arr isEqualTo []) then
	{
		_serverArray = _arr;
	};
};
_vehicleSpawnOptions = [];
if ("spawn_vehicles" in _functionNames || "spawn_vehiclesexilelife" in _functionNames) then
{
	_arr = getArray(_permissionConfig >> "vehicleSpawnOptions");
	if !(_arr isEqualTo []) then
	{
		_vehicleSpawnOptions = _arr;
	};
};
_allowTargetInfoKeybind = getNumber(_permissionConfig >> "allowTargetInformationKeybind") isEqualTo 1;
_allowLockUnlockKeybind = getNumber(_permissionConfig >> "allowLockUnlockKeybind") isEqualTo 1;
_allowFlipVehicleKeybind = getNumber(_permissionConfig >> "allowFlipVehicleKeybind") isEqualTo 1;
_allowDeleteObjectKeybind = getNumber(_permissionConfig >> "allowDeleteObjectKeybind") isEqualTo 1;
{
	_permissions pushBack _x;
}
forEach
[
	_allowTarget,
	_targetArray,
	_allowServer,
	_serverArray,
	_vehicleSpawnOptions,
	_allowTargetInfoKeybind,
	_allowLockUnlockKeybind,
	_allowFlipVehicleKeybind,
	_allowDeleteObjectKeybind
];
[_permissions,_functionPermissions,_functionNames]