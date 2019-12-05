/**
                    * ExilelifeClient_gui_blackmarket_updateItemInfo
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_itemClassName","_dialog","_itemPicture","_i","_purchaseButton","_stock","_itemConfig","_promotedStats","_controlID"];
disableSerialization;
_itemClassName = _this select 0;
_dialog = uiNameSpace getVariable ["RscExileLifeBlackMarket", displayNull];
_itemPicture = _dialog displayCtrl 18110;
_itemPicture ctrlShow false;
for "_i" from 18111 to 18134 do
{
    (_dialog displayCtrl _i) ctrlShow false;
};
if !(_itemClassName isEqualTo "") then
{
    if !(ExileClientIsWaitingForServerTradeResponse) then {
        _purchaseButton = _dialog displayCtrl 18135;
        _purchaseButton ctrlEnable true;
    };
    _stock = -1;
    {
        if ((_x select 0) isEqualTo _itemClassName) exitWith
        {
            _stock = parseNumber(_x select 1);
        };
    }
    forEach ExileLifeBlackMarketInventory;
    if (_stock > 0) then
    {
        _itemConfig = _itemClassName call ExileClient_util_gear_getConfigNameByClassName;
        _itemPicture ctrlShow true;
        _itemPicture ctrlSetText getText(configFile >> _itemConfig >> _itemClassName >> "picture");
        _promotedStats = _itemClassName call ExileClient_util_item_getMainStats;
        _promotedStats pushBack ["STOCK",format["<t size='1' font='puristaMedium' align='right'>%1</t>",_stock],_stock / 99];
        _controlID = 18111;
        {
            (_dialog displayCtrl _controlID) ctrlShow true;
            (_dialog displayCtrl (_controlID + 2)) ctrlSetText (_x select 0);
            (_dialog displayCtrl (_controlID + 2)) ctrlShow true;
            (_dialog displayCtrl (_controlID + 3)) ctrlSetStructuredText parseText (_x select 1);
            (_dialog displayCtrl (_controlID + 3)) ctrlShow true;
            (_dialog displayCtrl (_controlID + 1)) progressSetPosition (_x select 2);
            (_dialog displayCtrl (_controlID + 1)) ctrlShow true;
            (_dialog displayCtrl (_controlID + 1)) ctrlCommit 1;
            _controlID = _controlID + 4;
        }
        forEach _promotedStats;
        ExileLifeBlackMarketSelectedClassname = _itemClassName;
    }
    else
    {
        ExileLifeBlackMarketSelectedClassname = "";
    };
};
true