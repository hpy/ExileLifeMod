/**
                    * ExilelifeServer_system_jobs_scenes_prisonCollect_preCondition
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

                    private["_result","_guardVault","_oreQuantity","_vaultLocation","_index","_vaultContents","_class","_quantity"];
_result = false;
_guardVault = missionNamespace getVariable ["ExileLifeGangVault:Guard",[]];
_oreQuantity = 0;
{
    _vaultLocation = _x select 0;
    _index = _forEachIndex;
    if (_vaultLocation == "Prison") exitWith
    {
        _vaultContents = _x select 1;
        {
            _class = _x select 0;
            _quantity = _x select 1;
            if (_class == "exilelife_item_exiumore") then
            {
                _oreQuantity = _oreQuantity + _quantity;
            };
        }forEach _vaultContents;
    };
}forEach _guardVault;
if(_oreQuantity > 500) then {
    _result = true;
};
_result
