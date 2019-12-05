/**
                    * ExilelifeClient_gui_blackmarket_event_onPurchaseButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialog","_sellButton","_purchaseButton","_itemClassName","_quantity","_inventoryDropdown","_selectedInventoryDropdownIndex","_currentContainerType","_containerNetID"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLifeBlackMarket", displayNull];
_sellButton = _dialog displayCtrl 18108;
_sellButton ctrlEnable false;
_sellButton ctrlCommit 0;
_purchaseButton = _dialog displayCtrl 18135;
_purchaseButton ctrlEnable false;
_purchaseButton ctrlCommit 0;
_itemClassName = ExileLifeBlackMarketSelectedClassname;
_quantity = 1; 
if !(_itemClassName isEqualTo "") then
{
	if !(ExileClientIsWaitingForServerTradeResponse) then
	{
		_inventoryDropdown = _dialog displayCtrl 18105;
		_selectedInventoryDropdownIndex = lbCurSel _inventoryDropdown;
		_currentContainerType = _inventoryDropdown lbValue _selectedInventoryDropdownIndex;
		_containerNetID = "";
		if (_currentContainerType isEqualTo 5) then
		{
			_containerNetID = _inventoryDropdown lbData _selectedInventoryDropdownIndex;
		};
		ExileClientIsWaitingForServerTradeResponse = true;
		["marketBuyItemRequest", [_itemClassName, _quantity, _currentContainerType, _containerNetID]] call ExileClient_system_network_send;
	};
};
true