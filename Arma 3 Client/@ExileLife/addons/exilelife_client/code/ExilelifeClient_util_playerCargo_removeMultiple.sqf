/**
                    * ExilelifeClient_util_playerCargo_removeMultiple
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

                    private["_player","_itemClassName","_quantity","_removed"];
_player = _this select 0;
_itemClassName = param[1,""];
_quantity = _this select 2;
_removed = false;
if(_itemClassName isEqualTo "")exitWith{_removed};
try
{
    {
        if !(isNull _x) then
        {
            if ([_x, _itemClassName,_quantity] call ExilelifeClient_util_containerCargo_removeMultiple) then
            {
                throw true;
            };
        };
    }
    forEach [backpackContainer _player, vestContainer _player, uniformContainer _player];
    throw ([_player, _itemClassName, _quantity] call ExileLifeClient_util_playerEquipment_removeMultiple);
}
catch
{
    _removed = _exception;
};
_removed