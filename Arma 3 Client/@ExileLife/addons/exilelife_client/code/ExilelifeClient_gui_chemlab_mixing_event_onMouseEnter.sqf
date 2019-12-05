/**
                    * ExilelifeClient_gui_chemlab_mixing_event_onMouseEnter
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_currentState","_mixingState","_chemicalName"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeChemLabMixing", displayNull];
ExileLifeClientSelectedBeaker = nil;
try
{ 
	switch (format ["%1",_this]) do 
	{ 
		case (format ["[Control #%1]",35002]) : {  ExileLifeClientSelectedBeaker = "item_beaker_hydrochloricacid";}; 
		case (format ["[Control #%1]",35003]) : {  ExileLifeClientSelectedBeaker = "item_beaker_phosphoricacid"; }; 
		case (format ["[Control #%1]",35004]) : {  ExileLifeClientSelectedBeaker = "item_beaker_acetone"; }; 	
		default {  systemchat  "Error 1";}; 
	};
	if (isNil "ExileLifeClientSelectedBeaker") then 
	{
		throw "Error 2";
	};
	_currentState = ExileClientInteractionObject getVariable [ExileLifeClientSelectedBeaker,[]];
	if (_currentState isEqualTo []) then 
	{
		throw "Error 3";
	};
	ExileLifeClientSelectedBeakerState = _currentState select 3;
	ExileLifeClientSelectedBeakerEmptyState = (format ["%1_empty_dirty",ExileLifeClientSelectedBeaker]);
	if (ExileLifeClientSelectedBeakerEmptyState == ExileLifeClientSelectedBeakerState) then 
	{
		throw "Error 4";
	};
	_mixingState = ExileClientInteractionObject getVariable ["item_beaker_mixing",[]];
	if (_mixingState isEqualTo []) then 
	{
		throw "Error 5";
	};
	ExileLifeClientMixingBeakerState = _mixingState select 3;	
	_chemicalName = (ExileLifeClientSelectedBeaker splitString "_") select 2;
	switch (ExileLifeClientMixingBeakerState) do 
	{ 
		case "item_beaker_mixing_hot" : {  ExileLifeClientTempMixingBeaker = "item_beaker_mixing";}; 
		case "item_beaker_mixing_cold" : {  ExileLifeClientTempMixingBeaker = "item_beaker_mixing"; }; 
		case "item_beaker_mixing_empty_dirty" : {  ExileLifeClientTempMixingBeaker = format ["item_beaker_mixing_%1",_chemicalName];}; 
		case "item_beaker_mixing_empty_clean" : {  ExileLifeClientTempMixingBeaker = format ["item_beaker_mixing_%1",_chemicalName];}; 
		case "item_beaker_mixing_acetone" : {  ExileLifeClientTempMixingBeaker = "item_beaker_mixing";}; 
		case "item_beaker_mixing_hydrochloricacid" : {  ExileLifeClientTempMixingBeaker = "item_beaker_mixing"; }; 
		case "item_beaker_mixing_phosphoricacid" : {  ExileLifeClientTempMixingBeaker = "item_beaker_mixing"; }; 
		case "item_beaker_mixing" : {  ExileLifeClientTempMixingBeaker = "item_beaker_mixing"; }; 
		default {  throw  "Error 6";}; 
	};
	ExileClientInteractionObject animate [ExileLifeClientSelectedBeakerEmptyState, 0]; 
	ExileClientInteractionObject animate [ExileLifeClientSelectedBeaker, 1];  
	ExileClientInteractionObject animate [ExileLifeClientMixingBeakerState, 1]; 
	ExileClientInteractionObject animate [ExileLifeClientTempMixingBeaker, 0];  
}
catch
{
	_exception call ExileClient_util_log;
};
