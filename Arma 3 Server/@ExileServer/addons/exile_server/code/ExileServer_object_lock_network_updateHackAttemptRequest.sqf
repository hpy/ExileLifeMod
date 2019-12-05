/**
                    * ExileServer_object_lock_network_updateHackAttemptRequest
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

                    private["_sessionID","_parameters","_safe","_hackAttempts","_laptop","_marker"];
_sessionID = _this select 0;
_parameters = _this select 1;
_safe = objectFromNetId (_parameters select 0);
_hackAttempts = (_safe getVariable ["ExileHackAttempts", 0]) + 1;
_safe setVariable ["ExileHackAttempts", _hackAttempts, true];
_safe setVariable ["ExileHackerUID", "", true];
_laptop = _safe getVariable ["ExileHackerLaptop", objNull];
if !(isNull _laptop) then 
{
	deleteVehicle _laptop;
};
_marker = _safe getVariable ["ExileHackingMarker", nil];
if !(isNil "_marker") then 
{
	deleteMarker _marker;
};