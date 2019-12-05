/**
                    * ExilelifeClient_gui_hud_VehicleActionMenu
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_interactionObjectClass","_cargoSeats","_singleCargoSeats","_turretPositions","_selectionArray","_selectionPosition","_seattype","_positionCoords","_seatsel","_cnt"];
ExileLifeVehicleEntryPoints = [];
_interactionObjectClass = typeOf ExileClientInteractionObject;
ExileLifeNearestAction = [];
positionCoords = nil;
if ((player distance ExileClientInteractionObject) > 10) exitWith {};
if !(ExileClientInteractionObject isKindOf "AllVehicles") exitWith {};
if (((locked ExileClientInteractionObject) isEqualTo 2)) exitWith {};
if (ExileClientInteractionObject emptyPositions "Cargo" > 0) then
{
	_cargoSeats = [];
	if (isArray (configfile >> "CfgVehicles" >> _interactionObjectClass >> "memoryPointsGetInCargoDir")) then
	{
		_cargoSeats = getArray(configfile >> "CfgVehicles" >> _interactionObjectClass >> "memoryPointsGetInCargoDir");
		{
			ExileLifeVehicleEntryPoints = ExileLifeVehicleEntryPoints + [["cargo",ExileClientInteractionObject selectionPosition _x,_forEachIndex]]; 
		}forEach _cargoSeats;
	}
	else
	{
		_singleCargoSeats = (getText(configfile >> "CfgVehicles" >> _interactionObjectClass >> "memoryPointsGetInCargoDir"));
		ExileLifeVehicleEntryPoints = [["cargo",ExileClientInteractionObject selectionPosition _singleCargoSeats,1]];
	};
	if ((getArray(configfile >> "CfgVehicles" >> _interactionObjectClass >> "cargoIsCoDriver")) select 0 > 0 && ExileClientInteractionObject isKindOf "LandVehicle") then
	{
		ExileLifeVehicleEntryPoints = ExileLifeVehicleEntryPoints + [["cargo",ExileClientInteractionObject selectionPosition (getText(configfile >> "CfgVehicles" >> _interactionObjectClass >> "memoryPointsGetInCoDriverDir")),0]];
	};
};
if (ExileClientInteractionObject emptyPositions "Driver" > 0) then
{
	ExileLifeVehicleEntryPoints = ExileLifeVehicleEntryPoints + [["driver",ExileClientInteractionObject selectionPosition getText(configfile >> "CfgVehicles" >> _interactionObjectClass >> "memoryPointsGetInDriverDir"),0]];
};
_turretPositions = allTurrets [ExileClientInteractionObject,true];
if !(_turretPositions isEqualTo []) then 
{
	{
		_selectionArray = configFile >> "CfgVehicles" >> _interactionObjectClass >> "Turrets";
		_selectionPosition = ExileClientInteractionObject selectionPosition (getText(_selectionArray select (_x select 0) >> "memoryPointsGetInGunnerDir"));
		ExileLifeVehicleEntryPoints = ExileLifeVehicleEntryPoints + [["turret",_selectionPosition,_x]];
	}forEach _turretPositions;
};
{
	_seattype = _x select 0;
	_positionCoords = _x select 1;
	_seatsel = _x select 2;
	if (_seattype isEqualTo "turret") then 
	{
		_cnt = {(_x select 1) isEqualTo _positionCoords} count ExileLifeVehicleEntryPoints;
		if (_cnt > 1) then 
		{
			_positionCoords = [_positionCoords select 0,_positionCoords select 1, (_positionCoords select 2) + 0.4];
		};
	};
	[_seattype,_seatsel,_positionCoords] call ExileLifeClient_gui_hud_VehicleDraw;		
}forEach ExileLifeVehicleEntryPoints;
