/**
                    * ExileClientOverwrites_util_playerCargo_add
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

                    private["_player","_itemClassName","_bulletCount","_added","_canCarry"];
_player = _this select 0;
_itemClassName = _this select 1;
_bulletCount = [_this, 2, -1] call BIS_fnc_param; 
_added = false;
try
{
    if ([_player, _itemClassName] call ExileClient_util_playerEquipment_canAdd) then
    {
        throw ([_player, _itemClassName, _bulletCount] call ExileClient_util_playerEquipment_add);
    };
    if (_player canAddItemToUniform _itemClassName) then
    {
        throw ([(uniformContainer _player), _itemClassName, _bulletCount] call ExileClient_util_containerCargo_add);
    };
    if (_player canAddItemToVest _itemClassName) then
    {
        throw ([(vestContainer _player), _itemClassName, _bulletCount] call ExileClient_util_containerCargo_add);
    };
    if (_player canAddItemToBackpack _itemClassName) then
    {
        throw ([(backpackContainer _player), _itemClassName, _bulletCount] call ExileClient_util_containerCargo_add);
    };
    _canCarry = _player call ExileLifeClient_util_playerCargo_canCarry;
    if(_canCarry > 0) then
    {
        throw ([(uniformContainer _player), _itemClassName, _bulletCount] call ExileClient_util_containerCargo_add);
    };
}
catch
{
    _added = _exception;
};
if (_added) then
{
    if (isClass(configFile>>"cfgWeapons">>_itemClassName>>"Melee")) then
    {
        if (getNumber (configFile>>"cfgWeapons">>_itemClassName>>"Melee">>"unlimitedAmmo")==1) then
        {
            [_player,"ExileLife_Magazine_Melee"] call ExileLifeClient_util_playerCargo_addOrDrop;
        };
    };
};
_added
