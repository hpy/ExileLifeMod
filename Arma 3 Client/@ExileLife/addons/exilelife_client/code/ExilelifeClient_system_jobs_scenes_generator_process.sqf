/**
                    * ExilelifeClient_system_jobs_scenes_generator_process
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_hasBarrel","_full"];
if !(ExileLifeCurrentJob isEqualTo []) then
{
	if (((ExileLifeCurrentJob select 0) find "generator") > -1) then
	{
		_hasBarrel = false;
		_full = false;
		{
			if((_x select 0) isEqualTo "Exile_Item_FuelBarrelFull")then
			{
				if((_x select 1) isEqualTo 300) exitWith
				{
					_hasBarrel = true;
					_full = true;
				};
			};
			if (_hasBarrel) exitWith {};
		}
		forEach magazinesAmmo player;
		if (_hasBarrel) then
		{
			if (_full) then
			{
				["completeJobRequest",[]] call ExileClient_system_network_send;
			}
			else
			{
				["ErrorTitleOnly",["You don't have enough fuel in your fuel barrel!"]] call ExileClient_gui_toaster_addTemplateToast;
			};
		}
		else
		{
			["ErrorTitleOnly",["You don't have a fuel barrel in your inventory!"]] call ExileClient_gui_toaster_addTemplateToast;
		};
	};
}
else
{
	["InfoTitleOnly",["The generator doesn't need any more fuel"]] call ExileClient_gui_toaster_addTemplateToast;
};
