/**
                    * ExilelifeClient_gui_util_fade
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_fadefrom","_fadeto","_controls","_duration","_firstrun","_control"];
disableSerialization;
_display = _this select 0;
_fadefrom = _this select 1;
_fadeto = _this select 2;
_controls = _this select 3;
_duration = _this select 4;
_firstrun = _this select 5; 
if (ExileLifeClientFadeControl) exitWith {};
ExileLifeClientFadeControl = true;
if (!(_fadeto isEqualTo 1) && (isNil "_firstrun")) then
{
	{
		_control = _display displayCtrl _x;
		_control ctrlShow true;
	}
	forEach _controls;
};
{
	_control = _display displayCtrl _x;
	_control ctrlSetFade _fadefrom;
	_control ctrlCommit 0;
	_control ctrlSetFade _fadeto;
	_control ctrlCommit _duration;
}
forEach _controls;
waitUntil {ctrlCommitted _control};
if (_fadeto isEqualTo 1) then
{
	{
		_control = _display displayCtrl _x;
		_control ctrlShow false;
	}
	forEach _controls;
};
ExileLifeClientFadeControl = false;
true