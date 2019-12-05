/**
                    * ExilelifeClient_object_item_empty
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_itemClassName","_config","_feedbackString","_configEvent","_thread","_returnItemClass","_componentItemName"];
_itemClassName = _this select 0;
if !(_itemClassName in (magazines player)) exitWith {false};
if (isClass(configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Empty") ) then
{
	_config = configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Empty";
	_feedbackString = "";
	_feedbackString = _config call ExileLifeClient_object_item_checkOptions;
	if (_feedbackString isEqualTo "")then{
		_configEvent = getArray (_config >> "event");
		if !(_configEvent isEqualTo []) then
		{
			{
				switch (_x) do
				{
					case "bait":
					{
						if (surfaceIsWater getPos player) then
						{
							ExileLifeFishingBerley = true;
							_thread = [120, {ExileLifeFishingBerley = false}, [], false,"Spawn Fish"] call ExileClient_system_thread_addtask;
							["SuccessTitleAndText", ["Berley", "This should attract some fish!"]] call ExileClient_gui_toaster_addTemplateToast;
						}
						else
						{
						};
					};
					case "chemicalspill":
					{
						if (surfaceIsWater getPos player) then
						{
						}
						else
						{
						};
					};
					case "flammable":
					{
						if (surfaceIsWater getPos player) then
						{
						}
						else
						{
						};
					};
					default {};
				};
			}forEach _configEvent;
		};
		player removeItem _itemClassName;
		_returnItemClass = getText (_config >> "returnedItem");
		if( _returnItemClass != "" ) then
		{
			[player, _returnItemClass] call ExileLifeClient_util_playerCargo_addOrDrop;
		};
		_componentItemName = getText(configFile >> "CfgMagazines" >> _itemClassName >> "displayName");
		["SuccessTitleAndText", ["Emptied item!", (format ["You have emptied out %1",_componentItemName])]] call ExileClient_gui_toaster_addTemplateToast;
	}
	else 
	{
		["ErrorTitleAndText", ["Failed!", format["%1",_feedbackString]]] call ExileClient_gui_toaster_addTemplateToast;
	};
};
true