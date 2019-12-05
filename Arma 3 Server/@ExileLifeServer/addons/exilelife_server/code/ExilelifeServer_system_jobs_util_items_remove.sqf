/**
                    * ExilelifeServer_system_jobs_util_items_remove
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

                    private["_playerObject","_items","_weGood","_type","_itemClassname","_itemQuantity","_i"];
_playerObject = _this select 0;
_items = _this select 1;
_weGood = false;
{
	_type = _x select 0;
	_itemClassname = (_x select 1) select 0;
	_itemQuantity = ((_x select 1) select 1) * -1;
	switch (_type) do
	{
		case ("PHYSICAL"):
		{
			for "_i" from 1 to ((_x select 1) select 1) do
			{
				_weGood = [_playerObject, _itemClassname] call ExileClient_util_playerCargo_remove;
				if !(_weGood) exitWith {};
			};
		};
	};
	if !(_weGood) exitWith {};
}
forEach _items;
_weGood