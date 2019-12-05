/**
                    * ExilelifeClient_gui_selectCharacter_mainMenu
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_param","_firstrun","_display","_controlEnter","_controlChoose","_MAINMENUIDC","_control","_fade"];
_param = _this select 0;
_firstrun = _this select 1;
if (ExileLifeClientFadeControl) exitWith {};
if (isNil "_param") exitWith {};
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeCharacterSelection", displayNull];
if (isNull _display) then
{
	createDialog "RscExileLifeCharacterSelection";
	_display = uiNameSpace getVariable ["RscExileLifeCharacterSelection", displayNull];
	_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
};
switch (_param) do
{
    case 0:
    { 
		if ((ExileLifeClientSpawnSelectedCharacter getVariable ["ExileLifeClientBambi", ""])isEqualTo false) then
		{
			_controlEnter = _display displayCtrl 728504;
			_controlChoose = _display displayCtrl 728505;
			_controlEnter ctrlShow true;
			_controlChoose ctrlshow false;
			_MAINMENUIDC = 728504;			
		}
		else
		{
			if !(ExileLifeGuard) then
			{
				_controlEnter = _display displayCtrl 728504;
				_controlChoose = _display displayCtrl 728505;
				_controlEnter ctrlShow false;
				_controlChoose ctrlShow true;
				_MAINMENUIDC = 728505;		
			}
			else
			{
				_controlEnter = _display displayCtrl 728504;
				_controlChoose = _display displayCtrl 728505;
				_controlEnter ctrlShow true;
				_controlChoose ctrlshow false;
				_MAINMENUIDC = 728504;	
			};		
		};
		_controlEnter ctrlSetFade 1;		
		_controlChoose ctrlSetFade 1;
		_controlEnter ctrlCommit 0;
		_controlChoose ctrlCommit 0;
		if (_firstrun > 0) then
		{
	    	{
				_control = _display displayCtrl _x;
				_control ctrlShow false;
			}
			forEach [728508,728504, 728505, 728506, 728507];
			_fade = [_display,1,0,[_MAINMENUIDC,728506,728507],3] spawn ExileLifeClient_gui_util_fade;
		}
		else
		{
			_fade = [_display,1,0,[_MAINMENUIDC,728506,728507],3] spawn ExileLifeClient_gui_util_fade;
		};
    };
    case 1:
    {
		_fade = [_display,0,1,[_MAINMENUIDC,728506,728507],1] spawn ExileLifeClient_gui_util_fade;
		closeDialog 0;
   		[2] call ExileLifeClient_gui_selectCharacter_switchMenu;
    };
    case 2:
    {
		_fade = [_display,1,0,[728504,728505,728506,728507],1,1] spawn ExileLifeClient_gui_util_fade;
		_controlEnter = _display displayCtrl 728504;
		_controlChoose = _display displayCtrl 728505;
		if ((ExileLifeClientSpawnSelectedCharacter getVariable ["ExileLifeClientBambi", ""])isEqualTo false) then
		{
			_controlEnter ctrlShow true;
			_controlChoose ctrlshow false;
			_MAINMENUIDC = 728504;			
		}
		else
		{
			if !(ExileLifeGuard) then
			{
				_controlEnter ctrlShow false;
				_controlChoose ctrlShow true;
				_MAINMENUIDC = 728505;		
			}
			else
			{
				_controlEnter ctrlShow true;
				_controlChoose ctrlshow false;
				_MAINMENUIDC = 728504;	
			};		
		};
		_controlEnter ctrlCommit 0;
		_controlChoose ctrlCommit 0;
    };
    case 3:
    {
    	{
			_control = _display displayCtrl _x;
			_control ctrlShow false;
		}
		forEach [728508,728504, 728505, 728506, 728507];
		_fade = [_display,1,0.25,[728508],2] spawn ExileLifeClient_gui_util_fade;
    };
    case 4:
    {
		_fade = [_display,0.25,1,[728508],2] spawn ExileLifeClient_gui_util_fade;
    };
};
true
