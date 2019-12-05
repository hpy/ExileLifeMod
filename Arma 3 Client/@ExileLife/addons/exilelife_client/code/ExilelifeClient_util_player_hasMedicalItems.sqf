/**
                    * ExilelifeClient_util_player_hasMedicalItems
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

                    private["_player","_returnObjects","_magazines","_hasItems","_items","_config"];
_player = _this select 0;
_returnObjects = param [1, false];
_magazines = magazines _player;
_hasItems = false;
_items = [];
{
	_config = (configFile >> "CfgMagazines" >> _x >> "Interactions" >> "Consuming");
	if (isClass _config) then
	{
		if (getNumber(_config >> "isMedicalItem") isEqualTo 1) then 
		{
			if (_returnObjects) then 
			{
				_items pushBackUnique _x;
			};
			_hasItems = true;
		};
	};
	true
}
count _magazines;
if (_returnObjects) then { _items } else { _hasItems };