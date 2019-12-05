/**
                    * ExilelifeClient_gui_jobs_trader_quarterMaster_event_onProtectTerritoryButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_territoryDropDown","_flagNetID"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
_territoryDropDown = _display displayCtrl 16113;
_flagNetID = _territoryDropDown lbData (lbCurSel _territoryDropDown);
["payTerritoryProtectionMoneyRequest", [_flagNetID]] call ExileClient_system_network_send;
ExileLifeTempParams = nil;
closeDialog 0;