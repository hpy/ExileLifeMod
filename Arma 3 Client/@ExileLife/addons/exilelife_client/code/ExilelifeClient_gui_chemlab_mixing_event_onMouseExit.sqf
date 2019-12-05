/**
                    * ExilelifeClient_gui_chemlab_mixing_event_onMouseExit
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeChemLabMixing", displayNull];
try
{ 
	if (isNil "ExileLifeClientSelectedBeaker") then 
	{
		throw "1";
	};
	if (isNil "ExileLifeClientSelectedBeakerEmptyState") then 
	{
		throw "2";
	};
	if (isNil "ExileLifeClientSelectedBeakerState") then 
	{
		throw "3";
	};
	if (ExileLifeClientSelectedBeakerEmptyState == ExileLifeClientSelectedBeakerState) then 
	{
		throw "4";
	};
	ExileClientInteractionObject animate [ExileLifeClientSelectedBeakerEmptyState, 1]; 
	ExileClientInteractionObject animate [ExileLifeClientSelectedBeaker, 0];  
	ExileClientInteractionObject animate [ExileLifeClientTempMixingBeaker, 1];  
	ExileClientInteractionObject animate [ExileLifeClientMixingBeakerState, 0]; 
}
catch
{
	_exception call ExileClient_util_log;
};
ExileLifeClientSelectedBeaker = nil;
ExileLifeClientSelectedBeakerEmptyState = nil;
ExileLifeClientSelectedBeakerState = nil;
ExileLifeClientMixingBeakerState = nil;
ExileLifeClientTempMixingBeaker = nil;
