/**
                    * ExilelifeClient_object_housing_lockAdd
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_house","_door","_doorlocked","_pincode"];
_house = _this select 0;
_door = _this select 1;
try
{
	if !("Exile_Item_Codelock" in (magazines player)) then
	{
		throw "You need a Codelock first!";
	};
	if(isNull _house) then
	{
		throw "No can do.";
	};
	_doorlocked = _house getVariable [format["ExileLifeHasLock_%1",_door],""];
	if !(_doorlocked isEqualTo "") then
	{
		throw "There is already a lock on this door!"; 
	};
	_pincode = 4 call ExileClient_gui_keypadDialog_show;
	if (_pincode isEqualTo "") then
	{
		throw "Please enter a four-digit PIN code.";
	};
	["addHouseLockRequest",[netID _house,_door,_pincode]] call ExileClient_system_network_send;
	call ExileClient_gui_interactionMenu_unhook;
}
catch
{
	["ErrorTitleAndText", ["Failed to add a lock!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};