/**
                    * ExilelifeClient_util_farming_getState
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

                    private["_garden","_gardenplot","_desiredstate","_isplant","_completed","_result","_plant","_greenThumbs"];
_garden = _this select 0;
_gardenplot = _this select 1;
_desiredstate = _this select 2; 
_isplant = _this select 3; 
_completed = false;
if ((_desiredstate isEqualTo 0) || (_desiredstate > 6)) then 
{
	_result = "";
}
else
{
	_result = -1;
};
if !(isNil "_isplant") then 
{
	_plant = _garden; 
	_garden = objectFromNetId (_plant getVariable['ExileLifeGardenID',""]); 
};
_greenThumbs = _garden getVariable['ExileLifeFarming',[]]; 
if (count _greenThumbs < 1) then
{
	_greenThumbs = [["plot_0",0,0,0,0,-1,0,"",""],["plot_1",0,0,0,0,-1,0,"",""],["plot_2",0,0,0,0,-1,0,"",""],["plot_3",0,0,0,0,-1,0,"",""],["plot_4",0,0,0,0,-1,0,"",""],["plot_5",0,0,0,0,-1,0,"",""]];
};
{
	if ((_x select 0) isEqualTo (format ["plot_%1",_gardenplot])) then
	{
		_result = _x select _desiredstate;
		_completed = true;
	};
	if (_completed) exitWith {};
}forEach _greenThumbs;
_result