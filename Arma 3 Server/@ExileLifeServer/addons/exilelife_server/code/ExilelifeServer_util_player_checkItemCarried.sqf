/**
                    * ExilelifeServer_util_player_checkItemCarried
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

                    private["_player","_itemClassName","_containsItem","_itemsCarried"];
_player = _this select 0;
_itemClassName = _this select 1;
_containsItem = false;
_itemsCarried = [];
{
	if( _x != "") then
	{
		_itemsCarried pushBack _x;
	};
}
forEach 
[
	(backpack _player),
	(goggles _player),
	(headgear _player),
	(handgunWeapon _player),
	(primaryWeapon _player),
	(secondaryWeapon _player),
	(uniform _player),
	(vest _player)
];
{ 
	if (_x != "") then
	{
		_itemsCarried pushBack _x; 
	};
} 
forEach assignedItems _player;
{
	{
		if (_x != "") then
		{
			_itemsCarried pushBack _x; 
		};
	}
	forEach _x;
}
forEach
[
	(handgunItems _player),
	(primaryWeaponItems _player),
	(secondaryWeaponItems _player)
];
{
	{
		{
			if (_x != "") then
			{
				_itemsCarried pushBack _x; 
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
	(uniformContainer _player),
	(vestContainer _player),
	(backpackContainer _player)
];
if (_itemsCarried find _itemClassName > 0) then
{
	_containsItem = true;
};
_containsItem
