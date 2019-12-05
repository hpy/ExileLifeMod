/**
                    * ExilelifeClient_object_housing_lockToggle
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_house","_door","_doorname","_pincode"];
_house = _this select 0;
_door = _this select 1;
try
{
	if (ExileLockIsShown) then
	{
		throw "No can do.";
	};
	ExileLockIsShown = true;
	if !(_house isKindOf "House_F") then
	{
		throw "No can do.";
	};
	_doorname = format ["ExileLifeHasLock_%1",_door];
	if ((_house getVariable [_doorname,""]) isEqualTo "") then
	{
		throw "This door doesnt have a lock on it! Try the handle first ;)";
	};
	if (_door < 0) then
	{
		throw "You can only unlock/lock doors!";
	};
	_pincode = _house getVariable [format ["ExileLifeAlreadyKnownCode_%1",_door],""];
	if ((_pincode isEqualTo "") || ExileClientPlayerIsInCombat) then
	{
		_pincode = 4 call ExileClient_gui_keypadDialog_show;
		if (_pincode isEqualTo "") then
		{
			throw "Please enter a four-digit PIN code.";
		};
	};
	["houseLockToggle",[netID _house,_door,_pincode,0]] call ExileClient_system_network_send;
}
catch
{
	["ErrorTitleAndText", ["Failed to lock/unlock!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
	ExileLockIsShown = false;
};
