/**
                    * ExilelifeClient_gui_farming_seedSelection_event_onInventoryUpdate
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_inventoryListBox","_items","_uniform","_vest","_backpack","_totalArray","_checked","_item","_count","_itemClassName","_configName","_indexEntryIndex"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeSeedSelectionDialog",displayNull];
_inventoryListBox = _display displayCtrl 20106;
lbClear _inventoryListBox;
_items = [];
_uniform = (uniformContainer player) call ExileClient_util_containerCargo_list;
_vest = (vestContainer player) call ExileClient_util_containerCargo_list;
_backpack = (backpackContainer player) call ExileClient_util_containerCargo_list;
_totalArray = (_uniform + _vest + _backpack);
_checked = [];
{
	_item = _x;
	if !(_item in _checked) then
	{
		if (isText(configFile >> "CfgMagazines" >> _item >> "plantclassname")) then
		{
			_count = {_x isEqualTo _item} count _totalArray;
			_items pushbackUnique [_x,_count];
			_checked pushbackUnique _x;
		};
	};
} forEach _totalArray;
if !(_items isEqualTo []) then
{
	{
	    _itemClassName = _x select 0;
	    _count = _x select 1;
	    _configName = _itemClassName call ExileClient_util_gear_getConfigNameByClassName;
	    _indexEntryIndex = _inventoryListBox lbAdd getText(configFile >> _configName >> _itemClassName >> "displayName");
	    _inventoryListBox lbSetData [_indexEntryIndex, _itemClassName];
	    _inventoryListBox lbSetPicture [_indexEntryIndex, getText(configFile >> _configName >> _itemClassName >> "picture")];
	    _inventoryListBox lbSetTextRight [_indexEntryIndex,format["x%1",_count]];
	}
	forEach _items;
	_inventoryListBox ctrlRemoveAllEventHandlers "LBSelChanged";
	_inventoryListBox ctrlSetEventHandler ["LBSelChanged","_this call ExileLifeClient_gui_farming_seedSelection_event_onInventorySelection;"];
	_inventoryListBox lbSetCurSel 0;
};
true