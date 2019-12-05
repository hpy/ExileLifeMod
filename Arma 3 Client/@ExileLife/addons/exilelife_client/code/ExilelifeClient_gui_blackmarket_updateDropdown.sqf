/**
                    * ExilelifeClient_gui_blackmarket_updateDropdown
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_inventoryDropdown","_index","_nearVehicles"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeBlackMarket",displayNull];
_inventoryDropdown = _display displayCtrl 18105;
lbClear _inventoryDropdown;
_index = _inventoryDropdown lbAdd "Equipment";
_inventoryDropdown lbSetValue [_index, 1];
if !((uniform player) isEqualTo "") then
{
    _index = _inventoryDropdown lbAdd "Uniform";
    _inventoryDropdown lbSetValue [_index, 2];
};
if !((vest player) isEqualTo "") then
{
    _index = _inventoryDropdown lbAdd "Vest";
    _inventoryDropdown lbSetValue [_index, 3];
};
if !((backpack player) isEqualTo "") then
{
    _index = _inventoryDropdown lbAdd "Backpack";
    _inventoryDropdown lbSetValue [_index, 4];
};
_nearVehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], 50];
if !(_nearVehicles isEqualTo []) then
{
    {
        if (local _x) then
        {
            if (alive _x) then
            {
                _index = _inventoryDropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
                _inventoryDropdown lbSetData [_index, netId _x];
                _inventoryDropdown lbSetValue [_index, 5];
            };
        };
    } forEach _nearVehicles;
};
_inventoryDropdown ctrlRemoveAllEventHandlers "LBSelChanged";
_inventoryDropdown ctrlSetEventHandler ["LBSelChanged", "[] call ExileLifeClient_gui_blackmarket_updatePlayerInventory;"];
_inventoryDropdown lbSetCurSel 0;
call ExileLifeClient_gui_blackmarket_updatePlayerInventory;