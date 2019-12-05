/**
                    * ExilelifeClient_gui_settings_tab_keybinding_event_onLBSelChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_listbox","_textField","_text"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeSettings",displayNull];
_listbox = _display displayCtrl 23108;
_textField = _display displayCtrl 23110;
_text = ((_listbox lbData (lbCursel _listbox)) splitString "|") select 0;
if !(_text isEqualTo "") then
{
	_textField ctrlSetStructuredText parseText format["<t size='0.8' shadow='0'>%1</t>",_text];
}
else
{
	_textField ctrlSetStructuredText parseText "";
};
true