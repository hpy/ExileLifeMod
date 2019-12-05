/**
                    * ExilelifeServer_system_farming_network_harvestPlantRequest
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

                    private["_sessionID","_parameters","_gardenNetID","_plantNetID","_sentPlotNumber","_index","_temparray","_player","_garden","_plant","_greenThumbs","_gardenArray","_plotNumber","_fertilizeState","_pestState","_fungicideState","_waterState","_farmingStage","_timeStageStarted","_plantType","_plantObjectID","_doublecheckindex","_multiHarvest","_itemClassname","_maxHarvest","_minHarvest","_range","_rangeQuantity","_quantity","_i","_add"];
_sessionID = _this select 0;
_parameters = _this select 1;
_gardenNetID = _parameters select 0;
_plantNetID = _parameters select 1;
_sentPlotNumber = _parameters select 2;
_index = _parameters select 3;
_temparray = [];
try
{
    _player = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _player) then
    {
        throw "player doesnt exist!";
    };
    if !(alive _player) then
    {
        throw "player is dead!";
    };
	_garden = objectFromNetId _gardenNetID;
    if (isNull _garden) then
    {
        throw "Garden doesnt Exist!";
    };
	_plant = objectFromNetId _plantNetID;
    if (isNull _plant) then
    {
        throw "Plant doesnt Exist!";
    };
	_greenThumbs = _garden getVariable['ExileLifeFarming',[]]; 
	if (_greenThumbs isEqualTo []) then
	{
		throw "Array is empty.... hmmm";
	};
	_gardenArray = _greenThumbs select _index;
	_plotNumber = _gardenArray select 0;
	_fertilizeState = _gardenArray select 1;
	_pestState = _gardenArray select 2;
	_fungicideState = _gardenArray select 3;
	_waterState = _gardenArray select 4;
	_farmingStage = _gardenArray select 5;
	_timeStageStarted = _gardenArray select 6;
	_plantType = _gardenArray select 7;
	_plantObjectID = _gardenArray select 8;
	_doublecheckindex = _forEachIndex;
	if !(_sentPlotNumber isEqualTo _plotNumber) then
	{
		throw "this should not have happened!";
	};
	if !(_doublecheckindex isEqualTo _index) then
	{
		throw "this should never have happened either!";
	};
	if !(_farmingStage isEqualTo 4) then
	{
		throw "This plant is not ready for harvest!";
	};
	_multiHarvest = getNumber(configFile >> "CfgVehicles" >>  _plantType >> "multiHarvest");
	if (_multiHarvest > 0) then
	{
		_plant animate["stage_4", 1];
		_plant animate["stage_10", 0];
		_farmingStage = 10;
	}
	else
	{
		deleteVehicle _plant;
		_farmingStage = -1;
		_timeStageStarted = 0;
		_plantType = "";
		_plantObjectID = "";
	};
	if (_waterState < 0.3) then
	{
		_waterState = 0;
	}
	else
	{
		_waterState = _waterState - 0.2;
	};
	if (_fertilizeState < 0.3) then
	{
		_fertilizeState = 0;
	}
	else
	{
		_fertilizeState = _fertilizeState - 0.2;
	};
	_temparray = [_plotNumber,_fertilizeState,_pestState,_fungicideState,_waterState,_farmingStage,1,_plantType,_plantObjectID];
	_greenThumbs set [_index, _temparray];
	_garden setVariable['ExileLifeFarming',_greenThumbs,true];
	_itemClassname = getText(configFile >> "CfgVehicles" >>  _plantType >> "harvestItem");
	_maxHarvest = getNumber(configFile >> "CfgVehicles" >>  _plantType >> "minHarvest");
	_minHarvest = getNumber(configFile >> "CfgVehicles" >>  _plantType >> "maxHarvest");
	_range = _maxHarvest - _minHarvest;
	_rangeQuantity = floor(random _range);
	_quantity = _rangeQuantity + _minHarvest;
	for "_i" from 1 to _quantity do
	{
		_add = [_player,_itemClassname] call ExileLifeClient_util_playerCargo_addOrDrop;
	};
	_player call ExileServer_object_player_database_update;
	[_sessionID, "harvestPlantResponse", ["Successful"]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "harvestPlantResponse", [_exception]] call ExileServer_system_network_send_to;
};
