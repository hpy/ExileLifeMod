/**
                    * ExilelifeClient_gui_jobs_trader_quarterMaster_event_onPurchaseTerritoryButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_canAdd"];
_canAdd = [player,"ExileLife_Item_SleepingBag"] call ExileClient_util_playerCargo_canAdd;
if(_canAdd)then
{
	["PurchaseTerritory", [ExileLifeCurrentTradersGang]] call ExileClient_system_network_send;
}
else
{	
	["ErrorTitleAndText", ["Your inventory is full!", "You need more inventory space to carry a sleeping bag!"]] call ExileClient_gui_toaster_addTemplateToast;
};
closeDialog 0;
true