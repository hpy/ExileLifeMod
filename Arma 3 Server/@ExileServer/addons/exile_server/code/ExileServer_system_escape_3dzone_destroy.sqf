/**
                    * ExileServer_system_escape_3dzone_destroy
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

                    private["_color","_key","_simpleObjects"];
_color = _this;
_key = format ["ExileEscapeServer3dZoneObjects%1", _color];
_simpleObjects = missionNamespace getVariable [_key, []];
{
	deleteVehicle _x;
}
forEach _simpleObjects;
missionNamespace setVariable [_key, []];