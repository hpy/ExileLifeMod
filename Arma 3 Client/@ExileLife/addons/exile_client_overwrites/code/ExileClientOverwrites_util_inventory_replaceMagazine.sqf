/**
                    * ExileClientOverwrites_util_inventory_replaceMagazine
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

                    private["_object","_fromMagazine","_toMagazine","_magazines","_newMagazines","_removed","_groundHolder","_added"];
_object = _this select 0;
_fromMagazine = _this select 1;
_toMagazine = _this select 2;
_magazines = magazinesAmmo _object;
_newMagazines = [];
_removed = false;
if!(_magazines isEqualTo [])then
{
	{
		if((_x select 0) in [_fromMagazine select 0,_toMagazine select 0])then
		{
			if(_removed)then
			{
				_newMagazines pushBack _x;
			}
			else
			{
				if!((_x select 1) isEqualTo (_fromMagazine select 1))then
				{
					_newMagazines pushBack _x;
				}
				else
				{
					_removed = true;
				};
			};
			_object removeItem (_x select 0);
		};
	}
	forEach _magazines;
};
_newMagazines pushBack _toMagazine;
_groundHolder = objNull;
{
	_added = false;
	if (_object isKindOf "Man") then 
	{
		_added = [_object, _x select 0, _x select 1] call ExileClient_util_playerCargo_add;
	}
	else
	{
		_added = [_object, _x select 0, _x select 1] call ExileClient_util_containerCargo_add;
	};
	if !(_added) then 
	{
		if (isNull _groundHolder) then 
		{
			_groundHolder = createVehicle ["GroundWeaponHolder", getPosATL _object, [], 0, "CAN_COLLIDE"];
			_groundHolder setPosATL (getPosATL _object);
		};
		[_groundHolder, _x select 0, _x select 1] call ExileClient_util_containerCargo_add;
		if (!isServer && {isPlayer _object}) then 
		{
			["WarningTitleAndText", ["Failed to add item", "You do not have enough room in your inventory for an item and it's been dropped on the ground"]] call ExileClient_gui_toaster_addTemplateToast;
		};
	};
}
forEach _newMagazines;
_removed
