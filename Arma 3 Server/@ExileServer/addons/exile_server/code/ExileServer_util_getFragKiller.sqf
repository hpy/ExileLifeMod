/**
                    * ExileServer_util_getFragKiller
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

                    private["_killer","_player"];
_killer = _this;
_player = objNull;
if (isPlayer _killer) then 
{
	if ((typeOf _killer) isEqualTo "Exile_Unit_Player" || (typeOf _killer) isEqualTo "ExileLife_Unit_Guard") then 
	{
		_player = _killer;	
	}
	else 
	{
		_uid = getPlayerUID _killer;
		{
			if ((getPlayerUID _x) isEqualTo _uid) exitWith 
			{
				_player = _x;
			};
		}
		forEach allPlayers;
	};
}
else 
{
	if (isUAVConnected _killer) then 
	{
		_player = (UAVControl _killer) select 0; 
	};
};
_player
