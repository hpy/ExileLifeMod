/**
                    * ExilelifeServer_system_blackmarket_database_restock
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

                    private["_static","_stock"];
_static = (missionConfigFile >> "CfgExileLifeBlackMarket" >> "Inventory") call BIS_fnc_getCfgSubClasses;
{
    _stock = getNumber (missionConfigFile >> "CfgExileLifeBlackMarket" >> "Inventory" >> _x >> "quantity");
    if (format["checkItem:%1",_x] call ExileServer_system_database_query_selectSingleField) then
    {
    	format["addStock:%1:%2",_stock,_x] call ExileServer_system_database_query_fireAndForget;
    }
	else
	{
		format["createItem:%1:%2",_x,_stock] call ExileServer_system_database_query_fireAndForget;
	};
}
forEach _static;
"Blackmarket restocked" call ExileLifeServer_util_log;
true
