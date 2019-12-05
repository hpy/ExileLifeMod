/**
                    * ExilelifeClient_gui_settings_tab_keybinding_event_onLBDoubleClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_listbox","_index","_data","_id"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeSettings",displayNull];
_listbox = _display displayCtrl 23108;
ExileLifeKeybindLastSelected = _listbox lbTextRight (lbCurSel _listbox);
_index = lbCurSel _listbox;
_data = _listbox lbData _index;
_id = (_data splitString "|") select 1;
_listbox lbSetTextRight [_index,"Press escape to cancel..."];
_listbox ctrlEnable false;
ExileLifeKeybindWaitingForKeypress = true;
ExileLifeKeybindModifingID = _id;