/**
                    * ExilelifeClient_gui_xm8_slide_messages_onOpen
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_listBoxCtrl","_msgBoxCtrl","_contents","_index","_foreachIndex"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_listBoxCtrl = _display displayCtrl 31103;
_msgBoxCtrl = _display displayCtrl 31109;
lbClear _listBoxCtrl;
_msgBoxCtrl ctrlSetText "";
ExileLifeSelectedMsg = nil;
{
	_contents = _x select 1;
	_index = _listBoxCtrl lbAdd (_contents select 2); 
	_listBoxCtrl lbSetTextRight [_index,format["%1",(_contents select 0)]]; 
	_listBoxCtrl lbSetData [_foreachIndex,_x select 0]; 
}forEach ExileLifeMessages;
