/**
                    * ExilelifeClient_gui_repair_show
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_itemClassName","_fromType","_toType","_repairedWeapon","_configClassname","_repairConfig","_repairName","_pictureItemConfig","_repairPicture","_canRepairGun","_possibleCraftQuantity","_equippedMagazines","_components","_returnedItems","_tools","_dialog","_description","_componentQuantity","_componentItemClassName","_componentItemName","_equippedComponentQuantity","_toolItemClassName","_toolItemName","_equippedToolQuantity","_interactionModelGroupClassName","_interactionModelGroupConfig","_interactionModelGroupName","_interactionModelGroupModels","_foundObject","_attributeName","_check","_value","_chance"];
_itemClassName = _this select 0;
_fromType = _this select 1;
_toType = _this select 2;
_repairedWeapon = _this select 3;
_configClassname = _this select 4;
_repairConfig = missionConfigFile >> "CfgGunRepair" >> _fromType >> _configClassname;
_repairName = getText(_repairConfig >> "name");
_pictureItemConfig = configFile >> (_repairedWeapon call ExileClient_util_gear_getConfigNameByClassName) >> _repairedWeapon;
_repairPicture = getText(_pictureItemConfig >> "picture");
_canRepairGun = true;
_possibleCraftQuantity = 99999;
_equippedMagazines = (player call ExileClient_util_playerCargo_list);
_components = getArray(_repairConfig >> "components");
_returnedItems = getArray(_repairConfig >> "returnedItems");
_tools = getArray(_repairConfig >> "tools");
_returnedItems pushBack [1, _repairedWeapon];
createDialog "RscExileCraftItemDialog";
waitUntil { !isNull findDisplay 24005 };
uiNameSpace setVariable ["ExileLifeRepairInfo", _this];
_dialog = uiNameSpace getVariable ["RscExileCraftItemDialog", displayNull];
_description = format["<t size='1.5' font='PuristaMedium' align='left'>%1</t><br/><br/>", _repairName];
{
	_componentQuantity = _x select 0;
	_componentItemClassName = _x select 1;
	_componentItemName = getText(configFile >> (_componentItemClassName call ExileClient_util_gear_getConfigNameByClassName) >> _componentItemClassName >> "displayName");
	_equippedComponentQuantity = { _x == _componentItemClassName } count _equippedMagazines;
	_description = _description + format["<t size='1' font='puristaMedium' align='left'>%1</t>", _componentItemName];
	_possibleCraftQuantity = _possibleCraftQuantity min (floor (_equippedComponentQuantity / _componentQuantity));
	if (_equippedComponentQuantity < _componentQuantity ) then
	{
		_canRepairGun = false;
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2/%3</t>", "#ea0000", _equippedComponentQuantity, _componentQuantity];
	}
	else
	{ 
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2/%3</t>", "#b2ec00", _equippedComponentQuantity, _componentQuantity];
	};
	_description = _description + "<br/>";
}
forEach _components;
{
	_toolItemClassName = _x;
	_toolItemName = getText(configFile >> "CfgMagazines" >> _toolItemClassName >> "displayName");
	_equippedToolQuantity = { _x == _toolItemClassName } count _equippedMagazines;
	_description = _description + format["<t size='1' font='puristaMedium' align='left'>%1</t>", _toolItemName];
	if (_equippedToolQuantity == 0 ) then
	{
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#ea0000", "NOT EQUIPPED"];
		_canRepairGun = false;
	}
	else
	{ 
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#b2ec00", "EQUIPPED"];
	};
	_description = _description + "<br/>";
}
forEach _tools;
_interactionModelGroupClassName = getText(_repairConfig >> "requiredInteractionModelGroup");
if( _interactionModelGroupClassName != "" ) then
{
	_interactionModelGroupConfig = missionConfigFile >> "CfgInteractionModels" >> _interactionModelGroupClassName;
	_interactionModelGroupName = getText(_interactionModelGroupConfig >> "name");
	_interactionModelGroupModels = getArray(_interactionModelGroupConfig >> "models");
	_description = _description + format["<t size='1' font='puristaMedium' align='left'>%1</t>", _interactionModelGroupName];
	_foundObject = false;
	if ([ASLtoAGL (getPosASL player), 10, _interactionModelGroupModels] call ExileClient_util_model_isNearby) then
	{
		_foundObject = true;	
	}
	else 
	{
		if ( _interactionModelGroupModels call ExileClient_util_model_isLookingAt ) then
		{
			_foundObject = true;
		};
	};
	if (_foundObject) then
	{
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#b2ec00", "FOUND"];
	}
	else 
	{
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#ea0000", "NOT FOUND"];
		_canRepairGun = false;
	};
	_description = _description + "<br/>";
};
if !([_components, _returnedItems] call ExileClient_util_inventory_canExchangeItems) then
{
	_canRepairGun = false;
	_description = _description + format["<br/><t size='1' font='puristaMedium' align='left' color='%1'>%2</t>", "#ea0000", "Your inventory is full."];
};
if !(getArray(_repairConfig >> "requiredAttributeNameAndValue") isEqualTo []) then 
{
	{
		_attributeName = _x select 0;
		_check = _x select 1;
		_value = ["Repair",_attributeName, "NO_RETURN"] call ExileLifeClient_system_attribute_getValue;
		if (_value isEqualTo "NO_RETURN") then 
		{
			_canRepairGun = false;
			_description = _description + format["<br/><t size='1' font='puristaMedium' align='left' color='%1'>%2</t>", "#ea0000", format["Required attribute %1 was not found, contact system admin", _attributeName]];
		}
		else
		{
			if !(_value isEqualTo _check) exitWith 
			{
				_canRepairGun = false;
				_description = _description + format["<br/><t size='1' font='puristaMedium' align='left' color='%1'>%2</t>", "#ea0000", "You are missing a required attribute"];
			};
		};
	}
	forEach (getArray(_repairConfig >> "requiredAttributeNameAndValue"));
};
_chance = 0;
if (_toType isEqualTo "New") then 
{
	_chance = ["Repair","repairChanceForNew", 0] call ExileLifeClient_system_attribute_getValue;
}
else 
{
	if ((_configClassname find "NoKit") > -1) then 
	{
		_chance = ["Repair","repairChanceWithoutKit", 0] call ExileLifeClient_system_attribute_getValue;
	}
	else
	{
		_chance = ["Repair","repairChanceWithKit", 0] call ExileLifeClient_system_attribute_getValue;
	};
};
_description = _description + format["<t size='1' font='puristaMedium' align='left'>Weapon Equipped</t>"];
if (_itemClassName isEqualTo (primaryweapon player) || {_itemClassName isEqualTo (handgunWeapon player)}) then 
{
	_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#b2ec00", "TRUE"];
}
else
{
	_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#ea0000", "FALSE"];
	_canRepairGun = false;
};
_description = _description + format["<br/><br/><t size='1' font='puristaMedium' align='left' color='%1'>%2</t>", "#ffca12", format["You have a %1%2 of successfully repairing", _chance * 100, "%"]];
(_dialog displayCtrl 5002) ctrlShow false;
(_dialog displayCtrl 5001) ctrlShow false;
(_dialog displayCtrl 5004) ctrlShow true;
if (_canRepairGun) then 
{
	_description = _description + format["<br/><t size='1' font='puristaMedium' align='left' color='%1'>%2</t>", "#b2ec00", "You can repair this gun."];	
}
else 
{
	_description = _description + format["<br/><t size='1' font='puristaMedium' align='left' color='%1'>%2</t>", "#ea0000", "You cannot repair this gun yet."];
	(_dialog displayCtrl 5004) ctrlEnable false; 
};
(_dialog displayCtrl 5000) ctrlSetText _repairPicture;
(_dialog displayCtrl 5003) ctrlSetStructuredText parseText _description;
true