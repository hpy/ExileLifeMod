/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistory_event_onScanButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_prisoner","_prisonerID","_prisonerName"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
try
{
    if(isPlayer ExileClientInteractionObject)then{
        throw ExileClientInteractionObject;
    };
    _prisoner = [position player, 5] call ExileLifeClient_util_world_getNearestPrisoner;
    if !(isNil "_prisoner")then{
        throw _prisoner;
    };
}
catch
{
    _prisonerID = _exception getVariable ["ExileLifePrisonerID",""];
    _prisonerName =  [_exception] call ExileLifeClient_util_player_name;
    (_display displayCtrl 4152) ctrlSetText _prisonerID;
    (_display displayCtrl 4153) ctrlSetText _prisonerName;
};
true
