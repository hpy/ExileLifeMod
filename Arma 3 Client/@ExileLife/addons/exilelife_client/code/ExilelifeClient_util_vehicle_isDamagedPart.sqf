/**
                    * ExilelifeClient_util_vehicle_isDamagedPart
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

                    private["_vehicle","_partsType","_damageLevel","_partsToCheck","_result"];
_vehicle = _this select 0;
_partsType = _this select 1;
_damageLevel = _this select 2;
_partsToCheck = [];
_result = false;
try
{ 
	switch (_partsType) do
	{
		case "wheel": 
		{
			_partsToCheck = ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitLBWheel","HitLMWheel","HitRBWheel","HitRMWheel"];
		};
		case "fuel":
		{
			_partsToCheck = ["HitFuelTank","HitFuel"];
		};
		case "glass":
		{
			_partsToCheck = ["HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitRGlass","HitLGlass","HitGlass5","HitGlass6","HitGlass7","HitGlass8"];
		};
		case "body":
		{
			_partsToCheck = ["HitBody"];
		};	
		case "engine":
		{
			_partsToCheck = ["HitEngine"];
		};	
		default {};
	};
	if (_partsToCheck isEqualTo []) then 
	{
		throw false;
	};
	{
		if ((_vehicle getHitPointDamage _x) >= _damageLevel) then
		{
			throw true;
		};
	}
	forEach _partsToCheck;
}
catch
{
	_result = _exception;
};
_result
