/**
                    * ExilelifeClient_gui_hud_VehicleActionSel
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_array","_vehicle","_seattype","_seatindex"];
_array = _this select 0;
_vehicle = _this select 1;
_seattype = _array select 0;
_seatindex = _array select 1;
switch (_seattype) do
{
	case "cargo":
	{
		player assignAsCargoIndex [_vehicle,_seatindex];
		player action ["getInCargo",_vehicle,_seatindex];
	};
	case "driver":
	{
		player action ["getInDriver",_vehicle];
	};
	case "turret":
	{
		player action ["getInTurret", _vehicle, _seatindex];
	};
};
if (ExileClientIsHandcuffed) then 
{
	ExileLifeHandcuffAssignedSeat = _seatindex;
};
