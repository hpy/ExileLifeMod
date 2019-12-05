/**
                    * ExileClientOverwrites_gui_escape_abort
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_display","_controlAbort","_controlSwitchCharacter","_controlSuicide","_controlTitle","_controlhide","_abortTime","_controlSave","_punishOnDisconnect","_jobClassname"];
 if (player getVariable ['ExileLifeClientIncapacitated', false]) exitWith{};
disableSerialization;
waitUntil {!isNull (findDisplay 49)};
_display = findDisplay 49;
_controlAbort = _display displayCtrl 104;
_controlSwitchCharacter = _display displayCtrl 9122;
_controlSuicide = _display displayCtrl 1010;
_controlTitle = _display displayCtrl 523;
_controlhide = _display displayCtrl 122;
_abortTime = diag_tickTime + 10;
_controlSave = _display displayCtrl 103;
_controlTitle ctrlSetText "http://www.exilelifemod.com/"; 
_controlTitle ctrlCommit 0;
_controlSave ctrlEnable true;
_controlSave ctrlRemoveAllEventHandlers "ButtonClick";
_controlSave ctrlSetText "ExileLife Settings";
_controlSave ctrlSetBackGroundColor [0,0,0,0.8];
_controlSave ctrlAddEventHandler ["ButtonClick","(findDisplay 49) closeDisplay 1; createDialog 'RscExileLifeSettings';"];
_controlSave ctrlCommit 0;
_controlhide ctrlShow false;
_controlhide ctrlCommit 0;
_controlSwitchCharacter ctrlEnable false;
_controlSwitchCharacter ctrlCommit 0;
_punishOnDisconnect = false;
if !(alive player) then
{
	_controlAbort ctrlEnable true;
	_controlAbort ctrlSetText "Disconnect";
	_controlAbort ctrlCommit 0;
}
else
{
	if (player getVariable ['ExileLifeClientUnconscious',false]) then
	{
		_punishOnDisconnect = true;
	};
	if (player getVariable ["ExileLifePrisoner",false]) then
	{
		_punishOnDisconnect = true;
	};
	if (player getVariable ['ExileLifeClientIncapacitated', false]) then
    {
        _punishOnDisconnect = true;
    };
	if (ExileClientPlayerIsInCombat) then
    {
        _punishOnDisconnect = true;
    };
	if (vehicle player != player)  then
    {
        _punishOnDisconnect = true;
    };
	if (ExileClientIsHandcuffed)  then
    {
        _punishOnDisconnect = true;
    };
	if (ExileIsPlayingRussianRoulette)  then
	{
		_punishOnDisconnect = true;
	};
	if !(ExileLifeCurrentJob isEqualTo []) then
	{
		_jobClassname = ExileLifeCurrentJob select 0;
		if (getNumber(configFile >> "CfgJobs" >> _jobClassname >> "punishOnDisconnect") > 0) then
		{
			_punishOnDisconnect = true;
		};
	};
	if (_punishOnDisconnect) then
	{
		_controlAbort ctrlEnable false;
		_controlAbort ctrlSetText "Disconnect";
		_controlAbort ctrlCommit 0;
		_controlSuicide ctrlEnable false;
		_controlSuicide ctrlSetText "Respawn";
		_controlSuicide ctrlCommit 0;
		_controlSwitchCharacter ctrlEnable false;
		_controlSwitchCharacter ctrlCommit 0;
	}
	else
	{
		_controlSuicide ctrlEnable true;
		_controlSuicide ctrlSetText "Commit Suicide";
		_controlSuicide ctrlSetEventHandler ["ButtonClick", "[] spawn ExileClient_gui_escape_suicide"];
		_controlSuicide ctrlCommit 0;
		while {!isNull _display} do
		{
			_controlAbort ctrlEnable false;
			_controlAbort ctrlSetText format ["(Please wait (%1s)", ceil(_abortTime - diag_tickTime)];
            _controlAbort ctrlRemoveAllEventHandlers "ButtonClick";
		    _controlAbort ctrlSetEventHandler ["ButtonClick", "[] spawn ExileLifeClient_gui_escape_disconnect"];
        	_controlAbort ctrlCommit 0;
			_controlSwitchCharacter ctrlEnable false;
			_controlSwitchCharacter ctrlCommit 0;
			if ((diag_tickTime > _abortTime)) exitWith 
			{
                _controlAbort ctrlEnable true;
                _controlAbort ctrlSetText "Disconnect";
                _controlAbort ctrlCommit 0;
                _controlSwitchCharacter ctrlEnable true;
                _controlSwitchCharacter ctrlCommit 0;
			};
		};
	};
};
true
