/**
                    * ExilelifeClient_util_world_isEnemyGangZone
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

                    private["_position","_isInRange","_gangname","_distfromgangterritory","_size","_sizex"];
_position = _this;
_isInRange = false;
try 
{
	{
		if !(_x isEqualTo ExileLifeClientGang) then
		{
			_gangname = format ["%1_TERRITORY",_x];
			_distfromgangterritory = _position distance2D getMarkerPos _gangname;
			_size = getMarkerSize _gangname;
			_sizex = _size select 0;
			if (_distfromgangterritory < _sizex) then 
			{
				ExileLifeGangTerritory = _x;
				throw true;
			};
		};
	} forEach ["Mafia","Yakuza","Syndicate","Cartel"];
}
catch 
{
	_isInRange = _exception;
};
_isInRange
