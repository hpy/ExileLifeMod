/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistoryAdd_event_onItemButtonAdd
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_listBoxCtrl","_itemsInputCtrl","_itemsQuantityCtrl","_itemName","_quantity","_index"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_listBoxCtrl = _display displayCtrl 5224;
_itemsInputCtrl = _display displayCtrl 5221;
_itemsQuantityCtrl = _display displayCtrl 5223;
_itemName = ctrlText _itemsInputCtrl;
_quantity = parseNumber(ctrlText _itemsQuantityCtrl);
if (!(_itemName isEqualTo "") && !(_quantity isEqualTo "")) then 
{
	_index = _listBoxCtrl lbAdd format["%1",_itemName];
	_listBoxCtrl lbSetTextRight [_index,format["%1",_quantity]];
	_listBoxCtrl lbSetData [_index, str([_itemName,_quantity])];
	(ExileLifeInfraction select 1) pushBackUnique ([_itemName,_quantity]);
	_itemName = _itemsInputCtrl ctrlSetText "";
	_quantity = _itemsQuantityCtrl ctrlSetText "";
};
ctrlSetFocus (_display displayCtrl 5216);
true
