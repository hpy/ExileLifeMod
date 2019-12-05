/**
                    * ExileClientOverwrites_gui_xm8_showTerritorySlide
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

                    private["_hasTerritory","_playerUID","_sleepingBags","_buildRights"];
_hasTerritory = false;
try
{
	_playerUID = getPlayerUID player;
	_sleepingBags = (allMissionObjects "ExileLife_Construction_SleepingBag_Static");
	{
		_buildRights = _x getVariable ["ExileTerritoryBuildRights", []];
		if (_playerUID in _buildRights) then
		{
			throw "";
		};
	}
	forEach _sleepingBags;
}
catch
{
	_hasTerritory = true;
};
if(_hasTerritory)then
{
	['territory', 0] call ExileClient_gui_xm8_slide;
}
else
{
	['Join or make a territory first.','Fine!'] call ExileClient_gui_xm8_showWarning;
};
