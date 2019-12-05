/**
                    * ExileClientOverwrites_gui_crafting_show
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

                    private["_recipeClassName","_recipeConfig","_recipeName","_pictureItemClassName","_pictureItemConfig","_recipePicture","_canCraftItem","_possibleCraftQuantity","_equippedMagazines","_components","_returnedItems","_tools","_dialog","_description","_componentQuantity","_componentItemClassName","_componentItemName","_equippedComponentQuantity","_toolItemClassName","_toolItemName","_equippedToolQuantity","_concreteMixer","_interactionModelGroupClassName","_interactionModelGroupConfig","_interactionModelGroupName","_interactionModelGroupModels","_foundObject","_i","_listBoxIndex"];
_recipeClassName = _this;
_recipeConfig = missionConfigFile >> "CfgCraftingRecipes" >> _recipeClassName;
_recipeName = getText(_recipeConfig >> "name");
_pictureItemClassName = getText(_recipeConfig >> "pictureItem");
_pictureItemConfig = configFile >> "CfgMagazines" >> _pictureItemClassName;
_recipePicture = getText(_pictureItemConfig >> "picture");
_canCraftItem = true;
_possibleCraftQuantity = 99999;
_equippedMagazines = magazines player;
_components = getArray(_recipeConfig >> "components");
_returnedItems = getArray(_recipeConfig >> "returnedItems");
_tools = getArray(_recipeConfig >> "tools");
createDialog "RscExileCraftItemDialog";
waitUntil { !isNull findDisplay 24005 };
uiNameSpace setVariable ["RscExileCraftItemRecipeClassName", _recipeClassName];
_dialog = uiNameSpace getVariable ["RscExileCraftItemDialog", displayNull];
_description = format["<t size='1.5' font='PuristaMedium' align='left'>%1</t><br/><br/>", _recipeName];
{
	_componentQuantity = _x select 0;
	_componentItemClassName = _x select 1;
	_componentItemName = getText(configFile >> "CfgMagazines" >> _componentItemClassName >> "displayName");
	_equippedComponentQuantity = { _x == _componentItemClassName } count _equippedMagazines;
	_description = _description + format["<t size='1' font='puristaMedium' align='left'>%1</t>", _componentItemName];
	_possibleCraftQuantity = _possibleCraftQuantity min (floor (_equippedComponentQuantity / _componentQuantity));
	if (_equippedComponentQuantity < _componentQuantity ) then
	{
		_canCraftItem = false;
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
		_canCraftItem = false;
	}
	else
	{ 
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#b2ec00", "EQUIPPED"];
	};
	_description = _description + "<br/>";
}
forEach _tools;
if ( getNumber(_recipeConfig >> "requiresOcean") == 1 ) then
{
	_description = _description + format["<t size='1' font='puristaMedium' align='left'>%1</t>", "Ocean"];
	if( surfaceIsWater getPosATL player ) then 
	{
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#b2ec00", "FOUND"];
	}
	else 
	{
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#ea0000", "NOT FOUND"];
		_canCraftItem = false;
	};
	_description = _description + "<br/>";
};
if ( getNumber(_recipeConfig >> "requiresFire") == 1 ) then
{
	_description = _description + format["<t size='1' font='puristaMedium' align='left'>%1</t>", "Fire"];
	if( [player, 4] call ExileClient_util_world_isFireInRange ) then 
	{
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#b2ec00", "FOUND"];
	}
	else 
	{
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#ea0000", "NOT FOUND"];
		_canCraftItem = false;
	};
	_description = _description + "<br/>";
};
if ( getNumber(_recipeConfig >> "requiresConcreteMixer") == 1 ) then
{
	_description = _description + format["<t size='1' font='puristaMedium' align='left'>%1</t>", "Concrete Mixer"];
	_concreteMixer = (ASLtoAGL (getPosASL player)) call ExileClient_util_world_getNearestConcreteMixer;
	if (isNull _concreteMixer) then 
	{
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#ea0000", "NOT FOUND"];
		_canCraftItem = false;
	}
	else 
	{
		_description = _description + format["<t size='1' font='puristaMedium' align='right' color='%1'>%2</t>", "#b2ec00", "FOUND"];
	};
	_description = _description + "<br/>";
};
_interactionModelGroupClassName = getText(_recipeConfig >> "requiredInteractionModelGroup");
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
		_canCraftItem = false;
	};
	_description = _description + "<br/>";
};
if !([_components, _returnedItems] call ExileClient_util_inventory_canExchangeItems) then
{
	_canCraftItem = false;
	_description = _description + format["<br/><t size='1' font='puristaMedium' align='left' color='%1'>%2</t>", "#ea0000", "Your inventory is full."];
};
if( _canCraftItem ) then 
{
	if ( getNumber(_recipeConfig >> "requiresConcreteMixer") isEqualTo 1 ) then
	{
		_possibleCraftQuantity = 1;
	};
	switch (_possibleCraftQuantity) do
	{
		case 1:
		{
			_description = _description + format["<br/><t size='1' font='puristaMedium' align='left' color='%1'>%2</t>", "#b2ec00", "You can craft this item once."];
		};
		case 99999:
		{
			_description = _description + format["<br/><t size='1' font='puristaMedium' align='left' color='%1'>%2</t>", "#b2ec00", "You can craft this item whenever you like."];
			_possibleCraftQuantity = 10; 
		};
		default 
		{
			_description = _description + format["<br/><t size='1' font='puristaMedium' align='left' color='%1'>%2</t>", "#b2ec00", format["You can craft this item %1 times.", _possibleCraftQuantity]];
		};
	};
	for "_i" from 1 to _possibleCraftQuantity do 
	{
		_listBoxIndex = lbAdd[5002, str(_i)]; 
		lbSetValue[5002, _listBoxIndex, _i];
	};
	lbSetCurSel[5002, 0];
}
else 
{
	_description = _description + format["<br/><t size='1' font='puristaMedium' align='left' color='%1'>%2</t>", "#ea0000", "You cannot craft this item yet."];
	(_dialog displayCtrl 5002) ctrlEnable false; 
	(_dialog displayCtrl 5001) ctrlEnable false; 
};
(_dialog displayCtrl 5000) ctrlSetText _recipePicture;
(_dialog displayCtrl 5003) ctrlSetStructuredText parseText _description;
true
