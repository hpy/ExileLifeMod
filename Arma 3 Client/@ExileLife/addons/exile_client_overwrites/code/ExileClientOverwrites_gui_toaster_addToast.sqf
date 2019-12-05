/**
                    * ExileClientOverwrites_gui_toaster_addToast
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

                    private["_rawText","_stripeColor","_display","_toastControl","_toastPosition","_textControl","_textHeight","_textPosition","_backgroundControl","_backgroundPosition","_stripeControl","_stripePosition"];
disableSerialization;
if !(ExileClientToastAreaVisible) exitWith { false };
if(ExileClientBleedOutThread != -1) exitWith{false};
_rawText = _this select 0;
_stripeColor = _this select 1;
_display = uiNameSpace getVariable ["RscExileToastArea", displayNull];
_toastControl = _display ctrlCreate ["RscExileToast", -1];
_toastPosition = ctrlPosition _toastControl;
_textControl = _toastControl controlsGroupCtrl 102;
_textControl ctrlSetStructuredText (parseText _rawText);
_textHeight = ctrlTextHeight _textControl;
_textPosition = ctrlPosition _textControl;
_textPosition set [3, _textHeight];
if (_textHeight < ((_toastPosition select 3) - 14 * pixelH)) then
{
	_textPosition set [1, (_toastPosition select 1) + ((_toastPosition select 3) - _textHeight) * 0.5];
}
else
{
	_toastPosition set [3, _textHeight + 14 * pixelH];
	_textPosition set [1, 7 * pixelH];
};
_textControl ctrlSetPosition _textPosition;
_textControl ctrlCommit 0;
_backgroundControl = _toastControl controlsGroupCtrl 100;
_backgroundPosition = ctrlPosition _backgroundControl;
_backgroundPosition set [3, _toastPosition select 3];
_backgroundControl ctrlSetPosition _backgroundPosition;
_backgroundControl ctrlCommit 0;
_stripeControl = _toastControl controlsGroupCtrl 101;
_stripeControl ctrlSetBackGroundColor _stripeColor;
_stripePosition = ctrlPosition _stripeControl;
_stripePosition set [3, _toastPosition select 3];
_stripeControl ctrlSetPosition _stripePosition;
_stripeControl ctrlCommit 0;
_toastPosition set [0, safeZoneX + 475 * pixelW];
_toastPosition set [1, safeZoneY + (50 - 10) * pixelH - (_toastPosition select 3)];
_toastControl ctrlSetPosition _toastPosition;
_toastControl ctrlSetFade 1;
_toastControl ctrlCommit 0;
reverse ExileClientToasts;
ExileClientToasts pushBack [_toastControl, 0, diag_tickTime + 5];
reverse ExileClientToasts;
playsound "HintExpand";
call ExileClient_gui_toaster_pushToBottom;
