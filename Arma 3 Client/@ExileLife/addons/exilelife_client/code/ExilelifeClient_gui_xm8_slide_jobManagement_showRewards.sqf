/**
                    * ExilelifeClient_gui_xm8_slide_jobManagement_showRewards
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_rewardsArray","_display","_reward","_temp","_items","_type","_array","_itemClassname","_quantity","_configName","_itemsText"];
disableSerialization;
_rewardsArray = _this;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_reward = _display displayCtrl 31010;
if(_rewardsArray isEqualTo [])exitWith{
    _reward ctrlSetStructuredText parseText format["<t size='0.8'>%1</t>","There are no Rewards for this Job!"];
};
_temp = [];
_items = [];
{
    _type = _x select 0;
    _array = _x select 1;
    switch (toUpper(_type)) do
    {
        case ("MONEY"):
        {
            _temp pushBack format["%1 poptabs",_array select 1];
        };
        case ("RESPECT"):
        {
            _temp pushBack format["%1 Respect",_array select 0];
        };
        case ("PHYSICAL"):
        {
            _itemClassname = _array select 0;
            _quantity = _array select 1;
            _configName = _itemClassname call ExileClient_util_gear_getConfigNameByClassName;
            _items pushBack format[" [x%2] %1",getText(configFile >> _configName >> _itemClassname >> "displayName"),_quantity];
        };
    };
}
forEach _rewardsArray;
if !(_items isEqualTo []) then
{
	_itemsText = _items joinString ", ";
	_temp pushback _itemsText;
};
_reward ctrlSetStructuredText parseText format["<t size='0.8'>%1</t>",(_temp joinString ", ")];
