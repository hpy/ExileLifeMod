/**
                    * ExilelifeClient_gui_selectCharacter_stats_show
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display"];
if (ExileLifeGuard) exitWith {};
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeCharacterSelectionChooseChar", displayNull];
[_display,1,0,[728509,728510,728511,728512,728513,728514,728515,728516,728517,728518,728519,728520,728521,728522,728523,728524],1] spawn ExileLifeClient_gui_util_fade;
[_this select 0] call ExilelifeClient_gui_selectCharacter_stats_update;
