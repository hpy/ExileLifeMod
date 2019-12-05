/**
                    * ExilelifeClient_object_player_event_handleWeaponChances
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_breakChance","_misfireChance","_jamChance","_currentAmmo","_attachments","_brokenWeaponClassname"];
_unit = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;
_mode =	_this select 3;
_ammo = _this select 4;
_magazine =	_this select 5;
_projectile = _this select 6;
_breakChance = getNumber(configFile >> "CfgWeapons" >> _weapon >> "ExileLife" >> "Fired" >> "breakChance");
_misfireChance = getNumber(configFile >> "CfgWeapons" >> _weapon >> "ExileLife" >> "Fired" >> "misfireChance");
_jamChance = getNumber(configFile >> "CfgWeapons" >> _weapon >> "ExileLife" >> "Fired" >> "jamChance");
switch (true) do 
{
	case (random(1) < _misfireChance):
	{
		if (local _projectile) then 
		{
			deleteVehicle _projectile;
			["ErrorTitleOnly", ["Weapon misfired!"]] call ExileClient_gui_toaster_addTemplateToast;
		};
	};
	case (random(1) < _jamChance):
	{
		switch (_weapon) do
		{
			case (primaryWeapon player):
			{
				ExileLifePrimaryWeaponJammed = _weapon;
			};
			case (handGunWeapon player):
			{
				ExileLifeHandgunWeaponJammed = _weapon;
			};
		};
		_currentAmmo = player ammo _weapon;
		if (_currentAmmo > 0) then 
		{						
			missionNamespace setVariable [format["ExileLife_Thread_JammedWeapon_AmmoCount_%1", _weapon], _currentAmmo];
			player setAmmo [currentWeapon player, 0];
			missionNamespace setVariable 
			[
				format["ExileLife_Thread_JammedWeapon_%1", _weapon],
				[0.1, {player setAmmo [(_this select 0), 0]}, [_weapon], true, "Jammed Ammo"] call ExileClient_system_thread_addTask
			];
		};
		["ErrorTitleOnly", ["Weapon jammed!"]] call ExileClient_gui_toaster_addTemplateToast;
	};
	case (random(1) < _breakChance):
	{
		switch (_weapon) do
		{
			case (primaryWeapon player):
			{
				_attachments = primaryWeaponItems player;
			};
			case (handGunWeapon player):
			{
				_attachments = handGunItems player;
			};
		};
		_currentAmmo = player ammo _weapon;
		_brokenWeaponClassname = (_weapon call ExileLifeClient_util_weapon_getVariants) select 4;
		if !(_brokenWeaponClassname isEqualTo "") then 
		{
			[player, _weapon] call ExileClient_util_playerEquipment_remove;
			[player, _brokenWeaponClassname] call ExileClient_util_playerEquipment_add;
			{
				[player, _x] call ExileClient_util_playerEquipment_add;
			}
			forEach _attachments;
			player addMagazine [_magazine, _currentAmmo];
			switch (_weapon) do
			{
				case (primaryWeapon player):
				{
					player selectWeapon "Rifle_Broken";
				};
				case (handGunWeapon player):
				{					
					player selectWeapon "Pistol_Broken";
				};
			};
			["ErrorTitleOnly", ["Weapon broke!"]] call ExileClient_gui_toaster_addTemplateToast;
		};
	};
};
true