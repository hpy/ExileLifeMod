/**
                    * ExilelifeClient_object_weapon_repairGun
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_itemClassName","_fromType","_toType","_repairedWeapon","_configClassname","_components","_chance","_ammo","_attachments","_magazine","_componentQuantity","_componentItemClassName","_i","_brokenWeapon"];
_itemClassName = _this select 0;
_fromType = _this select 1;
_toType = _this select 2;
_repairedWeapon = _this select 3;
_configClassname = _this select 4;
_components = getArray(missionConfigFile >> "CfgGunRepair" >> _fromType >> _configClassname >> "components");
_chance = 0;
if (_toType isEqualTo "New") then 
{
	_chance = ["Repair","repairChanceForNew"] call ExileLifeClient_system_attribute_getValue;
}
else 
{
	if ((_configClassname find "NoKit") > -1) then 
	{
		_chance = ["Repair","repairChanceWithoutKit"] call ExileLifeClient_system_attribute_getValue;
	}
	else
	{
		_chance = ["Repair","repairChanceWithKit"] call ExileLifeClient_system_attribute_getValue;
	};
};
_ammo = player ammo _itemClassName;
_attachments = player weaponAccessories _itemClassName;
_magazine = [handgunMagazine player, primaryWeaponMagazine player] select ((primaryWeapon player) isEqualTo _itemClassName);
if (random(1) <= _chance) then 
{
	player removeWeapon _itemClassName;
	["SuccessTitleOnly", ["You have sucessfully repaired your weapon"]] call ExileClient_gui_toaster_addTemplateToast;
	{
		_componentQuantity = _x select 0;
		_componentItemClassName = _x select 1;
		for "_i" from 1 to _componentQuantity do 
		{
			[player, _componentItemClassName] call ExileClient_util_playerCargo_remove;
		};
		false
	}
	count _components;
	player addMagazine _magazine;
	player addWeapon _repairedWeapon;
	{
		player addWeaponItem [_repairedWeapon, _x];
		false
	}
	count _attachments;
	player setAmmo [_repairedWeapon, _ammo];
}	
else
{
	if (["CfgGunRepair", "removeComponentsOnFailure", true] call ExileLifeClient_system_setting_getValue) then 
	{
		player removeWeapon _itemClassName;
		["ErrorTitleAndText", ["Failed to repair your weapon!", "Your weapon broke during the repair and is now unusable"]] call ExileClient_gui_toaster_addTemplateToast;
		{
			_componentQuantity = _x select 0;
			_componentItemClassName = _x select 1;
			for "_i" from 1 to _componentQuantity do 
			{
				[player, _componentItemClassName] call ExileClient_util_playerCargo_remove;
			};
			false
		}
		count _components;
		player addMagazine _magazine;
		_brokenWeapon = (_itemClassName call ExileLifeClient_util_weapon_getVariants) select 4;
		player addWeapon _brokenWeapon;
		{
			player addWeaponItem [_brokenWeapon, _x];
			false
		}
		count _attachments;
	}
	else
	{
		["ErrorTitleOnly", ["Failed to repair your weapon!"]] call ExileClient_gui_toaster_addTemplateToast;
	}
};
