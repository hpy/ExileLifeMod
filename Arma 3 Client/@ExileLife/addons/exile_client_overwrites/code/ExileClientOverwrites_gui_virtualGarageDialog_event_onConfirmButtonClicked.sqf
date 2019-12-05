/**
                    * ExileClientOverwrites_gui_virtualGarageDialog_event_onConfirmButtonClicked
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

                    private["_display","_dropdown","_index","_nameInput","_nickName","_alphabet","_flag","_vehicleInfo","_buildRights","_nickNameLength","_storedVehicles","_count","_forbiddenCharacter","_territoryLevel","_maxNumberOfVehicles","_vehicleObject","_cargo","_money","_result"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileVirtualGarageDialog", displayNull];
_dropdown = _display displayCtrl 4005;
_index = _dropdown lbValue (lbCurSel _dropdown);
_nameInput = _display displayCtrl 4010;
_nickName = ctrlText _nameInput;
diag_log format["_nickName: %1",_nickName];
_alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");
_flag = player call ExileClient_util_world_getTerritoryAtPosition;
_vehicleInfo = _display getVariable ["ExileSelectedVehicle", ""];
try
{
	if (ExileClientIsWaitingForServerTradeResponse) then
	{
		throw "Waiting for server response";
	};
	if (_vehicleInfo isEqualTo "") then
	{
		throw "No vehicle selected";
	};
	if (isNull _flag) then
	{
		throw "You are not near your house!";
	};
	_buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
	if !((getPlayerUID player) in _buildRights) then
	{
		throw "You do not have permission to access this Garage";
	};
	if ((getNumber(missionConfigFile >> "CfgVirtualGarage" >> "canUseGarageInCombat") isEqualTo 1) && {ExileClientPlayerIsInCombat}) then
	{
		throw "You cannot access your Garage while in combat!";
	};
	switch (_index) do
	{
		case 0:
		{
			["retrieveVehicleRequest", [_vehicleInfo]] call ExileClient_system_network_send;
			ExileClientIsWaitingForServerTradeResponse = true;
		};
		case 1:
		{
			_nickName = _nickName call ExileClient_util_string_trim;
			_nickNameLength = count _nickName;
			if (_nickNameLength isEqualTo 0) then
			{
				throw "Please enter a name.";
			};
			if (_nickNameLength < 2) then
			{
				throw "Name is too short.";
			};
			if (_nickNameLength > 20) then
			{
				throw "Name is longer than 20 letters.";
			};
			_storedVehicles = _flag getVariable ["ExileTerritoryStoredVehicles", []];
			_count = {toLower(_x select 1) isEqualTo toLower(_nickName)} count _storedVehicles;
			if (_count > 0) then
			{
				throw format["'%1' is already in use by another vehicle.", _nickName];
			};
			_forbiddenCharacter = [_nickName, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
			if !(_forbiddenCharacter isEqualTo -1) then
			{
				throw format ["Do not use '%1' in your vehicle's nickname.", _forbiddenCharacter];
			};
			_territoryLevel = _flag getVariable ["ExileTerritoryLevel", 1];
			_maxNumberOfVehicles = getArray(missionConfigFile >> "CfgVirtualGarage" >> "numberOfVehicles") select ((_territoryLevel - 1) max 0);
			if (count(_storedVehicles) >= _maxNumberOfVehicles) then
			{
				throw "You cannot store any more vehicles in your territory.<br />Upgrade your territory to store more vehicles!";
			};
			if (getNumber(missionConfigFile >> "CfgVirtualGarage" >> "clearInventoryOnStore") isEqualTo 1) then
			{
				_vehicleObject = objectFromNetID(_vehicleInfo);
				_cargo = _vehicleObject call ExileClient_util_containerCargo_list;
				_money = _vehicleObject getVariable ["ExileMoney", 0];
				if (!(_cargo isEqualTo []) || _money > 0) then
				{
					_result = ["The vehicle you are about to store has items/money in it's inventory. These will be dropped on the ground upon storing the vehicle<br />Are you sure you want to store your vehicle?", "Warning", true, true] call BIS_fnc_guiMessage;
					if !(_result) then
					{
						throw "Cancelled";
					};
				};
			};
			["storeVehicleRequest", [_vehicleInfo, _nickName]] call ExileClient_system_network_send;
			ExileClientIsWaitingForServerTradeResponse = true;
		};
		default
		{
			throw "Invalid option erwar!";  
		};
	};
}
catch
{
	["ErrorTitleAndText", [format["Failed to %1 vehicle", ["retrieve", "store"] select (_index isEqualTo 1)], _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
closeDialog 1;
true
