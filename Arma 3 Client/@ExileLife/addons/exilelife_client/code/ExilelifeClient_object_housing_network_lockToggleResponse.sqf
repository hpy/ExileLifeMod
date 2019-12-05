/**
                    * ExilelifeClient_object_housing_network_lockToggleResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_message","_mode","_houseID","_doorID","_pincode","_lockedState","_house"];
_message = _this select 0;
_mode = _this select 1;
_houseID = _this select 2;
_doorID = _this select 3;
_pincode = _this select 4;
_lockedState = _this select 5;
_house = objectFromNetId _houseID;
ExileLockIsShown = false;
if (_mode) then 
{
	["SuccessTitleOnly", [_message]] call ExileClient_gui_toaster_addTemplateToast;
	_house setVariable [format["ExileLifeAlreadyKnownCode_%1",_doorID], _pincode];
}
else 
{
	["ErrorTitleOnly", [_message]] call ExileClient_gui_toaster_addTemplateToast;
};
true
