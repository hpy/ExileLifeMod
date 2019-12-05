/**
                    * ExileClientOverwrites_gui_itemDetails_show
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

                    private["_configName","_itemClassName","_itemConfig","_itemDisplayName","_itemPicture","_requiredTools","_equippedMagazines","_dialog","_hasAllTools","_usingConfig","_multiUse","_multiUseConfigs","_control","_text","_index","_enable","_quality","_qualityColor","_qualityName","_promotedStats","_i","_controlID","_itemDescription","_libraryDescription","_toolItemClassName","_toolItemName","_descriptionControl","_craftingRecipes","_craftingRecipesListBox","_craftingButton","_craftingRecipesCaption","_recipeClassName","_recipeName","_recipePicture","_listItemIndex","_fillWithItemsListBox","_fillingButton","_fillWithItemsCaption","_fillWithItems","_fillItemClassName","_fillItemConfig","_fillItemName","_fillItemPicture","_repairListbox","_repairButton","_type","_config","_repairTo","_repairedWeapon","_allowed","_weaponVariants","_value"];
_configName = _this select 0;
_itemClassName = _this select 1;
_itemConfig = configFile >> _configName >> _itemClassName;
_itemDisplayName = getText(_itemConfig >> "displayName");
_itemPicture = getText(_itemConfig >> "picture");
_requiredTools = [];
_equippedMagazines = magazines player;
ExileClientSelectedInventoryItem = [_itemClassName, _itemDisplayName, _itemPicture];
createDialog "RscExileItemDetailsDialog";
waitUntil { !isNull findDisplay 24004 };
_dialog = uiNameSpace getVariable ["RscExileItemDetailsDialog", displayNull];
(_dialog displayCtrl 1300) ctrlEnable false;
(_dialog displayCtrl 1300) ctrlShow true;
(_dialog displayCtrl 1301) ctrlEnable false;
(_dialog displayCtrl 1301) ctrlShow true;
(_dialog displayCtrl 1302) ctrlEnable false;
(_dialog displayCtrl 1302) ctrlShow true;
(_dialog displayCtrl 1303) ctrlEnable false;
(_dialog displayCtrl 1303) ctrlShow true;
(_dialog displayCtrl 1304) ctrlEnable false;
(_dialog displayCtrl 1304) ctrlShow true;
(_dialog displayCtrl 1305) ctrlEnable false;
(_dialog displayCtrl 1305) ctrlShow true;
(_dialog displayCtrl 1306) ctrlEnable false;
(_dialog displayCtrl 1306) ctrlShow false;
(_dialog displayCtrl 1307) ctrlEnable false;
(_dialog displayCtrl 1307) ctrlShow false;
(_dialog displayCtrl 1308) ctrlEnable false;
(_dialog displayCtrl 1308) ctrlShow false;
(_dialog displayCtrl 5000) ctrlSetText _itemPicture;
if( isClass(_itemConfig >> "Interactions" >> "Consuming") )  then
{
	_requiredTools = getArray (_itemConfig >> "Interactions" >> "Consuming" >> "tools");
	_hasAllTools = true;
	{
		if !(_x in _equippedMagazines) exitWith 
		{
			_hasAllTools = false;
		};
	}
	forEach _requiredTools;
	if(isClass(_itemConfig >> "Interactions" >> "Consuming_Victim") && _hasAllTools && call ExileLifeClient_object_handcuffs_check_canForceItem)then{
		(_dialog displayCtrl 1300) ctrlShow false;
		(_dialog displayCtrl 1306) ctrlEnable true;
		(_dialog displayCtrl 1306) ctrlShow true;
		(_dialog displayCtrl 1306) ctrlSetText getText(_itemConfig >> "Interactions" >> "Consuming_Victim" >> "buttonText");
		diag_log "FORCING CONSUME";
	}else{
		(_dialog displayCtrl 1300) ctrlEnable _hasAllTools;
		(_dialog displayCtrl 1300) ctrlSetText (getText(_itemConfig >> "Interactions" >> "Consuming" >> "buttonText"));
	};
};
if( isClass(_itemConfig >> "Interactions" >> "Using") )  then
{
	_usingConfig = "Using";
	if(isClass(_itemConfig >> "Interactions" >> "Using_Victim") && call ExileLifeClient_object_handcuffs_check_canForceItem)then{
		_usingConfig = "Using_Victim";
	};
	_multiUse = getNumber(_itemConfig >> "Interactions" >> _usingConfig >> "multiUse");
	if (_multiUse isEqualTo 1)then{
		_multiUseConfigs = getArray(_itemConfig >> "Interactions" >> _usingConfig >> "multiUseConfigs");
		(_dialog displayCtrl 1301) ctrlShow false;
		_control = (_dialog displayCtrl 1308);
		_control ctrlEnable true;
		_control ctrlShow true;
		{
			if( isClass(_itemConfig >> "Interactions" >> _x) ) then{
				_requiredTools = getArray (_itemConfig >> "Interactions" >> _x >> "tools");
				_hasAllTools = true;
				{
					if !(_x in _equippedMagazines) exitWith 
					{
						_hasAllTools = false;
					};
				}
				forEach _requiredTools; 
				_text = getText(_itemConfig >> "Interactions" >> _x >> "buttonText");
				_index = _control lbAdd _text;
				if (_hasAllTools) then{
					_control lbSetData [_index, _x];
				}else{
					_control lbSetColor [_index, [1,0,0,1]];
					_control lbSetTooltip [_index, "Tools Missing"];
					_control lbSetData [_index, ""];
				};
			};
		}forEach _multiUseConfigs;
		ExileLifeClientSelected = false;
		_control lbSetCurSel 0;
	}else{
		_requiredTools = getArray (_itemConfig >> "Interactions" >> "Using" >> "tools");
		_hasAllTools = true;
		{
			if !(_x in _equippedMagazines) exitWith 
			{
				_hasAllTools = false;
			};
		}
		forEach _requiredTools; 
		if(_usingConfig isEqualTo "Using_Victim")then{
			(_dialog displayCtrl 1301) ctrlShow false;
			(_dialog displayCtrl 1307) ctrlEnable true;
			(_dialog displayCtrl 1307) ctrlShow true;
			(_dialog displayCtrl 1307) ctrlSetText getText(_itemConfig >> "Interactions" >> "Using_Victim" >> "buttonText");
		}else{
			(_dialog displayCtrl 1301) ctrlEnable _hasAllTools;
			(_dialog displayCtrl 1301) ctrlSetText (getText(_itemConfig >> "Interactions" >> "Using" >> "buttonText"));
		};
	};
};
if( isClass(_itemConfig >> "Interactions" >> "Empty") )  then
{
	_requiredTools = getArray (_itemConfig >> "Interactions" >> "Empty" >> "tools");
	_hasAllTools = true;
	{
		if !(_x in _equippedMagazines) exitWith 
		{
			_hasAllTools = false;
		};
	}
	forEach _requiredTools; 
	(_dialog displayCtrl 1304) ctrlEnable _hasAllTools;
};
if (_itemClassName isKindOf ["Uniform_Base", configFile >> "CfgWeapons"]) then
{
	(_dialog displayCtrl 1304) ctrlEnable true;
	(_dialog displayCtrl 1304) ctrlSetText "Tear Up";
	(_dialog displayCtrl 1304) ctrlRemoveAllEventHandlers "ButtonClick";
	(_dialog displayCtrl 1304) ctrlAddEventHandler ["ButtonClick", {call ExileLifeClient_object_player_action_tearUpClothing}];
	(_dialog displayCtrl 1304) ctrlShow true;
	(_dialog displayCtrl 1304) ctrlCommit 0;
};
if ((["Filters", _itemClassName, "NOPE"] call ExileLifeClient_system_setting_getValue) isEqualType 0) then 
{
	_enable = (["GasMask", "filterDegradation", true] call ExileLifeClient_system_setting_getValue);
};
if( isClass(_itemConfig >> "Interactions" >> "Constructing") )  then
{
	_requiredTools = getArray (_itemConfig >> "Interactions" >> "Constructing" >> "tools");
	_hasAllTools = true;
	{
		if !(_x in _equippedMagazines) exitWith 
		{
			_hasAllTools = false;
		};
	}
	forEach _requiredTools;
	(_dialog displayCtrl 1303) ctrlEnable _hasAllTools;
	(_dialog displayCtrl 1303) ctrlSetText (getText(_itemConfig >> "Interactions" >> "Constructing" >> "buttonText"));
};
_quality = getNumber(missionConfigFile >> "CfgExileArsenal" >> _itemClassName >> "quality");
_qualityColor = "#ffffff";
_qualityName = "Item Level 1";
switch (_quality) do
{
	case 2: 		
	{ 
		_qualityColor = "#9EDD3A";
		_qualityName = "Item Level 2";
	};
	case 3:		
	{ 
		_qualityColor = "#00c8ec";
		_qualityName = "Item Level 3";
	};
	case 4:		
	{ 
		_qualityColor = "#9F4796";
		_qualityName = "Item Level 4";
	};
	case 5:		
	{ 
		_qualityColor = "#ffb418";
		_qualityName = "Item Level 5";
	};
	case 6:		
	{ 
		_qualityColor = "#ec007a";
		_qualityName = "Item Level 6";
	};						
};
(_dialog displayCtrl 5001) ctrlSetStructuredText parseText format["<t size='1.5' color='%1' font='PuristaMedium' align='left'>%2</t><br/>", _qualityColor, _itemDisplayName];
(_dialog displayCtrl 5002) ctrlSetStructuredText parseText format["<t size='1.125' font='PuristaMedium' align='left'>%1</t><br/><br/>", _qualityName];
_promotedStats = _itemClassName call ExileClient_util_item_getMainStats;
for "_i" from 6000 to 6027 do 
{
	(_dialog displayCtrl _i) ctrlShow false;
};
_controlID = 6000;
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
forEach _promotedStats;
_itemDescription = ""; 
if (isText(_itemConfig >> "Library" >> "libTextDesc")) then
{
	_libraryDescription = getText(_itemConfig >> "Library" >> "libTextDesc");
	if (_libraryDescription != "") then
	{
		_itemDescription = _itemDescription + format["<t size='1' font='puristaMedium' align='left'>%1</t><br/><br/>", _libraryDescription];
	};
};
if (_itemDescription == "") then
{
	_itemDescription = getText(_itemConfig >> "descriptionShort");
};
if !(_requiredTools isEqualTo []) then 
{
	_itemDescription = _itemDescription + "<br/><br/>";
	{
		_toolItemClassName = _x;
		_toolItemName = getText(configFile >> "CfgMagazines" >> _toolItemClassName >> "displayName");
		_itemDescription = _itemDescription + format["<t size='1' font='puristaMedium' align='left'>%1</t>", _toolItemName];
		if (_toolItemClassName in _equippedMagazines) then 
		{
			_itemDescription = _itemDescription + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#b2ec00", "EQUIPPED"];
		}
		else 
		{
			_itemDescription = _itemDescription + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#ea0000", "NOT EQUIPPED"];
		};
		_itemDescription = _itemDescription + "<br/>";
	}
	forEach _requiredTools;
};
_descriptionControl = (_dialog displayCtrl 1100);
_descriptionControl ctrlSetStructuredText (parseText _itemDescription);
[_descriptionControl] call BIS_fnc_ctrlFitToTextHeight;
_craftingRecipes = _itemClassName call ExileClient_util_item_getCraftingRecipes;
_craftingRecipesListBox = (_dialog displayCtrl 1400);
_craftingButton = (_dialog displayCtrl 1604);
if !(_craftingRecipes isEqualTo []) then 
{
	_craftingRecipesListBox ctrlShow true;
	_craftingRecipesCaption ctrlShow true;
	lbClear _craftingRecipesListBox;
	{
		_recipeClassName = _x select 0;
		_recipeName = _x select 1;
		_recipePicture = _x select 2;
		_listItemIndex = _craftingRecipesListBox lbAdd _recipeName;
		_craftingRecipesListBox lbSetPicture [_listItemIndex, _recipePicture];
		_craftingRecipesListBox lbSetData [_listItemIndex, _recipeClassName];
	}
	forEach _craftingRecipes;
	_craftingButton ctrlShow true;
	_craftingRecipesListBox ctrlShow true;
}
else 
{
	_craftingRecipesListBox ctrlShow false;
	_craftingButton ctrlShow false;
};
_fillWithItemsListBox = (_dialog displayCtrl 1401); 
_fillingButton = (_dialog displayCtrl 1305); 
if (isClass(_itemConfig >> "Interactions" >> "Fill") )  then
{
	_fillWithItemsListBox ctrlShow true;
	_fillWithItemsCaption ctrlShow true;
	_fillWithItems = getArray(_itemConfig >> "Interactions" >> "Fill" >> "possibleItems");
	lbClear _fillWithItemsListBox;
	{
		_fillItemClassName = _x;
		_fillItemConfig = configFile >> "CfgMagazines" >> _fillItemClassName;
		_fillItemName =  getText(_fillItemConfig >> "displayName");
		_fillItemPicture = getText(_fillItemConfig >> "picture");
		_listItemIndex = _fillWithItemsListBox lbAdd _fillItemName;
		_fillWithItemsListBox lbSetPicture [_listItemIndex, _fillItemPicture];
		_fillWithItemsListBox lbSetData [_listItemIndex, _fillItemClassName];
	}
	forEach _fillWithItems;
	_fillingButton ctrlEnable true;
	_fillingButton ctrlShow true;
	_fillWithItemsListBox ctrlShow true;
	(_dialog displayCtrl 1304) ctrlShow false;
}
else 
{
	_fillingButton ctrlEnable false;
	_fillingButton ctrlShow false;
	_fillWithItemsListBox ctrlShow false;
};
_repairListbox = (_dialog displayCtrl 5008);
_repairButton = (_dialog displayCtrl 5006);
if (isClass(configFile >> "CfgWeapons" >> _itemClassName >> "ExileLife")) then 
{
	_type = getText(configFile >> "CfgWeapons" >> _itemClassName >> "ExileLife" >> "ExileLifeWeaponType");
	if !(_type in ["", "New"]) then 
	{
		if (isClass(missionConfigFile >> "CfgGunRepair" >> _type)) then 
		{
			{
				_config = missionConfigFile >> "CfgGunRepair" >> _type >> _x;
				_repairTo = getText(_config >> "type");
				_repairedWeapon = "";
				_allowed = true;
				_weaponVariants = _itemClassName call ExileLifeClient_util_weapon_getVariants;
				switch (_repairTo) do 
				{
					case "New":			{	_repairedWeapon = _weaponVariants select 0;  		};
					case "Used":		{	_repairedWeapon = _weaponVariants select 1;  		};
					case "Worn":		{	_repairedWeapon = _weaponVariants select 2;  		};
					case "Damaged":		{	_repairedWeapon = _weaponVariants select 3;  	};
					case "Broken":		{	_repairedWeapon = _weaponVariants select 4;  	};
					default 			{ 	(format["Invalid repair type: %1", _repairTo]) call ExileLifeClient_util_log;	};
				};
				if !(getArray(_config >> "requiredAttributeNameAndValue") isEqualTo []) then 
				{
					{
						_value = ["Repair", _x select 0, "NO_RETURN"] call ExileLifeClient_system_attribute_getValue;
						if !(_value isEqualTo (_x select 1)) exitWith {	_allowed = false; };
						false
					}
					count (getArray(_config >> "requiredAttributeNameAndValue"));
				};
				if (!(_repairedWeapon isEqualTo "") && {_allowed}) then 
				{
					_index = _repairListbox lbAdd (getText(_config >> "name"));
					_repairListbox lbSetPicture [_index, getText(configFile >> "CfgWeapons" >> _repairedWeapon >> "picture")];
					_repairListbox lbSetData [_index, str([_itemClassName,_type,_repairTo,_repairedWeapon,_x])];
				};
				false
			}
			count ([missionConfigFile >> "CfgGunRepair" >> _type] call ExileLifeClient_util_config_getSubClasses);
			_repairListbox ctrlShow true;
			_repairButton ctrlEnable true;
		};
	};
}
else
{
	_repairListbox ctrlShow false;
	_repairButton ctrlEnable false;
};
true
