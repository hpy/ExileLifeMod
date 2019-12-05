/**
                    * ExilelifeClient_object_item_forceUse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_target","_itemClassName","_config","_feedbackString","_returnItemClass"];
_target = _this select 0;
_itemClassName = _this select 1;
if !(_itemClassName in (magazines player)) exitWith {false};
if(isClass(configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Using_Victim") ) then
{
	_config = configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Using_Victim";
	_feedbackString = "";
	_feedbackString = [_config,_target] call ExileLifeClient_object_item_checkOptionsVictim; 
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