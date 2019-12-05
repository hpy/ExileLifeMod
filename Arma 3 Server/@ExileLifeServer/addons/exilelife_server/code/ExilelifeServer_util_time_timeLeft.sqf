/**
                    * ExilelifeServer_util_time_timeLeft
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

                    private["_endTime","_currentTime","_endYear","_endMonth","_endDay","_endHours","_endMinute","_endSeconds","_currentYear","_currentMonth","_currentDay","_currentHours","_currentMinute","_currentSeconds","_yearDiff","_monthDiff","_dayDiff","_hourDiff","_minuteDiff","_secondDiff","_minutes","_seconds"];
_endTime = _this select 0;
_currentTime = _this select 1;
if (count(_endTime) != 6) exitWith
{
	format["TimeLeft - Invalid _endTime parameters. Date fields need to be in extDB format [year,month,day,hour,minute,second]! - %1",_endTime] call ExileLifeServer_util_log;
};
if (count(_currentTime) != 6) exitWith
{
    format["TimeLeft - Invalid _currentTime parameters. Date fields need to be in extDB format [year,month,day,hour,minute,second]! - %1",_currentTime] call ExileLifeServer_util_log;
};
_endTime params ["_endYear","_endMonth","_endDay","_endHours","_endMinute","_endSeconds"];
_currentTime params ["_currentYear","_currentMonth","_currentDay","_currentHours","_currentMinute","_currentSeconds"];
_yearDiff = _endYear - _currentYear;
_monthDiff = _endMonth - _currentMonth;
_dayDiff = _endDay - _currentDay;
_hourDiff = _endHours - _currentHours;
_minuteDiff = _endMinute - _currentMinute;
_secondDiff = _endSeconds - _currentSeconds;
_yearDiff = _yearDiff * 525600;
_monthDiff = _monthDiff * 43829;
_dayDiff = _dayDiff * 1440;
_hourDiff = _hourDiff * 60;
_minutes = _yearDiff + _monthDiff + _dayDiff + _hourDiff + _minuteDiff;
_seconds = (_minutes * 60) + _secondDiff;
_seconds = _seconds + parseNumber("extDB3" callExtension "9:UPTIME:SECONDS");
_seconds
