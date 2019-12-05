/**
                    * ExilelifeClient_gui_blackmarket_event_onSortDropdownChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_ctrl","_index","_display","_option","_purchaseButton"];
_ctrl = _this select 0;
_index = _this select 1;
_display = uiNamespace getVariable ["RscExileLifeBlackMarket",displayNull];
_option = _ctrl lbValue _index;
ExileLifeBlackMarketSelectedSort = _option;
ExileLifeBlackMarketSelectedClassname = "";
["",""] call ExileLifeClient_gui_blackmarket_updateItemInfo;
_purchaseButton = _display displayCtrl 18135;
_purchaseButton ctrlEnable false;
call ExileLifeClient_gui_blackmarket_buildButtons;