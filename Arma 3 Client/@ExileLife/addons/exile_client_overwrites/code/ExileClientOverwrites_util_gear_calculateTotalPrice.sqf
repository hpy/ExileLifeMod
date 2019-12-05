/**
                    * ExileClientOverwrites_util_gear_calculateTotalPrice
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

                    private["_items","_amount","_traderZone","_tax"];
_items = _this;
_amount = 0;
{
	_amount = _amount + (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price"));
}
forEach _items;
_traderZone = [player] call ExileLifeClient_util_world_findGangTerritory;
if (_traderZone == "none")then 
{
	_traderZone = "Guard";
};
_tax = missionNamespace getVariable [format["ExileLifeGangTax:%1",_traderZone],0];
_amount =  floor(_amount * ((_tax + 100)/100)); 
_amount