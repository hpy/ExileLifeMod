/**
                    * ExilelifeClient_gui_virtualGarageDialog_event_onButtonClicked
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialog","_dropdown","_vehicleID","_selection"];
disableSerialization;
_dialog = uiNamespace getVariable ["RscExileLifeVirtualGarageDialog",displayNull];
_dropdown = _dialog displayCtrl 21102;
_vehicleID = uiNameSpace getVariable ["RscExileLifeVirtualGarageDialogVehicle", ""];
_selection = _dropdown lbData (lbCursel 21102);
["processVGRequest", [_selection,_vehicleID]] call ExileClient_system_network_send;
closeDialog 0;