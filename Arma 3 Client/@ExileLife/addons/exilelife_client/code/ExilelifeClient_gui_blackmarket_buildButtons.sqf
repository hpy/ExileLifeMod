/**
                    * ExilelifeClient_gui_blackmarket_buildButtons
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_temp","_items","_playerMoney","_row","_disable","_button","_interation","_itemConfig","_ctrl","_text","_stockNumber","_stockColor","_inStock","_price","_priceColor","_stock","_info","_overlay","_bg"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeBlackMarket",displayNull];
if !(BlackMarket_Buttons isEqualTo []) then
{
	{
		ctrlDelete _x;
	}
	forEach BlackMarket_Buttons;
	if !(BlackMarket_Buttons_Range isEqualTo []) then
	{
		{
			ctrlDelete _x;
		}
		forEach BlackMarket_Buttons_Range;
	};
    {
        _temp = _display displayCtrl _x;
        ctrlDelete _temp;
    } forEach [18998,18999];
};
BlackMarket_Buttons = [];
BlackMarket_Buttons_Range = [];
_items = ExileLifeBlackMarketInventory call ExileLifeClient_system_blackmarket_sort;
_playerMoney = player getVariable ["ExileMoney",0];
_row = 0;
{
    _disable = false;
    _button = _display ctrlCreate ["RscExileXM8AppButton1x1", 18200 + _forEachIndex];
    _interation = _forEachIndex % 4;
    _button ctrlSetPosition
    [
        (-5.5 + (13.5 * _interation)) * 0.025,
        (-0.5 + (9 * _row)) * 0.04,
        10.5 * 0.025,
        7 * 0.04
    ];
    _button ctrlCommit 0;
    _button setVariable ["ListingArray",_x];
    _itemConfig = _x select 0 call ExileClient_util_gear_getConfigNameByClassName;
    _ctrl = _display ctrlCreate ["RscPictureKeepAspect",-1];
	_ctrl ctrlSetText getText(configFile >> _itemConfig >> _x select 0 >> "picture");
    _ctrl ctrlSetPosition
    [
        (-5.5 + (13.5 * _interation)) * 0.025,
        (-0.5 + (9 * _row)) * 0.04,
        10.5 * 0.025,
        7 * 0.04
    ];
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
    _text = _display ctrlCreate ["RscStructuredText",-1];
	_text ctrlSetStructuredText parseText format["<t align='center' valign='middle'>%1</t>",getText(configFile >> _itemConfig >> _x select 0 >> "displayName")];
    _text ctrlSetPosition
    [
        (-5.5 + (13.5 * _interation)) * 0.025,
        ((-0.5 + 1) + (9 * _row)) * 0.04,
        10.5 * 0.025,
        2 * 0.04
    ];
	_text ctrlEnable false;
	_text ctrlCommit 0;
    _stockNumber = parseNumber(_x select 1);
    _stockColor = "#9af311";
    _inStock= "IN STOCK";
    if (_stockNumber < 10) then
    {
        _inStock = format["%1 left",_stockNumber];
        _stockColor = "#ea0000";
    };
    _price = -1;
    if (isClass (missionConfigFile >> "CfgExileLifeBlackMarket" >> "Inventory" >> _x select 0)) then
    {
        _price = getNumber(missionConfigFile >> "CfgExileLifeBlackMarket" >> "Inventory" >> _x select 0 >> "price");
    }
    else
    {
        if (isClass (missionConfigFile >> "CfgExileArsenal" >> _x select 0)) then
        {
            _price = getNumber(missionConfigFile >> "CfgExileArsenal" >> _x select 0 >> "price");
        };
    };
    _priceColor = "#ffffff";
    if (_price < 0) then
    {
        _price = "N/A";
        _disable = true;
        _priceColor = "#ea0000";
    };
    if (_playerMoney < _price) then
    {
        _priceColor = "#ea0000";
        _disable = true;
    };
    _stock = _display ctrlCreate ["RscStructuredText",-1];
	_stock ctrlSetStructuredText parseText format["<t align='right' valign='middle'><t size='1' color='%1'>%2</t><img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1'/><br/><t color='%3'>%4</t></t>",_priceColor,_price,_stockColor,_inStock];
    _stock ctrlSetPosition
    [
        (-5.5 + (13.5 * _interation)) * 0.025,
        ((-0.5 + 4.75) + (9 * _row)) * 0.04,
        10.5 * 0.025,
        4 * 0.04
    ];
	_stock ctrlEnable false;
	_stock ctrlCommit 0;
    BlackMarket_Buttons pushBack _button;
    BlackMarket_Buttons pushBack _ctrl;
    BlackMarket_Buttons pushBack _text;
    BlackMarket_Buttons pushBack _stock;
    _button ctrlSetEventHandler ["ButtonClick","_info = (_this select 0) getVariable ['ListingArray',0];_info call ExileLifeClient_gui_blackmarket_updateItemInfo;"];
    if (_disable) then
    {
        {
            _x ctrlEnable false;
        } forEach [_button,_ctrl,_text,_stock];
        _overlay = _display ctrlCreate ["RscText", 18200 + _forEachIndex + 200];
        _overlay ctrlSetPosition
        [
            (-5.5 + (13.5 * _interation)) * 0.025,
            (-0.5 + (9 * _row)) * 0.04,
            10.5 * 0.025,
            7 * 0.04
        ];
        _overlay ctrlSetBackGroundColor [0,0,0,0.5];
        _overlay ctrlCommit 0;
        _overlay ctrlEnable false;
        BlackMarket_Buttons pushback _overlay;
    };
    if (_interation isEqualTo 0 && _row isEqualTo 0) then
    {
        BlackMarket_Buttons_Range pushBack _button;
    }
    else
    {
        if (ceil((count(_items) / 4)) isEqualTo (_row + 1) && (_interation isEqualTo 0)) then
        {
            BlackMarket_Buttons_Range pushBack _button;
        };
    };
    if (_interation isEqualTo 3) then
    {
        _row = _row + 1;
    };
} forEach _items;
_bg = _display ctrlCreate ["RscStructuredText",18998];
_bg ctrlSetPosition [-9.5 * (0.025) + (0), -12 * (0.04) + (0),59 * (0.025),11 * (0.04)];
_bg ctrlSetBackgroundColor [0.102,0.137,0.176,1];
_bg ctrlCommit 0;
_bg = _display ctrlCreate ["RscStructuredText",18999];
_bg ctrlSetPosition [-9.5 * (0.025) + (0),24.5 * (0.04) + (0),59 * (0.025),12.5 * (0.04)];
_bg ctrlSetBackgroundColor [0.102,0.137,0.176,1];
_bg ctrlCommit 0;