/**
                    * ExilelifeClient_gui_blackmarket_event_onInventoryLBSelectionChange
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_listBox","_index","_dialog","_sellButton"];
disableSerialization;
_listBox = _this select 0;
_index = _this select 1;
_dialog = uiNameSpace getVariable ["RscExileLifeBlackMarket", displayNull];
_sellButton = _dialog displayCtrl 18108;
if (ExileClientIsWaitingForServerTradeResponse) then
{
	_sellButton ctrlEnable false;
}
else
{
	if (_index > -1) then
	{
		_sellButton ctrlEnable !(_listBox lbValue _index isEqualTo -1);
		["",""] call ExileLifeClient_gui_blackmarket_updateItemInfo;
		ExileLifeBlackMarketSelectedClassname = "";
	}
	else
	{
		_sellButton ctrlEnable false;
	};
};
true