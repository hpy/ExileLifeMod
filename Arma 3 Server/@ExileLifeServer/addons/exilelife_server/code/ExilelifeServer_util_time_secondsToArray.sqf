/**
                    * ExilelifeServer_util_time_secondsToArray
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

                    private["_time","_inclSeconds","_days","_hours","_minutes","_seconds","_timeArray"];
_time = _this select 0;
_inclSeconds = param[1,true];
_days = floor(_time / 60 / 60 / 24);
_hours = floor((_time / 60 / 60) % 24);
_minutes = floor((_time / 60) % 60);
_seconds = floor(_time % 60);
if(_inclSeconds)then{
    _timeArray = [_days,_hours,_minutes,_seconds]
}else{
    _timeArray = [_days,_hours,_minutes]
};
_timeArray
