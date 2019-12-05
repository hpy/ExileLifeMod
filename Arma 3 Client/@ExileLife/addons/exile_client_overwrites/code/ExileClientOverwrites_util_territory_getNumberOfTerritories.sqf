/**
                    * ExileClientOverwrites_util_territory_getNumberOfTerritories
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

                    private["_playerObject","_myUid","_numberOfTerritories","_territory","_ownerUid"];
_playerObject = player;
_myUid = getPlayerUID _playerObject;
_numberOfTerritories = 0;
{
	_territory = _x;
	{
		_ownerUid = _x getVariable ["ExileOwnerUID", ""];
		if (_ownerUid isEqualTo _myUid) then 
		{
			_numberOfTerritories = _numberOfTerritories + 1;
		};
	}
	forEach allMissionObjects _territory;
}
forEach ["ExileLife_Construction_SleepingBag_Static", "Exile_Construction_Flag_Static"];
_numberOfTerritories
