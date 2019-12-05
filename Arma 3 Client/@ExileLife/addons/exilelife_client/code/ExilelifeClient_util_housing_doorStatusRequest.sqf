/**
                    * ExilelifeClient_util_housing_doorStatusRequest
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

                    private["_house","_door","_request","_doorlocked","_doorcheck","_doorBool"];
_house = _this select 0;
_door = _this select 1;
_request = _this select 2;
try
{
	_doorlocked = _house getVariable [format["ExileLifeHasLock_%1",_door],""];
	if (_doorlocked isEqualTo "") then
	{
		throw -1; 
	};
	if (_doorlocked isEqualTo 0) then
	{
		throw 0; 
	};	
	if (_doorlocked isEqualTo 1) then
	{
		throw 1; 
	};		
	throw -1;
}
catch
{
	_doorcheck = _exception;
	if (_doorcheck isEqualTo _request) then
	{
		_doorBool = true;
	}
	else
	{
		_doorBool = false; 
		if (_request isEqualTo -1) then
		{
			if !(_doorcheck isEqualTo 1) then
			{
				_doorBool = true; 
			};
		};
	};
};
 _doorBool
