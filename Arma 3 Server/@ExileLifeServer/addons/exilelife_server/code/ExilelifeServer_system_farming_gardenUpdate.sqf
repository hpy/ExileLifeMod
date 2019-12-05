/**
                    * ExilelifeServer_system_farming_gardenUpdate
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

                    private["_gardenID","_index","_garden","_greenThumbs","_plotNumber","_fertilizeState","_pestState","_fungicideState","_waterState","_farmingStage","_timeStageStarted","_plantType","_plantObjectID","_plantIndex","_plant","_temparray","_plantGrowthHormone","_oldstage","_newstage","_result"];
_gardenID = _this select 0;
_index = _this select 1;
_garden = objectFromNetId _gardenID;
try
{ 
    if (isNull _garden) then
    {
   		ExileLifeFarmingArray deleteAt _index; 
        throw "Garden does not Exist!"; 
    };
	if !(ExileLifeServerSunMoonCycle isEqualTo 1) then 
	{    
        throw "Its Nighttime! Plants dont grow at night!"; 
	};
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
			if (_plantObjectID isEqualTo "") then 
			{
				throw "Skipping Plant";
			};
			_plant = objectFromNetId _plantObjectID;
			if (isNull _plant) then 
			{
				_temparray = [_plotNumber,_fertilizeState,0,0,0,-1,0,"",""];
				_greenThumbs set [_plantIndex, _temparray];
				_garden setVariable['ExileLifeFarming',_greenThumbs,true]; 
				throw "Plant Doesnt Exist";
			};
			if !(_timeStageStarted isEqualTo 1) then 
			{
				_plantGrowthHormone = getNumber(configFile >> "CfgVehicles" >>  _plantType >> "growingtime");
				if !((_timeStageStarted + _plantGrowthHormone) <= ExileSystemMainTimer) then
				{
					throw "Not Time to grow yet!"; 
				};
			};
			_timeStageStarted = ExileSystemMainTimer;
			if (_waterState < 0.3) then 
			{
				if !(rain > 0.2) then
				{
					throw "Needs Water";
				};
				_waterState = 1;
			};
			_farmingStage = _x select 5;
			if (_farmingStage isEqualTo 4) then 
			{
				throw "Plant Already Mature";
			};
			_oldstage = format ["stage_%1",_farmingStage]; 
			if (_farmingStage > 4) then 
			{
				_newstage = "stage_4"; 
				_farmingStage = 4;
			}
			else
			{
				_newstage = format ["stage_%1",(_farmingStage + 1)]; 
				_farmingStage = (_farmingStage + 1);
			};
			_plant animate[(format ["%1",_oldstage]), 1];  
			_plant animate[(format ["%1",_newstage]), 0];  
			if (_waterState > 0.3) then 
			{
				_waterState = _waterState - 0.2;
			};
			if (_fertilizeState > 0.3) then 
			{
				_fertilizeState = _fertilizeState - 0.2;
			};
			_temparray = [_plotNumber,_fertilizeState,_pestState,_fungicideState,_waterState,_farmingStage,_timeStageStarted,_plantType,_plantObjectID];
		   _greenThumbs set [_plantIndex, _temparray]; 
		   _garden setVariable['ExileLifeFarming',_greenThumbs,true]; 
		}
		catch
		{
		    _result = _exception; 
		};
	}forEach _greenThumbs;
}
catch
{
    _result = _exception; 
};