/**
                    * ExilelifeClient_gui_itemDetails_event_onFillItemDoubleClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_listBoxControl","_listBoxControlIndex","_fillWithClassName","_fillFromClassName","_itemName","_fillNewClassName"];
disableSerialization;
_listBoxControl = _this select 0;
_listBoxControlIndex = _this select 1;
_fillWithClassName = _listBoxControl lbData _listBoxControlIndex;
_fillFromClassName = ExileClientSelectedInventoryItem select 0;
_itemName = (_fillWithClassName splitString "_")select 2;
_fillNewClassName = format ["%1_%2",_fillFromClassName,_itemName];
[player,_fillFromClassName,_fillWithClassName,_fillNewClassName] call ExileLifeClient_util_item_transferContents;
true;