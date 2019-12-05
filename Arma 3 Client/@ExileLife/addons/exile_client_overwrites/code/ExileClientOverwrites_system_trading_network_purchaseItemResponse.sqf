/**
                    * ExileClientOverwrites_system_trading_network_purchaseItemResponse
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

                    private["_responseCode","_salesPrice","_itemClassName","_quantity","_containerType","_containerNetID","_containersBefore","_containersAfter","_vehicle","_dialog","_storeListBox"];
_responseCode = _this select 0;
_salesPrice = _this select 1;
_itemClassName = _this select 2;
_quantity  = _this select 3;
_containerType = _this select 4;
_containerNetID = _this select 5;
ExileClientIsWaitingForServerTradeResponse = false;
if (_responseCode isEqualTo 0) then
{
	switch (_containerType) do
	{
		case 1:
		{
			_containersBefore = [uniform player, vest player, backpack player];
			[player, _itemClassName] call ExileLifeClient_util_playerCargo_addOrDrop;
			_containersAfter = [uniform player, vest player, backpack player];
			if !(_containersAfter isEqualTo _containersBefore) then
			{
				call ExileClient_gui_traderDialog_updateInventoryDropdown;
			};
		};
		case 2:
		{
			[(uniformContainer player), _itemClassName] call ExileLifeClient_util_containerCargo_addOrDrop;
		};
		case 3:
		{
			[(vestContainer player), _itemClassName] call ExileLifeClient_util_containerCargo_addOrDrop;
		};
		case 4:
		{
			[(backpackContainer player), _itemClassName] call ExileLifeClient_util_containerCargo_addOrDrop;
		};
		case 5:
		{
			_vehicle = objectFromNetId _containerNetID;
			[_vehicle, _itemClassName] call ExileLifeClient_util_containerCargo_addOrDrop;
		};
	};
	["SuccessTitleAndText", ["Item purchased!", format ["-%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/>", _salesPrice]]] call ExileClient_gui_toaster_addTemplateToast;
	_dialog = uiNameSpace getVariable ["RscExileTraderDialog", displayNull];
	if !(_dialog isEqualTo displayNull) then
	{
		call ExileClient_gui_traderDialog_updateInventoryListBox;
		call ExileClient_gui_traderDialog_updatePlayerControls;
		call ExileClient_gui_traderDialog_updateStoreListBox;
		_storeListBox = _dialog displayCtrl 4009;
		[_storeListBox, lbCurSel _storeListBox] call ExileClient_gui_traderDialog_event_onStoreListBoxSelectionChanged;
	};
}
else 
{
	["ErrorTitleAndText", ["Whoops!", format ["Something went really wrong. Please tell a server admin that you have tried to purchase an item and tell them the code '%1'. Thank you!", _responseCode]]] call ExileClient_gui_toaster_addTemplateToast;
};