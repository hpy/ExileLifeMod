/**
                    * ExilelifeClient_gui_keypadHack_updateControls
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_cracked","_display","_screenText","_text","_okayButton","_abortButton","_control"];
_cracked = _this param [0,0];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeHackKeypad", displayNull];
_screenText = _display displayCtrl 4001;
if (ExileClientPinCode isEqualTo "") then 
{
	_text = "HASHCAT XL";
}
else 
{
	_text = ExileClientPinCode;
};
_screenText ctrlSetText _text;
_okayButton = _display displayCtrl 4000;
_abortButton = _display displayCtrl 4002;
switch (_cracked) do 
{ 
	case 0 : 
	{
		_okayButton ctrlEnable false;
	}; 
	case 1 : 
	{ 
		_okayButton ctrlRemoveAllEventHandlers "ButtonClick";
		_okayButton ctrlSetEventHandler ["ButtonClick","call ExileLifeClient_gui_keypadHack_event_onOKButtonClick"];	
		_okayButton ctrlEnable true;
	}; 
	case 2 : 
	{
		_okayButton ctrlRemoveAllEventHandlers "ButtonClick";	
		_okayButton ctrlSetEventHandler ["ButtonClick","[ExileClientInteractionObject,-1] call ExileLifeClient_object_lock_hack;"];	
		_okayButton ctrlEnable true;
		_abortButton ctrlRemoveAllEventHandlers "ButtonClick";	
		_abortButton ctrlSetEventHandler ["ButtonClick","ExileLifeHashCatLoop = false; closeDialog 0;"];	
		_abortButton ctrlEnable true;		
		{
			_control = _display displayCtrl _x;
			_control ctrlEnable false;
		} forEach [4004,4005,4006,4007,4008,4009,4010,4011,4012,4003];
	};  
	default {_okayButton ctrlEnable false;}; 
};
true