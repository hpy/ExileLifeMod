/**
                    * ExilelifeClient_gui_virtualGarageDialog_event_onDropDownSelectionChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_comboBox","_index","_sel"];
disableSerialization;
_comboBox = _this select 0;
_index = _this select 1;
_sel = _comboBox lbData _index;
[_sel] call ExileLifeClient_gui_virtualGarageDialog_updateVehicleListBox;
true