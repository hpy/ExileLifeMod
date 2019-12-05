/**
                    * ExileClientOverwrites_object_item_construct
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

                    private["_itemClassName","_maximumNumberOfTerritoriesPerPlayer","_numberOfTerritories","_isInRange"];
_itemClassName = _this select 0;
if !(_itemClassName in (magazines player)) exitWith {false};
if( isClass(configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Constructing") ) then
{
	if (findDisplay 602 != displayNull) then
	{
		(findDisplay 602) closeDisplay 2;
	};
	try
	{
		if !((vehicle player) isEqualTo player) then
		{
			throw "You cannot build while in a vehicle.";
		};
		if(_itemClassName isEqualTo "ExileLife_Item_SleepingBag") then
		{
			_maximumNumberOfTerritoriesPerPlayer = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumNumberOfTerritoriesPerPlayer");
			_numberOfTerritories = player call ExileClient_util_territory_getNumberOfTerritories;
			if (_numberOfTerritories >= _maximumNumberOfTerritoriesPerPlayer) then
			{
				throw "You have reached the maximum number of territories you can own.";
			};
			_isInRange = [(getpos player), "Guard"] call ExileLifeClient_util_world_isGangTerritoryInRange;
			if !(_isInRange isEqualTo 1) then
			{
				_isInRange = [(getpos player), ExileLifeClientGang] call ExileLifeClient_util_world_isGangTerritoryInRange;
				if !(_isInRange isEqualTo 1) then
				{
					throw "Its not safe to settle out here!";
				};
			};
			if !(typeof (nearestBuilding player) in ExileLifeHouses) then
			{
				throw "You cannot settle here!";
			};
			call ExileLifeClient_gui_claimHouseDialog_show;
		}
		else
		{
			if !(isNumber(configFile >> "CfgMagazines" >> _itemClassName >> "constructmeanywhere")) then   
			{
				_isInRange = [(getpos player), "Guard"] call ExileLifeClient_util_world_isGangTerritoryInRange;
				if !(_isInRange isEqualTo 1) then
				{
					_isInRange = [(getpos player), ExileLifeClientGang] call ExileLifeClient_util_world_isGangTerritoryInRange;
					if !(_isInRange isEqualTo 1) then
					{
						throw "Its not safe to build out here!";
					};
				};
			};
			if (player call ExileClient_util_world_isInNonConstructionZone) then
			{
				throw "Building is disallowed here on this server.";
			};
			if (player call ExileClient_util_world_isInConcreteMixerZone) then
			{
				throw "You are too close to a concrete mixer zone.";
			};
			if(_itemClassName isEqualTo "Exile_Item_Flag") then
			{
				throw "You cannot place flags!";
			}
			else
			{
				[_itemClassName] call ExileClient_construction_beginNewObject;
			};
		};
	}
	catch
	{
		["ErrorTitleAndText", ["Construction aborted!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
	};
};
true
