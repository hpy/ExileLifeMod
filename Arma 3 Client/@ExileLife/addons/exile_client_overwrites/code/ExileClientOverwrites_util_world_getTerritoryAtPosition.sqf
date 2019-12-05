/**
                    * ExileClientOverwrites_util_world_getTerritoryAtPosition
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

                    private["_position","_flag","_maximumTerritoryRadius","_territoryRadius"];
_position = _this;
try
{
	{
		_flag = objNull;
		_maximumTerritoryRadius = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumRadius");
		{
			_territoryRadius = _x getVariable ["ExileTerritorySize", -1];
			if ((_position distance _x) < _territoryRadius) then
			{
				throw _x;
			};
		}
		forEach (_position nearObjects [_x, _maximumTerritoryRadius]); 
	}
	forEach ["ExileLife_Construction_SleepingBag_Static", "Exile_Construction_Flag_Static"];
}
catch
{
	_flag = _exception;
};
_flag