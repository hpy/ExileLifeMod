/**
                    * ExilelifeClient_object_farming_harvestPlantRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_completed","_result","_garden","_gardenplot","_greenThumbs","_plotNumber","_fertilizeState","_pestState","_fungicideState","_waterState","_farmingStage","_timeStageStarted","_plantType","_plantObjectID","_plantIndex"];
_completed = false;
_result = -1;
try
{ 
	if (ExileClientIsWaitingForServerTradeResponse) then
	{
		throw false;
	};	
	if (isNull player) then
	{
		throw false;
	};
	if !(alive player) then
	{
		throw false;
	};	
	if (isNull ExileClientInteractionObject) then
	{
		throw false;
	};	
	_garden = objectFromNetId (ExileClientInteractionObject getVariable['ExileLifeGardenID',""]);	
	if (isNull _garden) then
	{
		throw false;
	};
	_gardenplot = ExileClientInteractionObject getVariable['ExileLifePlotNumber',-1];
	_greenThumbs = _garden getVariable['ExileLifeFarming',[]]; 
	{
		try
		{ 
			_plotNumber = _x select 0;
			_fertilizeState = _x select 1;
			_pestState = _x select 2;
			_fungicideState = _x select 3;
			_waterState = _x select 4;
			_farmingStage = _x select 5;
			_timeStageStarted = _x select 6;
			_plantType = _x select 7;
			_plantObjectID = _x select 8;
			_plantIndex = _forEachIndex;
			if !(_plotNumber isEqualTo (format ["plot_%1",_gardenplot])) then
			{
				throw -1; 
			};
			if !(ExileClientInteractionObject isEqualTo (objectFromNetId (_x select 8))) then 
			{
				throw 2; 
			};
			if !(_farmingStage isEqualTo 4) then 
			{
				throw 2; 
			};
			["harvestPlantRequest", [(netId _garden),(netId ExileClientInteractionObject),_plotNumber,_plantIndex]] call ExileClient_system_network_send;
			ExileClientIsWaitingForServerTradeResponse = true;				
			_result = 1;
		}
		catch
		{
			_result = _exception;
		};
		if (_result > 0) exitWith {};
	} forEach _greenThumbs;
}
catch
{
	_result = _exception;
};
