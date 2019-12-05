/**
                    * ExilelifeClient_gui_jobs_trader_quarterMaster_event_onUpgradeTerritoryButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_territoryDropDown","_flagObject"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
_territoryDropDown = _display displayCtrl 16113;
_flagObject = objectFromNetId (_territoryDropDown lbData (lbCurSel _territoryDropDown));
["territoryUpgradeRequest",[_flagObject]] call ExileClient_system_network_send;
closeDialog 0;
ExileLifeTempParams = nil;
true