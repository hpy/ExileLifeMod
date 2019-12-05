/**
                    * ExilelifeClient_util_time_dbTimetoString
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

                    private["_year","_month","_day","_hour","_minute","_string"];
params [["_year",0],["_month",0],["_day",0],["_hour",0],["_minute",0]];
_string = format["%1/%2/%3",_day,_month,_year];
_string
