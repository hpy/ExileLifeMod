/**
                    * ExilelifeClient_gui_farming_seedSelection_event_onButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_inventoryListBox"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeSeedSelectionDialog", displayNull];
_inventoryListBox = _display displayCtrl 20106;
ExileLifeSelectedSeed = _inventoryListBox lbData (lbCurSel _inventoryListBox);
_display closeDisplay 0;
true