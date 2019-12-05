/**
                    * ExileClientOverwrites_action_hotwireVehicle_condition
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

                    private["_vehicle","_result"];
_vehicle = _this;
_result = "";
try
{
	if (ExilePlayerInSafezone) then
	{
		throw "You are in a safe zone!";
	};
	switch (locked _vehicle) do
	{
		case 0:	{ throw "Vehicle is not locked!"; };
		case 1:	{ throw "Vehicle does not have a lock!"; };
	};
	if !("Exile_Item_Knife" in (magazines player)) then
	{
		throw "You need a knife!";
	};
	if ((_vehicle distance player) > 7) then
	{
		throw "You are too far away!";
	};
}
catch
{
	_result = _exception;
};
_result
