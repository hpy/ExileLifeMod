/**
                    * ExileClientOverwrites_object_item_use
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

                    private["_itemClassName","_configName","_config","_feedbackString","_returnItemClass"];
_itemClassName = _this select 0;
_configName = param[1,"Using"];
if !(_itemClassName in (magazines player)) exitWith {false};
if( isClass(configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> _configName) ) then
{
	_config = configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> _configName;
	_feedbackString = "";
	_feedbackString = _config call ExileLifeClient_object_item_checkOptions;
	if(_feedbackString isEqualTo "")then{
		if (getNumber(_config >> "doNotRemoveItem") != 1)then{
			player removeItem _itemClassName;
		};			
		_returnItemClass = getText (_config >> "returnedItem");
		if( _returnItemClass != "" ) then
		{
			[player, _returnItemClass] call ExileLifeClient_util_playerCargo_addOrDrop;
		};
	}
	else 
	{
		["ErrorTitleAndText", ["Failed!", format["%1",_feedbackString]]] call ExileClient_gui_toaster_addTemplateToast;
	};
};
true