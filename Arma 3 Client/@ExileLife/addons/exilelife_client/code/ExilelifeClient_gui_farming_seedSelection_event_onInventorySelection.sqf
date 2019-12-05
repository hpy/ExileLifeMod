/**
                    * ExilelifeClient_gui_farming_seedSelection_event_onInventorySelection
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_inventoryListBox","_itemClassName","_configName"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeSeedSelectionDialog",displayNull];
_inventoryListBox = _display displayCtrl 20106;
_itemClassName = _inventoryListBox lbData (lbCurSel _inventoryListBox);
_configName = _itemClassName call ExileClient_util_gear_getConfigNameByClassName;
(_display displayCtrl 20108) ctrlSetStructuredText parseText format["<t align='center' valign='middle' size='1.5'>%1</t>",getText(configFile >> _configName >> _itemClassName >> "displayName")];
(_display displayCtrl 20107) ctrlSetText getText(configFile >> _configName >> _itemClassName >> "picture");
(_display displayCtrl 20109)	ctrlSetStructuredText parseText format["<t size='0.9'>%1</t>",getText(configFile >> _configName >> _itemClassName >> "descriptionShort")];
true