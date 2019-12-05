/**
                    * ExilelifeClient_object_chemlab_check_mixing
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_result","_currentUser","_mixingArray","_currentState","_empty"];
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
	{
		_currentState = ExileClientInteractionObject getVariable [_x,[]];
		if !(_currentState isEqualTo []) then 
		{
			_empty = (_currentState select 3) splitString "_";
			if !((_empty find "empty") > 0 ) exitWith 
			{
				throw true;
			};	
		};
	}forEach 
	[
		"item_beaker_acetone",
		"item_beaker_phosphoricacid",
		"item_beaker_hydrochloricacid"
	];
	throw false;
}
catch
{
	_result = _exception;	
};
_result