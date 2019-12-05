/**
                    * ExilelifeClient_object_chemlab_check_move
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_result","_currentUser","_mixingArray","_empty","_mixtureState","_Tempstring"];
_result = true;
try
{ 
	if !(ExileClientInteractionObject getVariable ["ChemLab",false]) then
	{
		throw false;
	};
	_currentUser = ExileClientInteractionObject getVariable ["ChemLabOwner",""];
	if (_currentUser isEqualTo "") then
	{
		throw false;
	};
	_currentUser = objectFromNetId _currentUser;
	if (alive _currentUser) then 
	{
		if !(_currentUser isEqualTo player) then 
		{
			throw false;
		};
	};
	_mixingArray = ExileClientInteractionObject getVariable ['item_beaker_mixing',[]];
	if (_mixingArray isEqualto []) then 
	{
		throw false;
	};
	_empty = (_mixingArray select 3) splitString "_";
	if !((_empty find "empty") > 0 ) then 
	{
		throw false;
	};	
	if (ExileLifeChemLabPosition == _this) then
	{
		throw false;
	};
	if !(isNil "ExileLifeClientSelectedBeaker") then 
	{
		throw true;
	};
	ExileLifeClientSelectedBeaker = ExileClientInteractionObject getVariable ['item_beaker_mixing',[]];
	ExileLifeClientSelectedBeakerState = ExileLifeClientSelectedBeaker select 3;
	_mixtureState = ExileLifeClientSelectedBeaker select 2;
	if (_mixtureState > 1) then 
	{
		_Tempstring = "mixing";
	}
	else
	{
		_Tempstring = (ExileLifeClientSelectedBeakerState splitString "_") select 3;
	};
	switch (_this) do 
	{ 
		case "cook" :		
					{  
						ExileLifeClientSelectedTempBeaker = format ["item_cooker_beaker_%1",_Tempstring]; 
					}; 
		case "wash" :		
					{  
						ExileLifeClientSelectedTempBeaker = "item_beaker_wash_1"; 
					}; 
		case "ingredient" :		
					{  
						ExileLifeClientSelectedTempBeaker = format ["item_beaker_ingredient_%1",_Tempstring]; 
					}; 
		case "mixing" :		
					{  
					if (_Tempstring == "mixing") then 
					{
						ExileLifeClientSelectedTempBeaker = "item_beaker_mixing"; 
					}
					else
					{
						ExileLifeClientSelectedTempBeaker = format ["item_beaker_mixing_%1",_Tempstring]; 
					};
					}; 
		case "filter" :		
					{  
						ExileLifeClientSelectedTempBeaker = "item_beaker_filter_from"; 
					}; 
		default {
					ExileLifeClientSelectedBeaker = nil;
					ExileLifeClientSelectedBeakerState = nil;
				 	throw false;
				 }; 
	};
	ExileClientInteractionObject animate [ExileLifeClientSelectedTempBeaker, 1]; 
	ExileClientInteractionObject animate [ExileLifeClientSelectedBeakerState, 1]; 
}
catch
{
	_result = _exception;	
};
_result