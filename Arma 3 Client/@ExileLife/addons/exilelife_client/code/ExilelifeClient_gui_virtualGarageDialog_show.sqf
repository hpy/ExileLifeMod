/**
                    * ExilelifeClient_gui_virtualGarageDialog_show
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialog","_retrieveButton","_title","_dropdown","_index"];
disableSerialization;
false call ExileClient_gui_hud_toggle;
ExileClientMoonLight setLightBrightness 5;
createDialog "RscExileLifeVirtualGarageDialog";
_dialog = uiNameSpace getVariable ["RscExileLifeVirtualGarageDialog", displayNull];
_retrieveButton = _dialog displayCtrl 21104;
_retrieveButton ctrlEnable false;
_title = _dialog displayCtrl 21101;
_title ctrlSetText format["%1's Garage",name player];
_dropdown = _dialog displayCtrl 21102;
lbClear _dropdown;
_index = _dropdown lbAdd "Retrieve Vehicle";
_dropdown lbSetData [_index,"RETRIEVE"];
_index = _dropdown lbAdd "Add Vehicle";
_dropdown lbSetData [_index,"ADD"];
_dropdown lbSetCurSel 0;
["RETRIEVE"] call ExileLifeClient_gui_virtualGarageDialog_updateVehicleListBox;
call ExileClient_gui_modelBox_create;