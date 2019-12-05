/**
                    * ExileClientOverwrites_util_playerCargo_remove
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

                    private["_player","_itemClassName","_removed"];
_player = _this select 0;
_itemClassName = _this select 1;
_removed = false;
try
{
	{
		if !(isNull _x) then
		{
			if ([_x, _itemClassName] call ExileClient_util_containerCargo_remove) then
			{
				throw true;
			};
		};
	}
	forEach [backpackContainer _player, vestContainer _player, uniformContainer _player];
	throw ([_player, _itemClassName] call ExileClient_util_playerEquipment_remove);
}
catch
{
	_removed = _exception;
};
_removed
