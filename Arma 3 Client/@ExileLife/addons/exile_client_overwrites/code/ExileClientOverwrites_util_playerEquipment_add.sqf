/**
                    * ExileClientOverwrites_util_playerEquipment_add
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

                    private["_player","_itemClassName","_bulletCount","_itemInformation","_itemCategory","_itemType","_added","_compatibleWeaponItems"];
_player = _this select 0;
_itemClassName = toLower (_this select 1); 
_bulletCount = [_this, 2, -1] call BIS_fnc_param; 
_itemInformation = [_itemClassName] call BIS_fnc_itemType;
_itemCategory = _itemInformation select 0;
_itemType = _itemInformation select 1;
_added = false;
if (_itemCategory isEqualTo "Magazine") then
{
	{
		if !(_x isEqualTo "") then
		{
			switch (_forEachIndex) do
			{
				case 0: 
				{ 
					if ((primaryWeaponMagazine _player) isEqualTo []) then 
					{ 
						_compatibleWeaponItems = _x call ExileClient_util_gear_getCompatibleWeaponItems;
						if (_itemClassName in _compatibleWeaponItems) then
						{	
							if (_bulletCount isEqualTo -1) then 
							{
								_player addPrimaryWeaponItem _itemClassName; 
							}
							else 
							{
								_player addWeaponItem [_x, [_itemClassName, _bulletCount]];
							};
							_added = true;
						};
					}; 
				};
				case 1: 
				{ 
					if ((secondaryWeaponMagazine _player) isEqualTo []) then 
					{ 
						_compatibleWeaponItems = _x call ExileClient_util_gear_getCompatibleWeaponItems;
						if (_itemClassName in _compatibleWeaponItems) then
						{	
							if (_bulletCount isEqualTo -1) then 
							{
								_player addSecondaryWeaponItem _itemClassName; 
							}
							else 
							{
								_player addWeaponItem [_x, [_itemClassName, _bulletCount]];
							};
							_added = true;
						};
					}; 
				};
				case 2: 
				{ 
					if ((handgunMagazine _player) isEqualTo []) then 
					{ 
						_compatibleWeaponItems = _x call ExileClient_util_gear_getCompatibleWeaponItems;
						if (_itemClassName in _compatibleWeaponItems) then
						{	
							if (_bulletCount isEqualTo -1) then 
							{
								_player addHandgunItem _itemClassName; 
							}
							else 
							{
								_player addWeaponItem [_x, [_itemClassName, _bulletCount]];
							};
							_added = true;
						};
					}; 
				};
			};
		};
		if (_added) exitWith {};
	}
	forEach [primaryWeapon _player, secondaryWeapon _player, handgunWeapon _player];
}
else 
{
	switch (_itemType) do 
	{
		case "AssaultRifle", 
		case "Rifle", 
		case "SniperRifle", 
		case "SubmachineGun", 
		case "MachineGun": 
		{
			_player addWeaponGlobal _itemClassName;	 
			removeAllPrimaryWeaponItems _player; 
			_added = true;
		};
		case "Handgun": 
		{
			_player addWeaponGlobal _itemClassName;	 
			_added = true;
		};
		case "LaserDesignator", 
		case "Throw",
		case "Binocular": 
		{
			_player addWeaponGlobal _itemClassName;	 
			_added = true;
		};
		case "GPS", 
		case "Map", 
		case "Radio", 
		case "UAVTerminal", 
		case "Watch", 
		case "Compass", 
		case "Glasses": 
		{
			_player linkItem _itemClassName;
			_added = true;
		};
		case "NVGoggles":
		{
			if (_player getVariable ["ExileLifeClient:Guard",false]) then
 	  	 	{
				_player linkItem _itemClassName;
				_added = true;
			}
			else
			{
				_added = false;
			};
		};	
		case "Headgear": 	{ _player addHeadgear _itemClassName; _added = true; }; 
		case "Backpack": 	{ _player addBackpackGlobal _itemClassName; _added = true; }; 
		case "Uniform": 	{ _player forceAddUniform _itemClassName; _added = true; }; 
		case "Vest": 		{ _player addVest _itemClassName; _added = true; }; 
		case "AccessorySights", 
		case "AccessoryPointer", 
		case "AccessoryMuzzle", 
		case "AccessoryBipod": 
		{
			{
				if !(_x isEqualTo "") then
				{
					_compatibleWeaponItems = _x call ExileClient_util_gear_getCompatibleWeaponItems;
					if (_itemClassName in _compatibleWeaponItems) exitWith
					{	
						switch (_forEachIndex) do
						{
							case 0: { _player addPrimaryWeaponItem _itemClassName; _added = true; }; 
							case 1: { _player addSecondaryWeaponItem _itemClassName; _added = true; }; 
							case 2: { _player addHandgunItem _itemClassName; _added = true; }; 
						};
					};
				};
				if (_added) exitWith {};
			}
			forEach [primaryWeapon _player, secondaryWeapon _player, handgunWeapon _player];
		};
	};
};
_added