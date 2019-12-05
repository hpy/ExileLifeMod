/**
                    * ExilelifeServer_util_time_addTimeEXTDB
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

                    private["_time1","_time2","_days","_hours","_minutes","_seconds","_return","_t1","_t2"];
_time1 = _this select 0;
_time2 = _this select 1;
_time2 params [["_days",0],["_hours",0],["_minutes",0],["_seconds",0]];
_return = [];
_t1 = 0;
{
	_t1 = _t1 + _x;
}
forEach _time1;
_t2 = 0;
{
	_t2 = _t2 + _x;
}
forEach _time2;
if (_t1 isEqualTo 0 || _t2 isEqualTo 0) then
{
	_return =
	[
		(_time1 select 0),				
		(_time1 select 1),				
		(_time1 select 2) + _days,		
		(_time1 select 3) + _hours,		
		(_time1 select 4) + _minutes,	
		(_time1 select 5) + _seconds	
	];
}
else
{
	_return = (call compile ("extDB3" callExtension format ["9:DATEADD:%1:%2",_time1,[_days,_hours,_minutes,_seconds]])) select 1;
};
_return
