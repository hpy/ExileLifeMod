/**
                    * ExilelifeClient_gui_xm8_slide_notify_event_onLBSelChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_listbox","_mainText","_subText","_index","_data","_mainRaw","_subRaw"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileXM8",displayNull];
_listbox = _display displayCtrl 32201;
_mainText = _display displayCtrl 32202;
_subText = _display displayCtrl 32203;
_index = _this select 1;
_data = _listbox lbData _index;
if !(_data isEqualTo "") then
{
	_data = _data splitString "`";
	_mainRaw = _data select 0;
	_subRaw = _data select 1;
	_mainText ctrlSetStructuredText parseText "";
	_subText ctrlSetStructuredText parseText "";
	_mainText ctrlSetStructuredText parseText format["<t size='1.5' shadow='0' align='center' valign='middle'>%1</t>",_mainRaw];
	if !(_subRaw isEqualTo "") then{
		_subText ctrlSetStructuredText parseText format["<t shadow='0'>%1</t>",_subRaw];
	};
};
true