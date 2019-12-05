/**
                    * ExilelifeClient_system_blackmarket_network_marketBuyItemResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_responseCode","_salesPrice","_itemClassName","_quantity","_containerType","_containerNetID","_containersBefore","_containersAfter","_vehicle","_dialog"];
_responseCode = _this select 0;
_salesPrice = _this select 1;
_itemClassName = _this select 2;
_quantity  = _this select 3;
_containerType = _this select 4;
_containerNetID = _this select 5;
if (_responseCode isEqualTo 0) then
{
	switch (_containerType) do
	{
		case 1:
		{
			_containersBefore = [uniform player, vest player, backpack player];
			[player, _itemClassName] call ExileClient_util_playerCargo_add;
			_containersAfter = [uniform player, vest player, backpack player];
			if !(_containersAfter isEqualTo _containersBefore) then
			{
				call ExileClient_gui_traderDialog_updateInventoryDropdown;
			};
		};
		case 2:
		{
			[(uniformContainer player), _itemClassName] call ExileClient_util_containerCargo_add;
		};
		case 3:
		{
			[(vestContainer player), _itemClassName] call ExileClient_util_containerCargo_add;
		};
		case 4:
		{
			[(backpackContainer player), _itemClassName] call ExileClient_util_containerCargo_add;
		};
		case 5:
		{
			_vehicle = objectFromNetId _containerNetID;
			[_vehicle, _itemClassName] call ExileClient_util_containerCargo_add;
		};
	};
	["SuccessTitleAndText", ["Item purchased!", format ["-%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/>", _salesPrice]]] call ExileClient_gui_toaster_addTemplateToast;
	_dialog = uiNameSpace getVariable ["RscExileLifeBlackMarket", displayNull];
	if !(_dialog isEqualTo displayNull) then
	{
		call ExileLifeClient_gui_blackmarket_updatePlayerStats;
		call ExileLifeClient_gui_blackmarket_updatePlayerInventory;
		call ExileLifeClient_gui_blackmarket_buildButtons;
		[ExileLifeBlackMarketSelectedClassname] call ExileLifeClient_gui_blackmarket_updateItemInfo;
	};
}
else
{
	["ErrorTitleAndText", ["Whoops!", format ["Something went really wrong. Please tell a server admin that you have tried to purchase an item and tell them the code '%1'. Thank you!", _responseCode]]] call ExileClient_gui_toaster_addTemplateToast;
};
ExileClientIsWaitingForServerTradeResponse = false;