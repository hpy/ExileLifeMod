/**
                    * ExileServer_system_weather_initialize
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

                    private["_useRealTime","_useStaticTime","_useSavedTime","_staticTime","_useTimeMultiplier","_nightMultiplier","_dayMultiplier","_changetime"];
call ExileServer_system_weather_thread_weatherSimulation;
_useRealTime = getNumber (configFile >> "CfgExileLifeServerSettings" >> "Time" >> "useRealTime");
_useStaticTime = getNumber (configFile >> "CfgExileLifeServerSettings" >> "Time" >> "useStaticTime");
_useSavedTime = getNumber (configFile >> "CfgExileLifeServerSettings" >> "Time" >> "useSavedTime");
_staticTime = getArray (configFile >> "CfgExileLifeServerSettings" >> "Time" >> "staticTime");
_useTimeMultiplier = getNumber (configFile >> "CfgExileLifeServerSettings" >> "Time" >> "useTimeMultiplier");
_nightMultiplier = getNumber (configFile >> "CfgExileLifeServerSettings" >> "Time" >> "nighttimeMultiplier");
_dayMultiplier = getNumber (configFile >> "CfgExileLifeServerSettings" >> "Time" >> "daytimeMultiplier");
if(_useStaticTime isEqualTo 1)then
{
    setDate _staticTime;
}
else
{
    if(_useRealTime isEqualTo 1)then
    {
        setDate ExileServerStartTime;
    }
    else
    {
        if (_useSavedTime isEqualTo 1) then
        {
            ExileLifeServerStartTime = profileNamespace getVariable ["ExileLifeServerStartTime", []];
            if !(count ExileLifeServerStartTime == 0) then
            {
                setDate ExileLifeServerStartTime;
                format ["Setting StartTime to Saved Date and Time - %1!",ExileLifeServerStartTime] call ExileServer_util_log;
            }
            else
            {
                setDate _staticTime;
                profileNamespace setVariable ["ExileLifeServerTime", _staticTime];
                format ["No Saved Date/Time detected - reverting to default time!",_staticTime] call ExileServer_util_log;
            };
        };
    };
};
forceWeatherChange;
if (sunOrMoon==1) then
{
    ExileLifeServerSunMoonCycle = 1;
    setTimeMultiplier _dayMultiplier;
}
else
{
    ExileLifeServerSunMoonCycle = 0;
    setTimeMultiplier _nightMultiplier;
};
ExileLifeServerSunMoonCycleThread =
[
    60,
    {
        ExileLifeServerStartTime = date;
        profileNamespace setVariable ["ExileLifeServerStartTime", ExileLifeServerStartTime];
        saveProfilenamespace;
        if (sunOrMoon==1 && ExileLifeServerSunMoonCycle != 1) exitWith
        {
            "Setting timeMultiplier to Day Time!" call ExileServer_util_log;
            ExileLifeServerSunMoonCycle = 1;
            setTimeMultiplier (_this select 1);
        };
        if (sunOrMoon==0 && ExileLifeServerSunMoonCycle != 0) exitWith
        {
            "Setting timeMultiplier to Night Time!" call ExileServer_util_log;
            ExileLifeServerSunMoonCycle = 0;
            setTimeMultiplier (_this select 0);
        };
    },
    [_nightMultiplier,_dayMultiplier],
    true,
    "TimeMultiplier"
] call ExileServer_system_thread_addTask;
_changetime = round(getNumber (configFile >> "CfgSettings" >> "Weather" >> "interval") * 60);
[_changetime, ExileServer_system_weather_thread_weatherSimulation, [], true,"Weather"] call ExileServer_system_thread_addTask;
true