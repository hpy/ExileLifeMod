/**
                    * ExileClientOverwrites_construction_thread
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

                    private["_boundingBox","_boundingBoxMinimum","_boundingBoxMaximum","_boundingBoxPointsTop","_boundingBoxPointsBottom","_objectColor","_materialColor","_simulatePhysics","_position","_rotation","_vectorDirection","_isSleepingBag","_isFlag","_vectorUp","_potentionalSnapObject","_snapToClassName","_snapToConfig","_snapPosition","_possibleSnapPosition","_contactThreshold","_isBelowTerrain","_worldPosition","_isInAir","_numberOfContactsBottom","_startPosition","_endPosition"];
scriptName 'Exile Construction Thread';
("ExileClientConstructionModeLayer" call BIS_fnc_rscLayer) cutRsc ["RscExileConstructionMode", "PLAIN", 1, false];
ExileClientIsInConstructionMode = true;
ExileClientConstructionResult = 0;
ExileClientConstructionStartPosition = getPosASL player;
ExileLifeCannotBuild = true;
_boundingBox = boundingBoxReal ExileClientConstructionObject;
_boundingBoxMinimum = _boundingBox select 0;
_boundingBoxMaximum = _boundingBox select 1;
_boundingBoxPointsTop =
[
	[_boundingBoxMinimum select 0, _boundingBoxMinimum select 1, _boundingBoxMaximum select 2],
	[_boundingBoxMinimum select 0, _boundingBoxMaximum select 1, _boundingBoxMaximum select 2],
	[_boundingBoxMaximum select 0, _boundingBoxMinimum select 1, _boundingBoxMaximum select 2],
	[_boundingBoxMaximum select 0, _boundingBoxMaximum select 1, _boundingBoxMaximum select 2]
];
_boundingBoxPointsBottom =
[
	[_boundingBoxMinimum select 0, _boundingBoxMinimum select 1, _boundingBoxMinimum select 2],
	[_boundingBoxMinimum select 0, _boundingBoxMaximum select 1, _boundingBoxMinimum select 2],
	[_boundingBoxMaximum select 0, _boundingBoxMinimum select 1, _boundingBoxMinimum select 2],
	[_boundingBoxMaximum select 0, _boundingBoxMaximum select 1, _boundingBoxMinimum select 2],
	[0, 0, _boundingBoxMinimum select 2] 
];
ExileClientConstructionBoundingRadius = 1 + 0.5 * ([_boundingBoxMaximum select 0, _boundingBoxMaximum select 1, 0] distance [_boundingBoxMinimum select 0, _boundingBoxMinimum select 1, 0]);
ExileClientConstructionOffset set [1, 5 max ExileClientConstructionBoundingRadius];
_objectColor = "#(argb,2,2,1)color(0.7,0.93,0,0.6,ca)";
_materialColor = _objectColor;
_simulatePhysics = false;
_position = [0, 0, 0];
_rotation = 0;
_vectorDirection = [0, 0, 0];
_isSleepingBag = ExileClientConstructionKitClassName isEqualTo "ExileLife_Item_SleepingBag";
_isFlag = ExileClientConstructionKitClassName isEqualTo "Exile_Item_Flag";
if (_isFlag) then
{
	ExileClientConstructionModePhysx = false;
};
[] call ExileClient_gui_constructionMode_update;
while {ExileClientConstructionResult isEqualTo 0} do
{
	if (ExileClientConstructionProcess isEqualTo 1) then
	{
		if !(ExileClientConstructionKitClassName in (magazines player)) then
		{
			ExileClientConstructionResult = 2;
		};
	};
	if !(ExileClientConstructionLock) then
	{
		_vectorUp = [0, 0, 1];
		ExileClientConstructionCanPlaceObject = false;
		switch (ExileClientConstructionMode) do
		{
			case 1:
			{
				_position = ASLtoATL (AGLtoASL (player modelToWorld ExileClientConstructionOffset));
				_rotation = (ExileClientConstructionRotation + (getDir player) + 360) % 360;
				_vectorDirection = [sin(_rotation), cos(_rotation), 0];
			};
			case 2:
			{
				_position = ASLtoATL (AGLtoASL (player modelToWorld ExileClientConstructionOffset));
				_position =
				[
					(_position select 0) - ((_position select 0) % (ExileClientConstructionGrid select 0)),
					(_position select 1) - ((_position select 1) % (ExileClientConstructionGrid select 1)),
					(_position select 2) - ((_position select 2) % (ExileClientConstructionGrid select 2))
				];
				_rotation = (ExileClientConstructionRotation + 360) % 360;
				_vectorDirection = [sin(_rotation), cos(_rotation), 0];
			};
			case 3:
			{
				ExileClientConstructionIsSnapped = false;
				if (ExileClientConstructionIsInSelectSnapObjectMode) then
				{
					ExileClientConstructionPossibleSnapPositions = [];
					ExileClientConstructionCurrentSnapToObject = objNull;
					_position = getPosATL player;
					_position set [2, -500]; 
					_rotation = (ExileClientConstructionRotation + (getDir player) + 360) % 360;
					_vectorDirection = [sin(_rotation), cos(_rotation), 0];
					_potentionalSnapObject = cursorTarget;
					if !(isNull _potentionalSnapObject) then
					{
						if (_potentionalSnapObject distance player < 12) then
						{
							_snapToClassName = typeOf _potentionalSnapObject;
							if (_snapToClassName in ExileClientConstructionSnapToObjectClassNames) then
							{
								ExileClientConstructionCurrentSnapToObject = _potentionalSnapObject;
								_snapToConfig = ("getText(_x >> 'staticObject') == _snapToClassName" configClasses(configFile >> "CfgConstruction")) select 0;
								{
									_snapPosition = getArray (_snapToConfig >> "SnapPositions" >> _x);
									_possibleSnapPosition = ASLtoATL (AGLtoASL (_potentionalSnapObject modelToWorld _snapPosition));
									ExileClientConstructionPossibleSnapPositions pushBack _possibleSnapPosition;
								}
								forEach getArray (ExileClientConstructionConfig >> "SnapObjects" >> _snapToClassName >> "positions");
							};
						};
					};
				}
				else
				{
					_position = ASLtoATL (AGLtoASL (player modelToWorld ExileClientConstructionOffset));
					_rotation = (ExileClientConstructionRotation + (getDir player) + 360) % 360;
					_vectorDirection = [sin(_rotation), cos(_rotation), 0];
					{
						if (_x distance _position < 1) exitWith
						{
							_position = _x;
							_rotation = (ExileClientConstructionRotation + (getDir ExileClientConstructionCurrentSnapToObject) + 360) % 360;
							_vectorDirection = [sin(_rotation), cos(_rotation), 0];
							_vectorUp = vectorUp ExileClientConstructionCurrentSnapToObject;
							ExileClientConstructionIsSnapped = true;
						};
					}
					forEach ExileClientConstructionPossibleSnapPositions;
				};
			};
		};
		ExileClientConstructionObject setVectorDirAndUp [_vectorDirection, _vectorUp];
		ExileClientConstructionObject setPosATL _position;
	};
	_contactThreshold = 0.1; 
	_isBelowTerrain = true;
	{
		_worldPosition = ASLtoATL (AGLtoASL (ExileClientConstructionObject modelToWorld _x));
		if ((_worldPosition select 2) > _contactThreshold) exitWith {_isBelowTerrain = false};
	}
	forEach _boundingBoxPointsTop;
	_isInAir = true;
	_numberOfContactsBottom = 0;
	{
		_worldPosition = ASLtoATL (AGLtoASL (ExileClientConstructionObject modelToWorld _x));
		if ((_worldPosition select 2) < _contactThreshold) then
		{
			_isInAir = false
		};
		_startPosition = ATLtoASL[_worldPosition select 0, _worldPosition select 1, (_worldPosition select 2) + _contactThreshold];
		_endPosition = ATLtoASL [_worldPosition select 0, _worldPosition select 1, (_worldPosition select 2) - _contactThreshold];
		if (count lineIntersectsObjs[_startPosition, _endPosition, ExileClientConstructionObject, objNull, false, 2] > 0) then
		{
			_numberOfContactsBottom = _numberOfContactsBottom + 1;
		};
	}
	forEach _boundingBoxPointsBottom;
	if ((_isBelowTerrain) ) then
	{
		ExileClientConstructionCanPlaceObject = false;
		_simulatePhysics = false;
		_objectColor = "#(argb,2,2,1)color(0.91,0,0,0.6,ca)";
		ExileLifeCannotBuild = true;
	}
	else
	{
		ExileClientConstructionCanPlaceObject = true;
		ExileLifeCannotBuild = false;
		if !(ExileClientConstructionModePhysx) then
		{
			_objectColor = "#(argb,2,2,1)color(0.7,0.93,0,0.6,ca)";
			_simulatePhysics = false;
		}
		else
		{
			if (_isInAir) then
			{
				if (_numberOfContactsBottom >= 3) then
				{
					_objectColor = "#(argb,2,2,1)color(0.7,0.93,0,0.6,ca)";
					_simulatePhysics = false;
				}
				else
				{
					_objectColor = "#(argb,2,2,1)color(1,0.79,0.07,0.6,ca)";
					_simulatePhysics = true;
				};
			}
			else
			{
				_objectColor = "#(argb,2,2,1)color(0.7,0.93,0,0.6,ca)";
				_simulatePhysics = false;
			};
		};
	};
	if (ExileClientConstructionMode isEqualTo 3) then
	{
		if (!ExileClientConstructionIsSnapped) then
		{
			ExileLifeCannotBuild = true;
			ExileClientConstructionCanPlaceObject = false;
			_simulatePhysics = false;
			_objectColor = "#(argb,2,2,1)color(0.91,0,0,0.6,ca)";
		};
	};
	if !(([configName ExileClientConstructionConfig, (getPosASL ExileClientConstructionObject), getPlayerUID player] call ExileClient_util_world_canBuildHere) isEqualTo 0) then
	{
		ExileLifeCannotBuild = true;
		ExileClientConstructionCanPlaceObject = false;
		_simulatePhysics = false;
		_objectColor = "#(argb,2,2,1)color(0.91,0,0,0.6,ca)";
	};
	if (_isFlag || _isSleepingBag) then
	{
		if (_isSleepingBag && (ExileClientConstructionObject call ExileLifeClient_util_housing_canSquatHere) isEqualTo "") then
		{
			ExileLifeCannotBuild = true;
			ExileClientConstructionCanPlaceObject = false;
			_simulatePhysics = false;
			_objectColor = "#(argb,2,2,1)color(0.91,0,0,0.6,ca)";
		};
		if (((getPos ExileClientConstructionObject) select 2) > 0.2) then
		{
			ExileLifeCannotBuild = true;
			ExileClientConstructionCanPlaceObject = false;
			_simulatePhysics = false;
			_objectColor = "#(argb,2,2,1)color(0.91,0,0,0.6,ca)";
		};
	};
	if (_objectColor != _materialColor) then
	{
		ExileClientConstructionObject setObjectTextureGlobal[0, _objectColor];
		ExileClientConstructionObject setObjectTextureGlobal[1, _objectColor];
		ExileClientConstructionObject setObjectTextureGlobal[2, _objectColor];
		ExileClientConstructionObject setObjectTextureGlobal[3, _objectColor];
		_materialColor = _objectColor;
		switch  (_objectColor) do
		{
		    case "#(argb,2,2,1)color(1,0.79,0.07,0.6,ca)":
		    {
		        ExileLifeConstructionColor = [1,1,0,1]; 
		    };
		    case "#(argb,2,2,1)color(0.91,0,0,0.6,ca)":
		    {
		        ExileLifeConstructionColor = [1,0,0,1]; 
		    };
		    case "#(argb,2,2,1)color(0.7,0.93,0,0.6,ca)":
		    {
		        ExileLifeConstructionColor = [0,1,0,1]; 
		    };
		    default {};
		};
	};
	if (ExileClientConstructionStartPosition distance (getPosASL player) > 10) then
	{
		ExileClientConstructionResult = 3;
	};
	uiSleep 0.001; 
};
if !(ExileClientConstructionModePhysx) then
{
	_simulatePhysics = false;
};
_simulatePhysics call ExileClient_construction_handleAbort;
ExileClientConstructionObject = objNull;
ExileClientIsInConstructionMode = false;
ExileClientConstructionResult = 0;
ExileClientConstructionProcess = 0;
ExileClientConstructionLock = false;
ExileLifeCannotBuild = false;
ExileLifeConstructionColor = [];
("ExileClientConstructionModeLayer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
true
