/**
                    * ExilelifeClient_object_player_action_refuelContainer
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_classname","_model","_pos","_dir","_tempItemPos","_tempItem"];
try
{ 
	[true] call ExileLifeClient_object_player_action_holsterweapon;
	if ([player, 'Exile_Item_FuelBarrelEmpty'] call ExileLifeClient_util_playerCargo_contains) then 
	{
		_classname = "Exile_Item_FuelBarrelEmpty";
		_model = "Land_metalbarrel_f";	
		_pos = [0,1,0];	
	}
	else
	{
		if ([player, 'Exile_Item_FuelCanisterEmpty'] call ExileLifeClient_util_playerCargo_contains) then 
		{
			_classname = "Exile_Item_FuelCanisterEmpty";
			_model = "Land_CanisterFuel_f";
			_pos = [0.5,0.6,0];
		}
		else
		{
			throw "You dont have an empty container to fill!";
		};
	};
	_dir = getDir player;
	_tempItemPos = player modelToWorld _pos;
	_tempItem = _model createVehicle _tempItemPos;
	_tempItem setPosATL _tempItemPos;
	_tempItem setDir (_dir - 90);
	['RefuelContainer', [_tempItem,_classname]] call ExileClient_action_execute
}
catch
{
	["ErrorTitleAndText", ["Error!", _exception]] call ExileClient_gui_toaster_addTemplateToast;	
};