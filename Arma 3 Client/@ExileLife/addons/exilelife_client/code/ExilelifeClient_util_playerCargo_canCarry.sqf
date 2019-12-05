/**
                    * ExilelifeClient_util_playerCargo_canCarry
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

                    private["_player","_containerClass","_maximumLoad","_currentLoad","_carryBonus","_bonusMaxLoad","_availableLoad"];
_player = _this;
_containerClass = getText(configFile >> "CfgWeapons" >> (uniform _player) >> "ItemInfo" >> "containerClass");
_maximumLoad = getNumber(configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
_currentLoad = (loadUniform _player) * _maximumLoad;
_carryBonus = ["Strength","carryBonusPercent"] call ExileLifeClient_system_attribute_getValue;
_bonusMaxLoad = _maximumLoad * ((_carryBonus/100)+1);
_availableLoad = _bonusMaxLoad - _currentLoad;
if (_availableLoad <= 0) then {
    _availableLoad = 0;
};
_availableLoad
