/**
                    * ExilelifeClient_object_player_action_tearUpClothing
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_onPlayer","_onGear","_clothingClassname","_clothingSize","_rags","_list","_removed","_i"];
_onPlayer = false;
_onGear = false;
try
{ 
	_clothingClassname = ExileClientSelectedInventoryItem select 0;
	_clothingSize = (ExileClientSelectedInventoryItem select 0) call ExileClient_util_item_getMaximumLoad;
	if (_clothingSize < 10) then 
	{ 
		throw "You cant tear this into rags";
	};
	_rags = floor(_clothingSize/10); 
	_onGear = [player, _clothingClassname] call ExileLifeClient_util_playercargo_contains;
	if !(_onGear) then 
	{
		if !(uniform player isEqualTo _clothingClassname) then
		{
			throw "You cant tear something you dont have up into rags!";
		};
		_list = ((uniformContainer player) call ExileClient_util_containerCargo_list);
		_removed = [player, _clothingClassname] call ExileClient_util_playercargo_remove;
		if ((_removed) && !(_list isEqualTo [])) then 
		{
			{
				[player, _x] call ExileLifeClient_util_playerCargo_addOrDrop;
			}forEach _list;
		};
	}
	else
	{
		_removed = [player, _clothingClassname] call ExileClient_util_playercargo_remove;
	};
	if !(_removed) then 
	{
		throw "You seem to have lost what you were tearing up!";
	};
	player playMove 'AinvPknlMstpSlayWrflDnon_medic';
	for "_i" from 1 to _rags do
	{
		[player, "Exile_Item_Bandage"] call ExileLifeClient_util_playerCargo_addOrDrop; 
	};
}
catch
{
	["ErrorTitleAndText", ["ERROR", format["%1",_exception]]] call ExileClient_gui_toaster_addTemplateToast;
};
