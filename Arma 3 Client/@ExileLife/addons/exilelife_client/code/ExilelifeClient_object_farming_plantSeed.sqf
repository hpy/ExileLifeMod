/**
                    * ExilelifeClient_object_farming_plantSeed
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_garden","_gardenPlot","_completed","_greenThumbs","_temparray","_plotNumber","_fertilizeState","_pestState","_fungicideState","_waterState","_farmingStage","_timeStageStarted","_plantType","_plantObjectID","_index","_gardenplot","_plotPos","_typeofPlant","_magazines","_removed","_override","_amount","_newamount","_height","_plant","_plantName","_time"];
_garden = _this select 0;
_gardenPlot = _this select 1; 
_completed = false;
_greenThumbs = _garden getVariable['ExileLifeFarming',[]]; 
if (count _greenThumbs < 1) exitWith
{
	deleteVehicle _garden;
	diag_log "Farming - Plant Seed - Something bad happened! Deleting Garden!";
};
{
	_temparray = _x;
	_plotNumber = _x select 0;
	_fertilizeState = _x select 1;
	_pestState = _x select 2;
	_fungicideState = _x select 3;
	_waterState = _x select 4;
	_farmingStage = _x select 5;
	_timeStageStarted = _x select 6;
	_plantType = _x select 7;
	_plantObjectID = _x select 8;
	_index = _forEachIndex;
	if (_plotNumber isEqualTo (format ["plot_%1",_gardenplot])) then
	{
		try
		{
			if (_fertilizeState < 0.7) then
			{
				throw "This Soil needs fertilizer!";	
			};
			if !(_plantType isEqualTo "") then 
			{
				throw "There is already a plant growing here!";
			};
			if !(_plantObjectID isEqualTo "") then 
			{
				throw "There is already a plant growing here!";
			};
			call ExileLifeClient_gui_farming_seedSelection_onLoad;
			if (ExileLifeSelectedSeed isEqualTo "") then
			{
				throw "Planting Seed Aborted";
			};
			if (isNil "ExileLifeSelectedSeed") then
			{
				throw "Planting Seed Aborted";
			};
			_plotPos = [_garden,_gardenPlot] call ExileLifeClient_util_farming_getPlotPos;
			_typeofPlant = getText(configFile >> "CfgMagazines" >> ExileLifeSelectedSeed >> "plantclassname");
			_magazines = magazinesAmmo player;
			_removed = false;
			_override = false;
			{
				if((_x select 0) isEqualTo ExileLifeSelectedSeed) then
				{
					_amount = (_x select 1);
					if (_amount > 0) then
					{
						if(_amount > 1)then
						{
							_newamount = _amount - 1;
							[
								player,
								[ExileLifeSelectedSeed,_x select 1],
								[ExileLifeSelectedSeed,_newamount]
							] call ExileClient_util_inventory_replaceMagazine;
							_removed = true;
						}
						else
						{
							_removed = [player,ExileLifeSelectedSeed] call ExileClient_util_playerCargo_remove;
						};
					};
				};
				if (_removed) exitWith {};
			}
			forEach _magazines;
			call ExileClient_object_player_save;
			if !(_removed) then 
			{
				throw "Hmmm where did those seeds go?";
			};
			_height = getNumber(configFile >> "CfgMagazines" >> ExileLifeSelectedSeed >> "plantHeightinGardenBed");
			if (_height isEqualTo 0) then 
			{
				_height = 0.19;
			};
			_plant = _typeofPlant createVehicle _plotPos;
			_plant setDir random 360;
			_plotPos = [_plotPos select 0, _plotPos select 1, _plotPos select 2 + _height]; 
			_plant setPosATL _plotPos;
			_plant setVectorUp surfaceNormal _plotPos; 
			_plant setVariable['ExileLifeGardenID',(netID _garden),true]; 
			_plant setVariable['ExileLifePlotNumber',_gardenplot,true]; 
			_plantName = getText(configFile >> "CfgVehicles" >> _typeofPlant >> "displayName");
			["SuccessTitleAndText", ["Farming", [(format ["You planted a %1",_plantName])]]] call ExileClient_gui_toaster_addTemplateToast;
			_time = serverTime + ExileLifeTimeDifference; 
			if (_time > 22000) then
			{
				_time = 1; 
			};
			_temparray = [_plotNumber,_fertilizeState,_pestState,_fungicideState,_waterState,0,_time,_typeofPlant,(netID _plant)];
			_greenThumbs set [_index, _temparray];
			_garden setVariable['ExileLifeFarming',_greenThumbs,true]; 
			_completed = true;
		}
		catch
		{
			["ErrorTitleAndText", ["Farming", format["Farming - Plant Seed: %1",_exception]]] call ExileClient_gui_toaster_addTemplateToast;
			_completed = true;
		};
	};
	if (_completed) exitWith {};
}forEach _greenThumbs;
ExileLifeSelectedSeed = "";
