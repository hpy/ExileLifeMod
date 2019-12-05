/**
                    * ExilelifeClient_util_housing_canSquatHere
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

                    private["_object","_result","_building"];
_object = _this;
_result = "";
if (isnull _object) exitWith {_result};
_building = ((lineIntersectsSurfaces [ getPosWorld _object vectorAdd [0, 0, 50], getPosWorld _object vectorAdd [0, 0, -50], _object, objNull, true, 1, "GEOM", "NONE"   ] select 0) select 3);
if (isNil "_building") exitWith {_result};
_building = typeof _building;
if (_building in exilelifehouses) then
{
	_result = _building;
};
_result
