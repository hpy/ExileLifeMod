/**
                    * ExilelifeClient_gui_keypadHack_event_onOKButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display"];
if (ExileLifeHackCheck) exitWith {};
ExileLockIsShown = false;
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeHackKeypad", displayNull];
_display closeDisplay 0;
["lockToggle",[netId ExileClientInteractionObject,ExileClientPinCode,false]] call ExileClient_system_network_send;
true