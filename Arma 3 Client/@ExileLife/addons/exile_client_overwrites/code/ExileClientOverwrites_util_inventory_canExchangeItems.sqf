/**
                    * ExileClientOverwrites_util_inventory_canExchangeItems
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

                    private["_itemsToRemoveFirst","_itemsToAddAfterwards","_result","_uniformLoad","_uniformMaximumLoad","_uniformContent","_itemMass","_vestLoad","_vestMaximumLoad","_vestContent","_backpackLoad","_backpackMaximumLoad","_backpackContent","_quantity","_itemClassName","_i","_index"];
_itemsToRemoveFirst = _this select 0;
_itemsToAddAfterwards = _this select 1; 
_result = true;
_uniformLoad = 0;
_uniformMaximumLoad = (uniform player) call ExileClient_util_gear_getMaximumLoad;
_uniformContent = uniformItems player;
{
    _itemMass = _x call ExileClient_util_gear_getMass;
    _uniformLoad = _uniformLoad + _itemMass;
}forEach _uniformContent;
_vestLoad = 0;
_vestMaximumLoad = (vest player) call ExileClient_util_gear_getMaximumLoad;
_vestContent = vestItems player;
{
    _itemMass = _x call ExileClient_util_gear_getMass;
    _vestLoad = _vestLoad + _itemMass;
}forEach _vestContent;
_backpackLoad = 0;
_backpackMaximumLoad = (backpack player) call ExileClient_util_gear_getMaximumLoad;
_backpackContent = backpackItems player;
{
    _itemMass = _x call ExileClient_util_gear_getMass;
    _backpackLoad = _backpackLoad + _itemMass;
}forEach _backpackContent;
{
    _quantity = _x select 0;
    _itemClassName = _x select 1;
    _itemMass = _itemClassName call ExileClient_util_gear_getMass;
    for "_i" from 1 to _quantity do
    {
        _index = _backpackContent find _itemClassName;
        if (_index != -1) then
        {
            _backpackContent deleteAt _index;
            _backpackLoad = _backpackLoad - _itemMass;
        }
        else 
        {
            _index = _vestContent find _itemClassName;
            if (_index != -1) then
            {
                _vestContent deleteAt _index;
                _vestLoad = _vestLoad - _itemMass;
            }
            else 
            {
                _index = _uniformContent find _itemClassName;
                if (_index != -1) then
                {
                    _uniformContent deleteAt _index;
                    _uniformLoad = _uniformLoad - _itemMass;
                }
            };
        };
    };
} 
forEach _itemsToRemoveFirst;
{
    _quantity = _x select 0;
    _itemClassName = _x select 1;
    _itemMass = _itemClassName call ExileClient_util_gear_getMass;
    for "_i" from 1 to _quantity do
    {
        if (_backpackLoad + _itemMass <= _backpackMaximumLoad) then
        {
            _backpackLoad = _backpackLoad + _itemMass;
        }
        else 
        {
            if (_vestLoad + _itemMass <= _vestMaximumLoad) then
            {
                _vestLoad = _vestLoad + _itemMass;
            }
            else 
            {
                if (_uniformLoad + _itemMass <= _uniformMaximumLoad) then
                {
                    _uniformLoad = _uniformLoad + _itemMass;
                }
                else 
                {
                    _result = false;
                };
            };
        }
    };
}
forEach _itemsToAddAfterwards;
_result