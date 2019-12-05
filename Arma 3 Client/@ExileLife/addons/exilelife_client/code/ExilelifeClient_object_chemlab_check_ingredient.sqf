/**
                    * ExilelifeClient_object_chemlab_check_ingredient
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_result","_currentUser","_mixingArray","_empty"];
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
}
catch
{
	_result = _exception;	
};
_result