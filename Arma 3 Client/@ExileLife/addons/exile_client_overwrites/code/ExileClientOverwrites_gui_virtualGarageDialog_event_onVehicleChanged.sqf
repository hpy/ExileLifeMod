/**
                    * ExileClientOverwrites_gui_virtualGarageDialog_event_onVehicleChanged
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_display","_confirmButton","_listBox","_index","_data","_vehicleClass"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileVirtualGarageDialog", displayNull];
_confirmButton = _display displayCtrl 4007;
_listBox = _this select 0;
_index = _this select 1;
_data = parseSimpleArray(_listBox lbData _index);
_vehicleClass = _data select 0;
_display setVariable ["ExileSelectedVehicle", _data select 1];
_confirmButton ctrlEnable !((_data select 1) isEqualTo "");
_vehicleClass call ExileClient_gui_virtualGarageDialog_updateVehicle;