/**
                    * ExilelifeClient_gui_blackmarket_updatePlayerInventory
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_inventoryListBox","_inventoryDropdown","_dropdownIndex","_location","_items","_currentLoad","_maximumLoad","_containerClass","_tradeVehicleNetID","_tradeVehicleObject","_inventoryLoadProgress","_inventoryLoadValue","_itemClassName","_configName","_sellPrice","_indexEntryIndex","_canSellItem","_tradeContainerType","_containerClassName","_containerContainer","_itemsInContainer"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeBlackMarket",displayNull];
_inventoryListBox = _display displayCtrl 18106;
lbClear _inventoryListBox;
_inventoryDropdown = _display displayCtrl 18105;
_dropdownIndex = lbCurSel _inventoryDropdown;
_location = _inventoryDropdown lbValue _dropdownIndex;
_items = [];
switch (_location) do
{
    case 1:
    {
        _currentLoad = (loadAbs player);
        _maximumLoad = getNumber(configfile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
        _items = [player, true] call ExileClient_util_playerEquipment_list;
    };
    case 2:
    {
        _containerClass = getText(configFile >> "CfgWeapons" >> (uniform player) >> "ItemInfo" >> "containerClass");
        _maximumLoad = getNumber(configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
        _currentLoad = (loadUniform player) * _maximumLoad;
        _items = (uniformContainer player) call ExileClient_util_containerCargo_list;
    };
    case 3:
    {
        _containerClass = getText(configFile >> "CfgWeapons" >> (vest player) >> "ItemInfo" >> "containerClass");
        _maximumLoad = getNumber(configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
        _currentLoad = (loadVest player) * _maximumLoad;
        _items = (vestContainer player) call ExileClient_util_containerCargo_list;
    };
    case 4:
    {
        _maximumLoad = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumLoad");
        _currentLoad = (loadBackpack player) * _maximumLoad;
        _items = (backpackContainer player) call ExileClient_util_containerCargo_list;
    };
    default
    {
        _tradeVehicleNetID = _inventoryDropdown lbData _dropdownIndex;
        _tradeVehicleObject = objectFromNetId _tradeVehicleNetID;
        _maximumLoad = getNumber(configFile >> "CfgVehicles" >> (typeOf _tradeVehicleObject) >> "maximumLoad");
        _items = _tradeVehicleObject call ExileClient_util_containerCargo_list;
        _currentLoad = _items call ExileClient_util_gear_calculateLoad;
    };
};
_inventoryLoadProgress = _display displayCtrl 18137;
_inventoryLoadProgress progressSetPosition (_currentLoad / (_maximumLoad max 1));
_inventoryLoadValue = _display displayCtrl 18139;
_inventoryLoadValue ctrlSetStructuredText (parseText format["<t size='1' font='puristaMedium' align='right'>%1/%2</t>", round(_currentLoad), _maximumLoad]);
{
    _itemClassName = _x;
    _configName = _x call ExileClient_util_gear_getConfigNameByClassName;
    _sellPrice = _itemClassName call ExileClient_util_gear_calculateSellPrice;
    _indexEntryIndex = _inventoryListBox lbAdd getText(configFile >> _configName >> _itemClassName >> "displayName");
    _inventoryListBox lbSetData [_indexEntryIndex, _itemClassName];
    _inventoryListBox lbSetPicture [_indexEntryIndex, getText(configFile >> _configName >> _itemClassName >> "picture")];
    _canSellItem = true;
    if (_tradeContainerType isEqualTo 1) then
    {
        scopeName "OUTER";
        {
            _containerClassName = _x select 0;
            _containerContainer = _x select 1;
            if (_itemClassName isEqualTo _containerClassName) then
            {
                _itemsInContainer = _containerContainer call ExileClient_util_containerCargo_list;
                if !((count _itemsInContainer) isEqualTo 0) then
                {
                    _canSellItem = false;
                    breakTo "OUTER";
                };
            };
        }
        forEach
        [
            [uniform player, uniformContainer player],
            [vest player, vestContainer player],
            [backpack player, backpackContainer player]
        ];
        if (_itemClassName isEqualTo (primaryWeapon player)) then
        {
            {
                {
                    if !(_x isEqualTo "") then
                    {
                        _sellPrice = _sellPrice + (_x call ExileClient_util_trading_getSellPrice)
                    };
                }
                forEach _x;
            }
            forEach
            [
                primaryWeaponItems player,
                primaryWeaponMagazine player
            ];
        };
        if (_itemClassName isEqualTo (handgunWeapon player)) then
        {
            {
                {
                    if !(_x isEqualTo "") then
                    {
                        _sellPrice = _sellPrice + (_x call ExileClient_util_trading_getSellPrice);
                    };
                }
                forEach _x;
            }
            forEach
            [
                handgunItems player,
                handgunMagazine player
            ];
        };
    };
    if (_canSellItem) then
    {
        if (_sellPrice > 0) then
        {
            _inventoryListBox lbSetValue [_indexEntryIndex, _sellPrice];
            _inventoryListBox lbSetTextRight [_indexEntryIndex, format["%1", _sellPrice]];
            _inventoryListBox lbSetPictureRight [_indexEntryIndex, "exile_assets\texture\ui\poptab_trader_ca.paa"];
        }
        else
        {
            _inventoryListBox lbSetValue [_indexEntryIndex, -1];
            _inventoryListBox lbSetColorRight [_indexEntryIndex, [0.5, 0.5, 0.5, 1]];
            _inventoryListBox lbSetTextRight [_indexEntryIndex, "(unsaleable)"];
        };
    }
    else
    {
        _inventoryListBox lbSetValue [_indexEntryIndex, -1];
        _inventoryListBox lbSetColorRight [_indexEntryIndex, [0.5, 0.5, 0.5, 1]];
        _inventoryListBox lbSetTextRight [_indexEntryIndex, "(not empty)"];
    };
}
forEach _items;
_inventoryListBox lbSetCurSel 0;
_inventoryListBox ctrlRemoveAllEventHandlers "LBSelChanged";
_inventoryListBox ctrlSetEventHandler ["LBSelChanged","_this call ExilelifeClient_gui_blackmarket_event_onInventoryLBSelectionChange;"];
true