/**
                    * ExilelifeClient_object_farming_removePlant
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_completed","_garden","_greenThumbs","_gardenplot","_plotNumber","_plantType","_plantObjectID","_index","_plant","_leafModel","_plantpos","_pos","_leaves","_temparray"];
_completed = false;
_garden = objectFromNetId (ExileClientInteractionObject getVariable['ExileLifeGardenID',""]);
_greenThumbs = _garden getVariable['ExileLifeFarming',[]]; 
_gardenplot = ExileClientInteractionObject getVariable['ExileLifePlotNumber',-1];
{
	_plotNumber = _x select 0;
	_plantType = _x select 7;
	_plantObjectID = _x select 8;
	_index = _forEachIndex;
	if (_plotNumber isEqualTo (format ["plot_%1",_gardenplot])) then
	{
		_plant = objectFromNetId _plantObjectID;
		_leafModel = getText(configFile >> "CfgVehicles" >>  _plantType >> "leafmodel"); 
		if !(_leafModel isEqualTo "") then 
		{
			_plantpos = getposATL _plant;
			_pos = _plant modelToWorld [0,0.4,0.9];  
			_leaves = createVehicle [_leafModel, _plantpos, [], 0, "CAN_COLLIDE"]; 
			_leaves setDir random 360;		
			_leaves setPosATL _plantpos; 
			_leaves setVariable ["ExileLifeSpawnedAt", time, true]; 
		};
		_temparray = [_plotNumber,0,0,0,0,-1,0,"",""];
		_greenThumbs set [_index, _temparray];
		_garden setVariable['ExileLifeFarming',_greenThumbs,true]; 
		_garden setObjectTextureGlobal [_gardenplot, ""];
		deleteVehicle _plant;
		_completed = true;
	};
	if (_completed) exitWith {};
}forEach _greenThumbs;
