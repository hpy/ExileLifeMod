/**
                    * ExilelifeClient_object_vehicle_toggle_Siren
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_guardVeh","_toggle","_SirenToggle"];
_guardVeh = _this select 0;
_toggle = _this select 1;
if (_toggle) then {
	_SirenToggle = true;
	_guardVeh setVariable ["ExileLifeSiren", true];
	_guardVeh animate ["Siren", 1];
} else {
	_SirenToggle = false;
	_guardVeh setVariable ["ExileLifeSiren", false];
};
while {(_guardVeh getVariable ["ExileLifeSiren", false]) && alive _guardVeh} do 
{	
	if (!isnull driver _guardVeh && getdammage _guardVeh < 0.9 && _SirenToggle) then 
	{
		_guardVeh say3d "guard_siren1";
		uisleep 6.5;
	} else {
		if (isnull driver _guardVeh && _guardVeh animationPhase "Siren" == 1) then {
			_guardVeh animate ["Siren", 0];
			_guardVeh setVariable ["ExileLifeSiren", false];
		};
		_SirenToggle = false;
		_guardVeh setVariable ["ExileLifeSiren", false];
	};
};