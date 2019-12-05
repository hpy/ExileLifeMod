/**
                    * ExilelifeClient_gui_blackmarket_event_onSellButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialog","_sellButton","_purchaseButton","_inventoryListBox","_selectedInventoryListBoxIndex","_itemClassName","_quantity","_inventoryDropdown","_selectedInventoryDropdownIndex","_currentContainerType","_containerNetID","_container","_retardCheck"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileLifeBlackMarket", displayNull];
_sellButton = _dialog displayCtrl 18108;
_sellButton ctrlEnable false;
_sellButton ctrlCommit 0;
_purchaseButton = _dialog displayCtrl 18135;
_purchaseButton ctrlEnable false;
_purchaseButton ctrlCommit 0;
_inventoryListBox = _dialog displayCtrl 18106;
_selectedInventoryListBoxIndex = lbCurSel _inventoryListBox;
if !(_selectedInventoryListBoxIndex isEqualTo -1) then
{
	_itemClassName = _inventoryListBox lbData _selectedInventoryListBoxIndex;
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
				_container = objectFromNetId _containerNetID;
				_retardCheck = _container call ExileClient_util_containerCargo_list;
			}
			else
			{
				_retardCheck = player call ExileClient_util_playerCargo_list;
			};
			if (_itemClassName in _retardCheck) then
			{
				ExileClientIsWaitingForServerTradeResponse = true;
				["marketSellItemRequest", [_itemClassName, _quantity, _currentContainerType, _containerNetID]] call ExileClient_system_network_send;
			};
		};
	};
};
true