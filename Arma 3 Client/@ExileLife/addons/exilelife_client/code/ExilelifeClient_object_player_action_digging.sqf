/**
                    * ExilelifeClient_object_player_action_digging
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_surfacecheck","_surfacetype","_texturetype","_isDiggingSurface","_TextureSurfaceNames","_badSurfaces","_badsurface","_badsurfaces","_correctsurface","_pos","_cutter","_container","_texturename","_surfacetexture","_result"];
_surfacecheck = false;
try
{
	if !(isTouchingGround (vehicle player)) then
	{
		throw -1;
	};
	if (isOnRoad player) then 
	{
		throw -1;
	};
	_surfacetype = (surfacetype getPosATLVisual (vehicle player));
	if (ExileLifeClientResourceZone) then
	{
		_texturetype = format ["%1_Surface",ExileLifeResourceType];
		_isDiggingSurface = false;
		if !(isClass(missionConfigFile >> "CfgResources" >> "CfgResourceSurfaces" >> _texturetype)) then
		{
			systemchat "This is a bad area to dig!";
			throw -1;
		};
		_TextureSurfaceNames = getArray(missionConfigFile >> "CfgResources" >> "CfgResourceSurfaces" >> _texturetype >> "surface");
		{
			if !(((str _surfacetype) find _x) isEqualTo -1) exitWith {_isDiggingSurface = true};
		}
		forEach _TextureSurfaceNames;
		if !(_isDiggingSurface) then
		{
			systemchat "This soil is all wrong...Maybe I should try digging somewhere different?";
			throw -1;
		};
		if !(((vehicle player) nearObjects  ["ExileLife_Farming_DirtPile",2]) isEqualTo [])	then
		{
			systemchat "This area has already been dug up";
			throw -1;
		};
		if !(((vehicle player) nearObjects  ["ExileLife_Farming_DirtPlot",3]) isEqualTo [])	then
		{
			systemchat "You are too close to a garden bed!";
			throw -1;
		};
	}
	else
	{
		if !(((vehicle player) nearObjects  ["ExileLife_Farming_DirtPile",2]) isEqualTo [])	then
		{
			systemchat "This area has already been dug up";
			throw -1;
		};
		if !(((vehicle player) nearObjects  ["ExileLife_Farming_DirtPlot",3]) isEqualTo [])	then
		{
			systemchat "You are too close to a garden bed!";
			throw -1;
		};
		_badSurfaces = getArray(missionConfigFile >> "CfgResources" >> "CfgResourceSurfaces" >> "badSurfaces");
		{
			_badsurface = [_x,player,3] call ExileLifeClient_util_world_chkSurfaceType;
			if (_badsurface) then 
			{
				systemchat "You cannot dig here!";
				throw -1;
			};
		}forEach _badsurfaces;
		_correctsurface = ["#GdtGrassGreen",player,3] call ExileLifeClient_util_world_chkSurfaceType;
		if (_correctsurface) then
		{
			_surfacetype = "#GdtGrassGreen";
		};
	};
    _pos = player modelToWorld [-0.2,0.95,0]; 
    _cutter = createVehicle ["Land_ClutterCutter_small_F", _pos, [], 0, "CAN_COLLIDE"];  
    _cutter setVariable ["ExileLifeSpawnedAt",time,true]; 
    _container = createVehicle ["ExileLife_Farming_DirtPile", _pos, [], 0, "CAN_COLLIDE"]; 
    _container setdir (getDirVisual player); 
    _container setPosATL [_pos select 0,_pos select 1,0]; 
    _container setVectorUp surfaceNormal _pos; 
    _texturename = (_surfacetype splitString "#") select 0;
	if (isText(missionConfigFile >> "CfgResources" >> "CfgResourceSurfaces" >> "GroundTexture" >> _texturename)) then 
	{
		_surfacetexture = getText(missionConfigFile >> "CfgResources" >> "CfgResourceSurfaces" >> "GroundTexture" >> _texturename);
		_container setObjectTextureGlobal [0, _surfacetexture];
	};
	_container setVariable ["ExileLifeSpawnedAt",time,true]; 
	_container setVariable ['ExileLifeSurfaceType',_surfacetype,true];
	_container setVariable ['ExileLifeSearched',0,true]; 	
}
catch
{
	_result = _exception;
};
