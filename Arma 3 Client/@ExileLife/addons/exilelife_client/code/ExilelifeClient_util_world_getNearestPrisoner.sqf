/**
                    * ExilelifeClient_util_world_getNearestPrisoner
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

                    private["_position","_range","_player","_prisoner","_prisonerGang"];
_position = _this select 0;
_range = _this select 1;
_player = nil;
{
    _prisoner = _x;
	if (alive _prisoner && {(_prisoner distance2D _position) <= _range}) then
	{
        if(isServer || _prisoner != player)then{
            _prisonerGang = _prisoner getVariable ['ExileLifeClientGang', ""];
            if (_prisonerGang != "Guard") exitWith{
                _player = _prisoner;
            };
        };
	};
}
forEach allPlayers;
_player
