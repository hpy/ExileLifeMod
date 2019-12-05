/**
                    * ExilelifeClient_gui_rewardsDialog_event_onInputBoxChars
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_inputBox","_character","_dialog","_claimButton","_ctrlText"];
disableSerialization;
_inputBox = _this select 0;
_character = _this select 1;
_dialog = uiNameSpace getVariable ["RscExileLifeRewardsDialog", displayNull];
_claimButton = _dialog displayCtrl 3002;
_ctrlText = (ctrlText _inputBox);
try 
{
	if !((count _ctrlText) isEqualTo 4) then
	{
		throw false;
	};
	{
		if !(_x in [48, 49, 50, 51, 52, 53, 54, 55, 56, 57]) then
		{
			throw false;
		};
	}
	forEach (toArray _ctrlText);
	_claimButton ctrlEnable true;
}
catch 
{
	_claimButton ctrlEnable false;
};
if !(_character in [48,49,50,51,52,53,54,55,56,57]) then
{
	_ctrlText = _ctrlText select [0, (count _ctrlText) - 1];
	_inputBox ctrlSetText _ctrlText;
	_inputBox ctrlCommit 0;
};
true