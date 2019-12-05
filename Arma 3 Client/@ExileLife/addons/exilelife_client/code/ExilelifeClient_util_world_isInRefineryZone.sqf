/**
                    * ExilelifeClient_util_world_isInRefineryZone
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

                    private["_position","_result"];
_position = _this;
_result = false;
{
	if (((_x select 0) distance2D _position) < (_x select 1)) exitWith
	{
		_result = true;
		ExileLifeRefineryType = _x select 2;
	};
}
forEach ExileLifeRefineryZoneMarkerPositionsAndSize;
_result
