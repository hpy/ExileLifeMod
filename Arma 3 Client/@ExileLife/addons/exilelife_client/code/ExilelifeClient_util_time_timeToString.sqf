/**
                    * ExilelifeClient_util_time_timeToString
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

                    private["_year","_month","_day","_hour","_minute","_timeString"];
params [["_year",0],["_month",0],["_day",0],["_hour",0],["_minute",0]];
_timeString = "";
if(_year > 0)then{
	_timeString = format["%1 Years",_year];
};
if(_month > 0)then{
	if !(_timeString isEqualTo "")then{
		_timeString = _timeString + ",";
	};
	_timeString = format["%1 %2 Months",_timeString,_month];
};
if(_day > 0)then{
	if !(_timeString isEqualTo "")then{
		_timeString = _timeString + ",";
	};
	_timeString = format["%1 %2 Days",_timeString,_day];
};
if(_hour > 0)then{
	if !(_timeString isEqualTo "")then{
		_timeString = _timeString + ",";
	};
	_timeString = format["%1 %2 Hours",_timeString,_hour];
};
if(_minute > 0)then{
	if !(_timeString isEqualTo "")then{
		_timeString = _timeString + ",";
	};
	_timeString = format["%1 %2 Minutes",_timeString,_minute];
};
_timeString
