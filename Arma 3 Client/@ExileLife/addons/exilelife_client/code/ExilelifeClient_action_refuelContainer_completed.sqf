/**
                    * ExilelifeClient_action_refuelContainer_completed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_tempItem","_containerClassname"];
_tempItem = _this select 0;
_containerClassname = _this select 1;
try
{
	deleteVehicle _tempItem;
	if (isNull player)then
	{
		throw "ARMAgedon";
	};
	if !(alive player)then
	{
		throw "Really? Why the hell are you dead?";
	};
	switch (_containerClassname) do 
	{ 
		case "Exile_Item_FuelBarrelEmpty" : 
		{
			if !([player, 'Exile_Item_FuelBarrelEmpty'] call ExileLifeClient_util_playerCargo_contains) then 
			{
				throw "Your Fuel Barrel went missing?";
			};
			[player, "Exile_Item_FuelBarrelFull"] call ExileLifeClient_util_containerCargo_cantAddThenDrop;
		}; 
		case "Exile_Item_FuelCanisterEmpty" : 
		{
			if !([player, 'Exile_Item_FuelCanisterEmpty'] call ExileLifeClient_util_playerCargo_contains) then 
			{
				throw "Your Fuel Canister went missing?";
			};
			[player, "Exile_Item_FuelCanisterFull"] call ExileLifeClient_util_containerCargo_cantAddThenDrop;						
		}; 
		default { throw "ERROR ERROR ERROR"; }; 
	};
	[player, _containerClassname] call ExileClient_util_playerCargo_remove;
}
catch
{
	["ErrorTitleAndText", ["Failed to fill container!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
if !(isNull _tempItem) then 
{
	deleteVehicle _tempItem;
};
true
