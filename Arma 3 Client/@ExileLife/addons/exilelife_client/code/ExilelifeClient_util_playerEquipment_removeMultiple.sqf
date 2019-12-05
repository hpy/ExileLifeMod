/**
                    * ExilelifeClient_util_playerEquipment_removeMultiple
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

                    private["_player","_itemClassName","_quantity","_lowerCaseItemClassName","_removed","_i","_assignedItems","_primaryWeaponItems","_primaryWeaponMagazines","_secondaryWeaponItems","_secondaryWeaponMagazines","_handgunItems","_handgunMagazines"];
_player = _this select 0;
_itemClassName = _this select 1;
_quantity = _this select 2;
_lowerCaseItemClassName = toLower _itemClassName;
_removed = false;
for "_i" from 0 to _quantity do 
{
    try 
    {
        switch (_lowerCaseItemClassName) do
        {
            case (toLower (uniform _player)):           { removeUniform _player; throw true; }; 
            case (toLower (vest _player)):              { removeVest _player; throw true; }; 
            case (toLower (backpack _player)):          { removeBackpackGlobal _player; throw true; }; 
            case (toLower (goggles _player)):           { removeGoggles _player; throw true; }; 
            case (toLower (headgear _player)):          { removeHeadgear _player; throw true; }; 
            case (toLower (binocular _player)):         { _player removeWeaponGlobal _itemClassName; throw true; }; 
            case (toLower (primaryWeapon _player)):     { _player removeWeaponGlobal _itemClassName; throw true; }; 
            case (toLower (secondaryWeapon _player)):   { _player removeWeaponGlobal _itemClassName; throw true; }; 
            case (toLower (handgunWeapon _player)):     { _player removeWeaponGlobal _itemClassName; throw true; }; 
        };
        _assignedItems = (assignedItems _player) call ExileClient_util_array_toLower;
        if (_lowerCaseItemClassName in _assignedItems) then
        {
            _player unlinkItem _itemClassName; 
            throw true;
        };
        _primaryWeaponItems = (primaryWeaponItems _player) call ExileClient_util_array_toLower;
        if (_lowerCaseItemClassName in _primaryWeaponItems) then
        {
            _player removePrimaryWeaponItem _itemClassName; 
            throw true;
        };
        _primaryWeaponMagazines = (primaryWeaponMagazine _player) call ExileClient_util_array_toLower;
        if (_lowerCaseItemClassName in _primaryWeaponMagazines) then
        {
            _player removePrimaryWeaponItem _itemClassName; 
            throw true;
        };
        _secondaryWeaponItems = (secondaryWeaponItems _player) call ExileClient_util_array_toLower;
        if (_lowerCaseItemClassName in _secondaryWeaponItems) then
        {
            _player removeSecondaryWeaponItem _itemClassName; 
            throw true;
        };
        _secondaryWeaponMagazines = (secondaryWeaponMagazine _player) call ExileClient_util_array_toLower;
        if (_lowerCaseItemClassName in _secondaryWeaponMagazines) then
        {
            _player removeSecondaryWeaponItem _itemClassName; 
            throw true;
        };
        _handgunItems = (handgunItems _player) call ExileClient_util_array_toLower;
        if (_lowerCaseItemClassName in _handgunItems) then
        {
            _player removeHandgunItem _itemClassName; 
            throw true;
        };
        _handgunMagazines = (handgunMagazine _player) call ExileClient_util_array_toLower;
        if (_lowerCaseItemClassName in _handgunMagazines) then
        {
            _player removeHandgunItem _itemClassName; 
            throw true;
        };
    }
    catch 
    {
        _removed = _exception;
    };
};
_removed