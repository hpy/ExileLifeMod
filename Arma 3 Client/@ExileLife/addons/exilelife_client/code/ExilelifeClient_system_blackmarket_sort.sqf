/**
                    * ExilelifeClient_system_blackmarket_sort
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_items","_temp","_itemConfig","_itemInformation"];
_items = _this;
switch (ExileLifeBlackMarketSelectedSort) do
{
    case 1: 
    {
        _temp = [];
        {
            _itemConfig = (_x select 0) call ExileClient_util_gear_getConfigNameByClassName;
            _itemInformation = [(_x select 0)] call BIS_fnc_itemType;
            if (_itemConfig isEqualTo "CfgWeapons" && (_itemInformation select 0) isEqualTo "Weapon") then 
            {
                _temp pushBack _x;
            };
        } 
        forEach _items;
        _items = _temp;
    };
    case 2: 
    {
        _temp = [];
        {
            _itemConfig = (_x select 0) call ExileClient_util_gear_getConfigNameByClassName;
            _itemInformation = [(_x select 0)] call BIS_fnc_itemType;
            if 
            (
            	_itemConfig isEqualTo "CfgWeapons" 
            	&& 
            	(
            		(_itemInformation select 0) isEqualTo "Item"
            		&&
            		(
            			(_itemInformation select 1) isEqualTo "AccessoryMuzzle"
            			||
            			(_itemInformation select 1) isEqualTo "AccessoryPointer"
            			||
            			(_itemInformation select 1) isEqualTo "AccessorySights"
            		)
            	)
            ) then 
            {
                _temp pushBack _x;
            };
        } 
        forEach _items;
        _items = _temp;
    };
    case 3: 
    {
        _temp = [];
        {
            _itemConfig = (_x select 0) call ExileClient_util_gear_getConfigNameByClassName;
            if (_itemConfig isEqualTo "CfgMagazines") then 
            {
                _temp pushBack _x;
            };
        } 
        forEach _items;
        _items = _temp;
    };
    case 4: 
    {
        _temp = [];
        {
            _itemConfig = (_x select 0) call ExileClient_util_gear_getConfigNameByClassName;
            _itemInformation = [(_x select 0)] call BIS_fnc_itemType;
            if (_itemConfig isEqualTo "CfgWeapons" && (((_itemInformation select 0) isEqualTo "Equipment") && !(_itemInformation select 1) isEqualTo "Backpack")) then 
            {
                _temp pushBack _x;
            };
        } 
        forEach _items;
        _items = _temp;
    };
    case 5: 
    {
        _temp = [];
        {
            _itemConfig = (_x select 0) call ExileClient_util_gear_getConfigNameByClassName;
            _itemInformation = [(_x select 0)] call BIS_fnc_itemType;
            if 
            (
            	_itemConfig isEqualTo "CfgWeapons" 
            	&& 
            	(
            		(_itemInformation select 0) isEqualTo "Item"
            		&&
            		!(
            			(_itemInformation select 1) isEqualTo "AccessoryMuzzle"
            			||
            			(_itemInformation select 1) isEqualTo "AccessoryPointer"
            			||
            			(_itemInformation select 1) isEqualTo "AccessorySights"
            		)
            	)
            ) then 
            {
                _temp pushBack _x;
            };
        } 
        forEach _items;
        _items = _temp;
    };
    case 6: 
    {
    };
    default {};
};
_items