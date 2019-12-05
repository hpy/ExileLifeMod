/**
                    * ExilelifeClient_gui_jobs_trader_quarterMaster_event_onPayTerritoryButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_territoryDropDown","_sleepingBagNetID"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
_territoryDropDown = _display displayCtrl 16113;
_sleepingBagNetID = _territoryDropDown lbData (lbCurSel _territoryDropDown);
["payTerritoryProtectionMoneyRequest", [_sleepingBagNetID]] call ExileClient_system_network_send;
ExileLifeTempParams = nil;
closeDialog 0;