/**
                    * ExilelifeClient_gui_xm8_slide_extraAppsTransition_showApp
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_config","_resource","_slidesControlGroup"];
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
