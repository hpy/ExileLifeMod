/**
                    * ExilelifeClient_gui_selectCharacter_switchMenu
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_param","_display","_fade","_characterBTN"];
_param = _this select 0;
if (ExileLifeClientFadeControl) exitWith {};
if (isNil "_param") exitWith {};
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeCharacterSelectionChooseChar", displayNull];
if (isNull _display) then
{
	createDialog "RscExileLifeCharacterSelectionChooseChar";
	_display = uiNameSpace getVariable ["RscExileLifeCharacterSelectionChooseChar", displayNull];
	_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
};
switch (_param) do
{
    case 0:
    {
		_fade = [_display,1,1,[738502,738505],1] spawn ExileLifeClient_gui_util_fade;
	};
    case 1:
    {
		_fade = [_display,0,1,[738502,738505],1] spawn ExileLifeClient_gui_util_fade;
		call ExileLifeClient_gui_selectCharacter_stats_hide;
		closeDialog 0;
   		[2] call ExileLifeClient_gui_selectCharacter_mainMenu;
	};
    case 2:
    {
		_fade = [_display,1,0,[738502,738505],1] spawn ExileLifeClient_gui_util_fade;
		[1] call ExileLifeClient_gui_selectCharacter_stats_show;
		_characterBTN = _display displayCtrl 738502;
		if !(ExileLifeClientHasTwoAccounts) then
		{
			if !(ExileLifeClientGuardRights) then
			{
				_characterBTN ctrlEnable false; 
				_characterBTN ctrlSetTooltip "Premium Content";
				_characterBTN ctrlSetEventHandler ["ButtonClick",""]; 
				_characterBTN ctrlCommit 0;
			};
		};
    };
};
true
