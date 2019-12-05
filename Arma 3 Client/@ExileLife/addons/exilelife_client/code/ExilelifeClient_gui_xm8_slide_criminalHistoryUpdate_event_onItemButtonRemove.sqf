/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistoryUpdate_event_onItemButtonRemove
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_listBoxCtrl","_itemName","_quantity","_index"];
disableSerialization;
if(isNil "ExileLifeSelectedItem")exitWith{};
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_listBoxCtrl = _display displayCtrl 5316;
lbClear _listBoxCtrl;
(ExileLifeInfraction select 1) deleteAt ExileLifeSelectedItem;
ExileLifeSelectedItem = nil;
{
	_itemName = _x select 0;
    _quantity = _x select 1;
	_index = _listBoxCtrl lbAdd format["%1",_itemName];
	_listBoxCtrl lbSetTextRight [_index,format["%1",_quantity]];
	_listBoxCtrl lbSetData [_index, str([_itemName,quantity])];
}forEach (ExileLifeInfraction select 1);
ctrlSetFocus (_display displayCtrl 5216);
ExileLifeSelectedItem = lbCurSel _listBoxCtrl;
true
// instead of asdf                 4