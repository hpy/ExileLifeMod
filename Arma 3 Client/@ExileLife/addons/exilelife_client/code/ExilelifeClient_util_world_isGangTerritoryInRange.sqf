/**
                    * ExilelifeClient_util_world_isGangTerritoryInRange
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

                    private["_position","_gang","_isInRange","_gangname","_minDistfromGangTown","_distfromgangterritory","_size","_sizex"];
_position = _this select 0;
_gang = _this select 1;
_isInRange = 0;
try 
{
	if ((_gang isEqualTo "") || (_gang isEqualTo "Rogue")) then
	{
		throw -1;
	};
	_gangname = format ["%1_TERRITORY",_gang];
	_minDistfromGangTown = getNumber (missionConfigFile >> "CfgGangData" >> _gang >> "GangTownBorder");
	_distfromgangterritory = _position distance2D getMarkerPos _gangname;
	_size = getMarkerSize _gangname;
	_sizex = _size select 0;
	if (_distfromgangterritory < _minDistfromGangTown) then 
	{
			throw 1; 
	};		
}
catch 
{
	_isInRange = _exception;
};
_isInRange
