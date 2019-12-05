/**
                    * ExilelifeClient_util_world_drop
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

                    private["_object","_itemClassname","_posATL","_pos","_lootHolder","_nearestHolder","_magazines"];
_object = _this select 0;
_itemClassname = _this select 1;
_posATL = getPosATL _object;
_pos = _object modelToWorld [0,0,0];
_pos set [2,_posATL select 2];
_lootHolder = objNull;
_nearestHolder = nearestObjects [_object, ["GroundWeaponHolder","WeaponHolderSimulated","LootWeaponHolder"], 3];
if !(_nearestHolder isEqualTo []) then
{
    _lootHolder = _nearestHolder select 0;
};
if (isNull _lootHolder) then
{
    _lootHolder = createVehicle ["GroundWeaponHolder",_pos,[],3,"CAN_COLLIDE"];
    _lootHolder setPosATL _pos;
    _lootHolder setVariable["BIS_enableRandomization",false];
};
if (getText (configfile >> "CfgVehicles" >> _itemClassname >> "vehicleClass") == "BackPacks") then
{
    _lootHolder addBackpackCargoGlobal [_itemClassname,1];
}
else
{
    _lootHolder addItemCargoGlobal [_itemClassname,1];
    if (isClass (configFile >> "CfgWeapons" >> _itemClassname)) then
    {
        _magazines = getArray (configFile >> "CfgWeapons" >> _itemClassname >> "magazines");
        if !(_magazines isEqualTo []) then
        {
            {
                _lootHolder addItemCargoGlobal [_x,3];
            }
            forEach _magazines;
        };
    };
};
