/**
                    * ExilelifeClient_object_farming_setPlant
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_garden","_gardenPlot","_greenThumbs","_temparray","_plotNumber","_fertilizeState","_pestState","_fungicideState","_waterState","_farmingStage","_timeStageStarted","_plantType","_plantObjectID","_index","_plant","_oldstage","_newstage"];
_garden = _this select 0;
_gardenPlot = _this select 1; 
_greenThumbs = _garden getVariable['ExileLifeFarming',[]];  
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
	 if (_plotNumber isEqualTo format ["plot_%1",_gardenPlot]) then  
	 { 
		_plant = objectfromNetID _plantObjectID;
		_oldstage = format ["stage_%1",_farmingStage];
		_newstage = format ["stage_%1",(_farmingStage + 1)];
		_plant animate[(format ["%1",_oldstage]), 1]; 
		_plant animate[(format ["%1",_newstage]), 0]; 
		_temparray set [5, (_farmingStage + 1)];
		_greenThumbs set [_index, _temparray];
		_garden setVariable['ExileLifeFarming',_greenThumbs,true];
	 }; 
} forEach _greenThumbs;
