/**
                    * ExilelifeClient_util_item_isType
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

                    private["_item","_itemQuality","_config"];
_item = _this select 0;
_itemQuality = _this select 1; 
result = false;
_config = (configFile >> "CfgMagazines" >> _item >> "Interactions" >> "Consuming");
if (isClass _config) then
{
	if (getNumber(_config >> _itemQuality) isEqualTo 1) then 
	{
		result = true;
	};
};
result
