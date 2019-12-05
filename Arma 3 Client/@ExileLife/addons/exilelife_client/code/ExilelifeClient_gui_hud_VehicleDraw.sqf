/**
                    * ExilelifeClient_gui_hud_VehicleDraw
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_icon","_screenPosition","_screenPositionRelToWorld","_seatType","_seatIndex","_seatPosition","_screenEyePosition","_iconPositionModel","_eyeHeight","_vehiclePosArray","_selectedIcon","_distanceToSeatPosition","_iconColour","_tempArray","_screenPositionX","_screenPositionY","_SeatIndex"];
_icon = "";
_screenPosition = []; 
_screenPositionRelToWorld = "";
_seatType = _this select 0;
_seatIndex = _this select 1;
_seatPosition = _this select 2;
_screenPosition = (ExileClientInteractionObject modelToWorld _seatPosition);
if (_screenPosition isEqualTo []) exitWith {};
_screenEyePosition = 1.2; 
_iconPositionModel = ExileClientInteractionObject selectionPosition "zamerny";
if !(_iconPositionModel isEqualTo [0,0,0]) then
{
	_eyeHeight = (ExileClientInteractionObject modelToWorld _iconPositionModel) select 2;
	_screenEyePosition = _eyeHeight;
};
_screenPositionRelToWorld = [_screenPosition select 0,_screenPosition select 1,(_screenPosition select 2) + 1.2];
_vehiclePosArray = [];
_selectedIcon = false;
if((surfaceIsWater getPosATL player)||(surfaceIsWater getPosATL ExileClientInteractionObject))then
{
	_distanceToSeatPosition = (getPosWorld player) distance _screenPositionRelToWorld;
}
else
{
	_distanceToSeatPosition = player distance _screenPositionRelToWorld;
};
if (_distanceToSeatPosition > 2.2) exitWith {};
_screenPosition = worldToScreen _screenPositionRelToWorld;
if (_screenPosition isEqualTo []) exitWith {};
switch (_seatType) do
{
	case "cargo":{_icon="\exilelife_assets\Texture\ui\Actions\GetInCargo.paa"};
	case "turret":{_icon="\exilelife_assets\Texture\ui\Actions\GetInTurret.paa"};
	case "driver":{_icon="\exilelife_assets\Texture\ui\Actions\GetInDriver.paa"};
};	
_iconColour = [1,1,1,1];
_vehiclePosArray pushBack _tempArray;
_screenPositionX = _screenPosition select 0;
_screenPositionY = _screenPosition select 1;
try
{ 
	if !(_screenPositionY > 0.40) then
	{
		throw false;
	};
	if !(_screenPositionY < 0.60) then
	{
		throw false;
	};
	if !(_screenPositionX > 0.40) then
	{
		throw false;
	};
	if !(_screenPositionX < 0.60) then
	{
		throw false;
	};
	_iconColour = [0.357,0.773,0.906,0.8];
	_tempArray = [_seatType,_SeatIndex,_screenPositionRelToWorld];
	ExileLifeNearestAction = ExileLifeNearestAction + _tempArray;	
}
catch
{
	_selectedIcon = _exception;
};
drawIcon3D  [_icon, _iconColour , _screenPositionRelToWorld, 1.5, 1.5, 0, "" , 1, 0.03, "TahomaB"];
