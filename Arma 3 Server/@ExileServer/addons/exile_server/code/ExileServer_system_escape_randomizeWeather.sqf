/**
                    * ExileServer_system_escape_randomizeWeather
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

                    private["_centerOfPlay","_altitude"];
"Randomizing weather..." call ExileServer_util_log;
_centerOfPlay = _this;
_altitude = _centerOfPlay select 2;
setDate [2016, 10, 17, random [6, 12, 18], random 59]; 
0 setFog [random 1, random 0.2, random [_altitude - 30, _altitude, _altitude + 30]]; 
0 setOvercast (random 1); 
0 setWindDir (random 360); 
0 setWindForce (random 1); 
0 setWindStr (random 1); 
0 setGusts (random 1); 
0 setWaves (random 1); 
0 setRain (random [0, 0.2, 1]); 
0 setRainbow (random 1); 
0 setLightnings (random 1); 
forceWeatherChange;
