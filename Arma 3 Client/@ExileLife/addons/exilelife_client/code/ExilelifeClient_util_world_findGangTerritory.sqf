/**
                    * ExilelifeClient_util_world_findGangTerritory
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

                    private["_object","_position","_gangTerritory","_gangname","_distfromgangterritory","_size","_sizex"];
_object = _this select 0;
_position = getposATL _object;
_gangTerritory = "none";
try 
{
	{
		_gangname = format ["%1_TERRITORY",_x];
		_distfromgangterritory = _position distance2D getMarkerPos _gangname;
		_size = getMarkerSize _gangname;
		_sizex = _size select 0;
		if (_distfromgangterritory < _sizex) then 
		{
			throw _x;
		};
	} forEach ["Mafia","Yakuza","Syndicate","Cartel","Guard"];
}
catch 
{
	_gangTerritory = _exception;
};
_gangTerritory
