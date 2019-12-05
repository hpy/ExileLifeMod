/**
                    * ExilelifeClient_object_player_action_fishing
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_catchfish","_fish","_fillet","_addfish","_position","_weaponHolder"];
_catchfish = false;
uisleep 0.8; 
player enableSimulation false; 
uisleep 10; 
player enableSimulation true; 
if (ExileLifeFishingBerley) then 
{
	if ((random 100) < 50) then
	{
		_catchfish = true;
	};
}
else
{
	if ((random 100) < 10) then
	{
		_catchfish = true;
	};
};
if (_catchfish) then
{
	_fish = selectRandom ["ExileLife_Fish_CatShark","ExileLife_Fish_Mackerel","ExileLife_Fish_Mullet","ExileLife_Fish_Ornate","ExileLife_Fish_Salema","ExileLife_Fish_Tuna"];
	_name = getText (configFile >> "CfgVehicles" >> _fish >> "displayName");
	["SuccessTitleAndText", ["Success!", (format ["You caught a %1",_name])]] call ExileClient_gui_toaster_addTemplateToast;
	_fillet = getText (configFile >> "CfgVehicles" >> _fish >> "Exile" >> "gutItem");
	_addfish = [player, _fillet] call ExileClient_util_playerCargo_add;
	if !(_addfish) then
	{
		_position = getpos Player;
		_weaponHolder = createVehicle ["GroundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
		_weaponHolder setPosATL _position;
		_weaponHolder addMagazineCargoGlobal [_fish, 1];
	};
}
else
{
	systemchat "The Fish don't seem to be biting";
};
