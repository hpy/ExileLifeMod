/**
                    * ExileClientOverwrites_construction_handleAbort
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

                    private["_simulatePhysics"];
_simulatePhysics = _this;
switch (ExileClientConstructionResult) do
{
	case 1: 
	{
		if( ExileClientConstructionProcess isEqualTo 1) then
		{
			[player, ExileClientConstructionKitClassName] call ExileClient_util_playerCargo_remove;
		};
		[ExileClientConstructionObject, getText (ExileClientConstructionConfig >> "staticObject"), _simulatePhysics] spawn ExileClient_construction_simulationCountDown;
		if (getText (ExileClientConstructionConfig >> "staticObject") isKindOf "Exile_Container_Abstract_Safe") then 
		{
			["SuccessTitleAndText", ["Placed safe!", "The PIN has been set to 0000."]] call ExileClient_gui_toaster_addTemplateToast;
		}
		else
		{
			["SuccessTitleAndText", ["Placed object!", format ["You have successfully placed a %1.", ExileClientConstructionObjectDisplayName]]] call ExileClient_gui_toaster_addTemplateToast;
		};
	};
	case 3:
	{
		if (ExileClientConstructionProcess isEqualTo 2) then
		{
			[ExileClientConstructionObject, getText (ExileClientConstructionConfig >> "staticObject"), true] spawn ExileClient_construction_simulationCountDown;
		}
		else 
		{
			deleteVehicle ExileClientConstructionObject;
		};
		["ErrorTitleAndText", ["Construction aborted!", "Do not move more than 10 meters."]] call ExileClient_gui_toaster_addTemplateToast;
	};
	case 2:
	{
		if (ExileClientConstructionProcess isEqualTo 2) then
		{
			[ExileClientConstructionObject, getText(ExileClientConstructionConfig >> "staticObject"), _simulatePhysics] spawn ExileClient_construction_simulationCountDown;
		}
		else 
		{
			deleteVehicle ExileClientConstructionObject;
		};
		if (ExileClientPlayerIsInCombat) then
		{
			["ErrorTitleAndText", ["Construction aborted!", "You cannot build during a combat."]] call ExileClient_gui_toaster_addTemplateToast;
		}
		else
		{
			["ErrorTitleOnly", ["Construction aborted!"]] call ExileClient_gui_toaster_addTemplateToast;
		};		
	};
};
ExileClientConstructionObject = objNull;
ExileClientIsInConstructionMode = false;
ExileClientConstructionResult = 0;
ExileClientConstructionProcess = 0;
ExileClientConstructionLock = false;
true
