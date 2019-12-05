/**
                    * ExilelifeClient_util_player_searchPlayerByName
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

                    private["_player","_firstName","_lastName"];
_name = _this;
_player = nil;
if (!(_name isEqualType "") || count _name < 1 || (_name find 'ex' == -1))exitWith{_player};
{
    _firstName =  [_x,"FIRST"] call ExileLifeClient_util_player_name;
    _lastName =  [_x,"LAST"] call ExileLifeClient_util_player_name;
	if (_firstName == _name || _lastName == _name) exitWith
	{
        _player = _x;
	};
}
forEach allPlayers;
_player
