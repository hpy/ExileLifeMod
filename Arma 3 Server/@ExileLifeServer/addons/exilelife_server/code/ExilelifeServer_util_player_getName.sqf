/**
                    * ExilelifeServer_util_player_getName
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

                    private["_player","_option","_playerName"];
_player = _this select 0;
_option = _this select 1;
_name = "";
_playerName = _player getVariable ["ExileLifeName",["",""]];
switch (toUpper(_option)) do
{
	case "FIRST":
	{
		_name = _playerName select 0;
	};
	case "LAST":
	{
		_name = _playerName select 1;
	};
	case "FULL":
	{
		_name = _playerName joinString " ";
	};
};
_name
