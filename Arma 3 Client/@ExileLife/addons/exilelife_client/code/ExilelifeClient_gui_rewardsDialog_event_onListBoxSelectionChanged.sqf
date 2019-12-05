/**
                    * ExilelifeClient_gui_rewardsDialog_event_onListBoxSelectionChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_listBox","_index","_dialog","_claimButton","_background","_title","_claimCode","_edit","_itemClassName","_claimDropdown","_loadValue","_selectedInventoryDropdownIndex","_currentContainerType","_canBuyItem","_tradingResult","_itemInformation","_itemType","_containerNetID","_containerVehicle"];
disableSerialization;
_listBox = _this select 0;
_index = _this select 1;
_dialog = uiNameSpace getVariable ["RscExileLifeRewardsDialog", displayNull];
_claimButton = _dialog displayCtrl 2004;
_background = _dialog displayCtrl 3000;
_title = _dialog displayCtrl 3001;
_claimCode = _dialog displayCtrl 3002;
_edit = _dialog displayCtrl 3003;	
{
	_x ctrlEnable false;
	_x ctrlShow false;
	_x ctrlSetFade 1;
	_x ctrlCommit 0;
} forEach [_background,_title,_edit,_claimCode];
if (_index > -1) then
{
	_itemClassName = _listBox lbData _index;
	_claimDropdown = _dialog displayCtrl 2005;
	_loadValue = _dialog displayCtrl 2008;
	_selectedInventoryDropdownIndex = lbCurSel _claimDropdown;
	_currentContainerType = _claimDropdown lbValue _selectedInventoryDropdownIndex;
	_canBuyItem = true;
	_tradingResult = 0;
	try 
	{
		if (_itemClassName == "ExileMoney" || _itemClassName == "ExileScore" || (_itemClassName isKindOf "AllVehicles")) then 
		{
			_claimDropdown ctrlEnable false;
		} else {
			_claimDropdown ctrlEnable true;
			switch (_currentContainerType) do
			{
				case 1:
				{
					_itemInformation = [_itemClassName] call BIS_fnc_itemType;
					_itemType = _itemInformation select 1;
					if !([player, _itemClassName] call ExileClient_util_playerCargo_canAdd) then
					{
						throw 9;
					};
				};
				default 
				{
					_containerNetID = _claimDropdown lbData _selectedInventoryDropdownIndex;
					_containerVehicle = objectFromNetId _containerNetID;
					if (_containerVehicle isEqualTo objNull) then 
					{
						throw 8;
					};
					if !([_containerVehicle, _itemClassName] call ExileClient_util_containerCargo_canAdd) then 
					{
						throw 9;
					};
				};
			};
		};
	}
	catch
	{
		_tradingResult = _exception;
		_canBuyItem = false;
	};
	if (ExileClientIsWaitingForServerTradeResponse) then
	{
		_canBuyItem = false;
	};
	if (_canBuyItem) then 
	{
		_claimButton ctrlEnable true;
	}
	else 
	{
		_claimButton ctrlEnable false;
	};
}
else 
{
	_claimButton ctrlEnable false;
};
true