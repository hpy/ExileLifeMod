/**
                    * ExilelifeClient_object_lock_network_hackCodeLockResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_signature"];
_signature = _this select 0;
ExileLifeHackCheck = false;
if (("ExileLife_Item_HashCatXL" in (magazines player)) && ("Exile_Item_Laptop" in (magazines player))) then
{
	[player, "ExileLife_Item_HashCatXL", -1] call ExileClient_util_playerCargo_remove;
	ExileClientPinCodeLength = count _signature;
	_signature spawn ExileLifeClient_gui_keypadHack_hashCat;
};
