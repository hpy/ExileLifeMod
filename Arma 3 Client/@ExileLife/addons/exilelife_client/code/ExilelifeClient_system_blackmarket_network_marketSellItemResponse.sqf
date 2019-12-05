/**
                    * ExilelifeClient_system_blackmarket_network_marketSellItemResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_responseCode","_sellPrice","_itemClassName","_quantity","_containerType","_containerNetID","_newPlayerRespect","_newPlayerRespectString","_respect","_containersBefore","_containersAfter","_vehicle","_dialog"];
_responseCode = _this select 0;
_sellPrice = _this select 1;
_itemClassName = _this select 2;
_quantity  = _this select 3;
_containerType = _this select 4;
_containerNetID = _this select 5;
if (_responseCode isEqualTo 0) then
{
	_newPlayerRespect = parseNumber _newPlayerRespectString;
	_respect = _newPlayerRespect - ExileClientPlayerScore;
	ExileClientPlayerScore = _newPlayerRespect;
	switch (_containerType) do
	{
		case 1:
		{
			_containersBefore = [uniform player, vest player, backpack player];
			[player, _itemClassName] call ExileClient_util_playerCargo_remove;
			_containersAfter = [uniform player, vest player, backpack player];
			if !(_containersAfter isEqualTo _containersBefore) then
			{
				call ExileClient_gui_traderDialog_updateInventoryDropdown;
			};
		};
		case 2:
		{
			[(uniformContainer player), _itemClassName] call ExileClient_util_containerCargo_remove;
		};
		case 3:
		{
			[(vestContainer player), _itemClassName] call ExileClient_util_containerCargo_remove;
		};
		case 4:
		{
			[(backpackContainer player), _itemClassName] call ExileClient_util_containerCargo_remove;
		};
		case 5:
		{
			_vehicle = objectFromNetId _containerNetID;
			[_vehicle, _itemClassName] call ExileClient_util_containerCargo_remove;
		};
	};
	["SuccessTitleAndText", ["Item sold!", format ["+%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/>", _sellPrice]]] call ExileClient_gui_toaster_addTemplateToast;
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
	["ErrorTitleAndText", ["Whoops!", format ["Something went really wrong. Please tell a server admin that you have tried to sell an item and tell them the code '%1'. Thank you!", _responseCode]]] call ExileClient_gui_toaster_addTemplateToast;
};
ExileClientIsWaitingForServerTradeResponse = false;