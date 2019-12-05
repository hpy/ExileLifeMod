/**
                    * ExilelifeClient_gui_blackmarket_onLoad
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_sortDropdown","_index","_mpos","_pos","_purchaseButton","_sellButton"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeBlackMarket",displayNull];
ExileLifeBlackMarketSelectedClassname = "";
ExileClientIsWaitingForServerTradeResponse = false;
ExileLifeBlackMarketSelectedSort = 0;
_sortDropdown = _display displayCtrl 18140;
{
    _index = _sortDropdown lbAdd _x;
    _sortDropdown lbSetValue [_index,_forEachIndex];
}
forEach ["All","Weapons","Attachments","Ammo","Clothing","Items","Rare Items"];
_sortDropdown lbSetCurSel ExileLifeBlackMarketSelectedSort;
_sortDropdown ctrlSetEventHandler ["LBSelChanged","_this call ExileLifeClient_gui_blackmarket_event_onSortDropdownChanged;"];
call ExileLifeClient_gui_blackmarket_buildButtons;
_display displayAddEventHandler ["MouseZChanged",
{
    _mpos = getMousePosition;
    if (((_mpos select 0) > -0.19 && (_mpos select 0) < 1.19) && ((_mpos select 1) > -0.21 && (_mpos select 1) < 1.24)) then
    {
        if (_this select 1 > 0) then
        {
            if (((ctrlPosition (BlackMarket_Buttons_Range select 0)) select 1) < -0.05) then
            {
                {
                    _pos = ctrlPosition _x;
                    _x ctrlSetPosition
                    [
                        (_pos select 0),
                        (_pos select 1) + 0.05
                    ];
                    _x ctrlCommit 0;
                } forEach BlackMarket_Buttons;
            };
        }
        else
        {
            if ((((ctrlPosition (BlackMarket_Buttons_Range select 1)) select 1) + 0.08) > 0.8) then
            {
                {
                    _pos = ctrlPosition _x;
                    _x ctrlSetPosition
                    [
                        (_pos select 0),
                        (_pos select 1) - 0.05
                    ];
                    _x ctrlCommit 0;
                } forEach BlackMarket_Buttons;
            };
        };
    };
}];
_purchaseButton = _display displayCtrl 18135;
_purchaseButton ctrlEnable false;
_sellButton = _display displayCtrl 18108;
_sellButton ctrlEnable true;
["",""] call ExileLifeClient_gui_blackmarket_updateItemInfo;
call ExileLifeClient_gui_blackmarket_updateDropdown;
call ExileLifeClient_gui_blackmarket_updatePlayerStats;