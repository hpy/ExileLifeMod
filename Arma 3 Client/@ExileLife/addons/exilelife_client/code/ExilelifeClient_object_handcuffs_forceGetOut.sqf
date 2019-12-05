/**
                    * ExilelifeClient_object_handcuffs_forceGetOut
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_success"];
_success = false;
try
{
	if !(alive player) then
	{
		throw false;
	};
	if ((locked _this) isEqualTo 2) then
	{
		throw false;
	};
	["forceGetOutRequest", [(netId _this)]] call ExileClient_system_network_send;
	call ExileClient_gui_interactionMenu_unhook;
}
catch
{
	_success = _exception;
};
_success
