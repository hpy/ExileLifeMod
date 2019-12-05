/**
                    * ExilelifeClient_object_chemlab_check_use
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_result","_currentUser"];
_result = true;
try
{ 
	if (ExileClientInteractionObject getVariable ["ChemLab",false]) then
	{
		throw false;
	};
	_currentUser = ExileClientInteractionObject getVariable ["ChemLabOwner",""];
	if (_currentUser isEqualTo "") then
	{
		throw true;
	};
	_currentUser = objectFromNetId _currentUser;
	if !(alive _currentUser) then 
	{
		ExileClientInteractionObject setVariable ["ChemLabOwner","",true];
		ExileClientInteractionObject setVariable ["ChemLab",false,true];
		throw true;
	};
	if ((_currentUser distance ExileClientInteractionObject) < 15) then 
	{
		throw false;
	};
}
catch
{
	_result = _exception;	
};
_result