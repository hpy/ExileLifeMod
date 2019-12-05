/**
                    * ExilelifeClient_gui_keypadHack_event_onAbortButtonClick
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
_display = uiNameSpace getVariable ["RscExileLifeHackKeypad", displayNull];
ExileClientPinCode = "";
ExileLifeHackCheck = false;
_display closeDisplay 0;
true