/**
                    * ExileClientOverwrites_util_inventory_getItemsCarried
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

                    private["_itemsCarried"];
_itemsCarried = [];
{
	if( _x != "") then
	{
		_itemsCarried pushBack toLower(_x);
	};
}
forEach 
[
	(backpack player),
	(goggles player),
	(headgear player),
	(handgunWeapon player),
	(primaryWeapon player),
	(secondaryWeapon player),
	(uniform player),
	(vest player)
];
{ 
	if (_x != "") then
	{
		_itemsCarried pushBack toLower(_x); 
	};
} 
forEach assignedItems player;
{
	{
		if (_x != "") then
		{
			_itemsCarried pushBack toLower(_x); 
		};
	}
	forEach _x;
}
forEach
[
	(handgunItems player),
	(primaryWeaponItems player),
	(secondaryWeaponItems player)
];
{
	{
		{
			if (_x != "") then
			{
				_itemsCarried pushBack toLower(_x); 
			};
		}
		forEach (_x select 0);
	}
	forEach
	[
		(getWeaponCargo _x), 	
		(getItemCargo _x), 		
		(getMagazineCargo _x)	
	];
}
forEach
[
	(uniformContainer player),
	(vestContainer player),
	(backpackContainer player)
];
_itemsCarried