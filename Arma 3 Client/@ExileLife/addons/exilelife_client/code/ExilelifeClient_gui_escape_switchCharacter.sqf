/**
                    * ExilelifeClient_gui_escape_switchCharacter
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display"];
disableSerialization;
_display = findDisplay 49;
if !(isNull _display) then
{
	_display closeDisplay 2; 
};
"Changing Character..." call ExileLifeClient_util_log;
cutText ["", "BLACK OUT", 1];
showChat true;
[] spawn
{
	uiSleep 1;
	["onHandleCharacterChange"] call ExileClient_system_network_send;
	uiSleep 1;
	call ExileLifeClient_system_process_resetVar;
	[] call ExileLifeClient_system_keybinding_initialize;
	ExileLifeClientSwitchCharacter = player;
	ExileLifeSwitchCharacterTemp = "Exile_Unit_GhostPlayer" createVehiclelocal [0,0,0];
	hideObject ExileLifeSwitchCharacterTemp;
	player reveal [ExileLifeSwitchCharacterTemp, 4];
	selectPlayer ExileLifeSwitchCharacterTemp;
	uisleep 1;
	deleteVehicle ExileLifeClientSwitchCharacter;
	[] execFSM "exilelife_client\fsm\login.fsm";
	uisleep 3;
};
