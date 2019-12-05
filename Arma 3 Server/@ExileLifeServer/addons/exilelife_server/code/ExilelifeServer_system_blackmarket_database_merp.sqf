/**
                    * ExilelifeServer_system_blackmarket_database_merp
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

                    private["_option","_itemClassName","_quantity"];
_option = _this select 0;
_itemClassName = _this select 1;
_quantity = _this select 2;
switch (toUpper(_option)) do
{
	case ("CREATE"):
	{
        BlackMarketInventory pushbackUnique [_itemClassName,str(_quantity)];
        format["createItem:%1:%2",_itemClassName,_quantity] call ExileServer_system_database_query_fireAndForget;
	};
	case ("ADD"):
	{
		{
            if ((_x select 0) isEqualTo _itemClassName) exitWith
            {
                BlackMarketInventory set [_forEachIndex,[(_x select 0),str(parseNumber(_x select 1) + _quantity)]];
            };
        }
        forEach BlackMarketInventory;
        format["addStock:%1:%2",_quantity,_itemClassName] call ExileServer_system_database_query_fireAndForget;
	};
	case ("REMOVE"):
	{
		{
	        if ((_x select 0) isEqualTo _itemClassName) exitWith
	        {
	            if !((parseNumber(_x select 1) - _quantity) <= 0) then
	            {
	                BlackMarketInventory set [_forEachIndex,[(_x select 0),str(parseNumber(_x select 1) - _quantity)]];
	            }
	            else
	            {
	                BlackMarketInventory deleteAt _forEachIndex;
	            };
	        };
	    }
	    forEach BlackMarketInventory;
	    format["removeStock:%1:%2",_quantity,_itemClassName] call ExileServer_system_database_query_fireAndForget;
	};
};
["marketUpdateInventory",[BlackMarketInventory]] call ExileServer_system_network_send_broadCast;