/**
                    * ExilelifeClient_gui_rewardsDialog_event_onDropDownSelectionChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_listBox","_index","_dialog","_rewardsListBox"];
disableSerialization;
_listBox = _this select 0;
_index = _this select 1;
_dialog = uiNameSpace getVariable ["RscExileLifeRewardsDialog", displayNull];
_rewardsListBox = _dialog displayCtrl 2003;
_rewardsListBox lbSetCurSel -1;
call ExileLifeClient_gui_rewardsDialog_updateSelection;
true