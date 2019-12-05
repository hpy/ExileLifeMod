/**
                    * ExilelifeClient_gui_chemlab_mixing_event_onMouseClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_currentState","_mixingArray","_control1","_control2","_itemClassname","_cleanChk","_newMixtureState","_newMixingArray","_chemical","_recipeAdd","_currentProgress"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeChemLabMixing", displayNull];
try
{ 
	if (isNil "ExileLifeClientSelectedBeaker") then 
	{
		throw "Error 1";
	};
	if (isNil "ExileLifeClientSelectedBeakerEmptyState") then 
	{
		throw "Error 2";
	};
	_currentState = ExileClientInteractionObject getVariable [ExileLifeClientSelectedBeaker,[]];
	if (_currentState isEqualTo []) then 
	{
		throw "Error 3";
	};
	if (ExileLifeClientSelectedBeakerEmptyState == ExileLifeClientSelectedBeakerState) then 
	{
		throw "Error 4";
	};
	if (isNil "ExileLifeClientTempMixingBeaker") then 
	{
		throw "Error 5";
	};
	_mixingArray = ExileClientInteractionObject getVariable ["item_beaker_mixing",[]];
	if ((_mixingArray select 3) == "item_beaker_mixing_empty_clean") then 
	{
		[ExileClientInteractionObject,"ExileLife_item_beaker_clean"] call ExileClient_util_containerCargo_remove;
	}
	else
	{
		if ((_mixingArray select 3) == "item_beaker_mixing_empty_dirty") then 
		{
			[ExileClientInteractionObject,"ExileLife_item_beaker_dirty"] call ExileClient_util_containerCargo_remove;
		};
	};
	{
		if ((_currentState select 3) == (_x select 1)) exitWith 
		{
				_control1 = _display displayCtrl (_x select 0);	
				_control1 ctrlremoveAllEventHandlers "MouseEnter";
				_control1 ctrlremoveAllEventHandlers "MouseExit";
				_control1 ctrlremoveAllEventHandlers "MouseButtonClick";				
				_control1 ctrlshow false;
				_control1 ctrlEnable false;
				_control2 = _display displayCtrl (_x select 2);	
				_control2 ctrlshow false;
				_control2 ctrlEnable false;					
		};
	} forEach ExileLifeChemicalArray;
	_itemClassname = format ["ExileLife_%1",(_currentState select 3)];
	_cleanChk = _currentState select 1;
	if !(_cleanChk) then 
	{
		_itemClassname = format ["%1_dirty",_itemClassname];
	}
	else
	{
		_itemClassname = format ["%1_clean",_itemClassname];
	};
	[ExileClientInteractionObject,_itemClassname] call ExileClient_util_containerCargo_remove;
	[ExileClientInteractionObject,"ExileLife_item_beaker_dirty"] call ExileClient_util_containerCargo_add;
	if (_cleanChk) then 
	{
		_cleanChk = _mixingArray select 1;
	};
	ExileClientInteractionObject setVariable [ExileLifeClientSelectedBeaker,[true,false,1,ExileLifeClientSelectedBeakerEmptyState],true];
	_newMixtureState = (_mixingArray select 2) + 1;
	_newMixingArray = [true,_cleanChk,_newMixtureState + 1,ExileLifeClientTempMixingBeaker];
	ExileClientInteractionObject setVariable ["item_beaker_mixing",_newMixingArray,true];
	_chemical = (ExileLifeClientSelectedBeaker splitString "_") select 2;
	_recipeAdd = ["mixing",_chemical];
	_currentProgress = ExileClientInteractionObject getVariable ["ExileLifeChemLab",[]];
	if (_currentProgress isEqualTo []) then 
	{
		ExileClientInteractionObject setVariable ["ExileLifeChemLab",[_recipeAdd],true];
	}
	else
	{
		_currentProgress = _currentProgress pushBack _recipeAdd;
	};
	ExileClientInteractionObject animate [ExileLifeClientSelectedBeakerEmptyState, 0]; 
	ExileClientInteractionObject animate [ExileLifeClientSelectedBeaker, 1];  
	ExileClientInteractionObject animate [ExileLifeClientMixingBeakerState, 1]; 
	ExileClientInteractionObject animate [ExileLifeClientTempMixingBeaker, 0];  
	ExileLifeClientSelectedBeaker = nil;
	ExileLifeClientSelectedBeakerEmptyState = nil;
	ExileLifeClientSelectedBeakerState = nil;
	ExileLifeClientMixingBeakerState = nil;
	ExileLifeClientTempMixingBeaker = nil;
}
catch
{
	_exception call ExileClient_util_log;
};
