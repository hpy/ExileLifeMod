/**
                    * ExileClientOverwrites_gui_inventory_event_onSlotDoubleClick
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

                    private["_control","_itemClassName","_magazine","_configName"];
disableSerialization;
_control = _this select 0;
_itemClassName = "";
switch (ctrlIDC _control) do 
{
	case 610:  { _itemClassName = primaryWeapon player; }; 
	case 620:  { _itemClassName = (primaryWeaponItems player) select 0; }; 
	case 621:  { _itemClassName = (primaryWeaponItems player) select 1; }; 
	case 622:  { _itemClassName = (primaryWeaponItems player) select 2; }; 
	case 641:  { _itemClassName = (primaryWeaponItems player) select 3; }; 
	case 611:  { _itemClassName = secondaryWeapon player; }; 
	case 624:  { _itemClassName = (secondaryWeaponItems player) select 0; }; 
	case 625:  { _itemClassName = (secondaryWeaponItems player) select 1; }; 
	case 626:  { _itemClassName = (secondaryWeaponItems player) select 2; }; 
	case 642:  { _itemClassName = (secondaryWeaponItems player) select 3; }; 
	case 612:  { _itemClassName = handgunWeapon player; }; 
	case 628:  { _itemClassName = (handgunItems player) select 0; }; 
	case 629:  { _itemClassName = (handgunItems player) select 1; }; 
	case 630:  { _itemClassName = (handgunItems player) select 2; }; 
	case 643:  { _itemClassName = (handgunItems player) select 3; }; 
	case 6240: { _itemClassName = headgear player; }; 
	case 6216: { _itemClassName = goggles player; }; 
	case 6217: { _itemClassName = ""; }; 
	case 6238: { _itemClassName = binocular player; }; 
	case 6211: { _itemClassName = ""; }; 
	case 6215: { _itemClassName = ""; }; 
	case 6212: { _itemClassName = ""; }; 
	case 6214: { _itemClassName = ""; }; 
	case 6213: { _itemClassName = ""; }; 
	case 6331: { _itemClassName = uniform player; }; 
	case 6381: { _itemClassName = vest player; }; 
	case 6191: { _itemClassName = backpack player; }; 
	case 623: 
	{ 
		_magazine = primaryWeaponMagazine player;
		if (count _magazine > 0) then
		{
			_itemClassName = _magazine select 0;
		};
	}; 
	case 627: 
	{ 
		_magazine = secondaryWeaponMagazine player;
		if (count _magazine > 0) then
		{
			_itemClassName = _magazine select 0;
		};
	}; 
	case 631: 
	{ 
		_magazine = handgunMagazine player;
		if (count _magazine > 0) then
		{
			_itemClassName = _magazine select 0;
		};
	};
	case 6194:
	{
		_itemClassName = "";
	};
};
if !(_itemClassName isEqualTo "") then
{
	_configName = _itemClassName call ExileClient_util_gear_getConfigNameByClassName;
	[_configName, _itemClassName] call ExileClient_gui_itemDetails_show;
};
true
