/**
                    * ExileClientOverwrites_gui_xm8_slide_extraApps_showApp
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

                    private["_display","_config","_resource","_slidesControlGroup"];
diag_log format["DEBUG: ExileClient_gui_xm8_slide_extraApps_showApp: %1",_this];
 disableSerialization;
 _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
 _config = missionConfigFile >> _this;
 _resource = getText(_config >> "resource");
 if !(_resource isEqualTo "") then
 {
 	_slidesControlGroup = _display displayCtrl 4007;
 	_display ctrlCreate [_resource, getNumber(missionConfigFile >> _resource >> "idc"), _slidesControlGroup];
 };
 call compile (getText(_config >> "onButtonClick"));
