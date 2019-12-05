/**
                    * ExilelifeClient_gui_revive_show
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_control"];
disableSerialization;
if !(player getVariable ['ExileLifeClientIncapacitated',false])exitWith{};
createDialog "RscExileLifeRevive";
ExileLifeReviveScreenIsVisible = true;
_display = uiNameSpace getVariable ["RscExileLifeRevive", displayNull];
{
    _control = _display displayCtrl _x;
    _control ctrlEnable true;
    _control ctrlShow true;
    _control ctrlSetFade 1;
    _control ctrlCommit 0;
    _control ctrlSetFade 0;
    _control ctrlCommit 1;
}forEach [1600, 1700, 1800];
