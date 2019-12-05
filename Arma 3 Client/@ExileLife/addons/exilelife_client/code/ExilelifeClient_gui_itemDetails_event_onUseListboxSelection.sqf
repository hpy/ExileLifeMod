/**
                    * ExilelifeClient_gui_itemDetails_event_onUseListboxSelection
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_listboxParams","_itemClassName","_listBoxControl","_listBoxControlIndex","_selectionConfig"];
disableSerialization;
if(ExileLifeClientSelected isEqualTo false)exitWith{ExileLifeClientSelected = true;};
_listboxParams = _this select 0;
_itemClassName = _this select 1;
_listBoxControl = _listboxParams select 0;
_listBoxControlIndex = _listboxParams select 1;
_selectionConfig = _listBoxControl lbData _listBoxControlIndex;
if !(_selectionConfig isEqualTo "")then{
	[_itemClassName,_selectionConfig] call ExileClient_object_item_use;
	closeDialog 0; 
	ExileLifeClientSelected = false;
};
