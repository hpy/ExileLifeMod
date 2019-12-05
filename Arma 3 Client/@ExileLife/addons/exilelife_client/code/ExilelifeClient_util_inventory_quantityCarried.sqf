/**
                    * ExilelifeClient_util_inventory_quantityCarried
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

                    private["_container","_classname","_magazines","_total"];
_container = _this select 0;
_classname = _this select 1;
_magazines = magazinesammo player;
_total = 0;
{
	if ((_x select 0) == _classname) then 
	{
		_total = _total + (_x select 1);
	};
}forEach _magazines;
_total