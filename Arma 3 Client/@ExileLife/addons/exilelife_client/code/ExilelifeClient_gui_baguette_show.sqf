/**
                    * ExilelifeClient_gui_baguette_show
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_title","_subText","_timeToDisplay","_barColor","_baguette","_iconArea","_text","_textArea","_textAreaSize","_subTextArea","_subTextAreaSize","_subTextControl","_textHeight","_textPosition","_backgroundControl","_backgroundPosition","_colorBar","_barPosition"];
if(ExileClientBleedOutThread != -1) exitWith{};
if !(ExileClientBaguetteAreaVisible) exitWith { false };
disableSerialization;
_title = _this select 0;
_subText = param [1, ""];
_timeToDisplay = param [2, 0];
_barColor = param [3, [0.247, 0.831, 0.988, 1]];
if (_barColor isEqualType "") then
{
	switch (toLower(_barColor)) do
	{
		case "blue":
		{
			_barColor = [0.247, 0.831, 0.988, 1];
		};
		case "red":
		{
			_barColor = [0.431,0.208,0.263,1];
		};
		case "purple":
		{
			_barColor = [0.4,0.2,0.6,1];
		};
		case "green":
		{
			_barColor = [0.208,0.431,0.376,1];
		};
		case "orange":
		{
		    _barColor = [0.247,0.11,0.043,1];
		};
		default
		{
		    _barColor = [0.247, 0.831, 0.988, 1];
		};
	};
};
waitUntil {!ExileBaguetteIsVisible};
ExileLifeNotifications pushBack [_title,_subText,time];
ExileBaguetteIsVisible = true;
_baguette = uiNamespace getVariable ["RscExileBaguetteArea", displayNull];
_iconArea = _baguette displayCtrl 25003;
_iconArea ctrlSetFade 1;
_iconArea ctrlCommit 0;
_text = _baguette displayCtrl 25002;
_text ctrlSetText _title;
_textArea = _baguette displayCtrl 25000;
_textAreaSize = ctrlPosition _textArea;
_textArea ctrlSetPosition [_textAreaSize select 0, _textAreaSize select 1, 0, _textAreaSize select 2];
_textArea ctrlSetFade 1;
_textArea ctrlCommit 0;
_subTextArea = _baguette displayCtrl 25006;
_subTextAreaSize = ctrlPosition _subTextArea;
_subTextArea ctrlSetPosition [_subTextAreaSize select 0, _subTextAreaSize select 1, _subTextAreaSize select 2, 0];
_subTextArea ctrlSetFade 1;
_subTextArea ctrlCommit 0;
if !(_subText isEqualTo "") then
{
	if(_timeToDisplay==0)then{
		_timeToDisplay = 3;
	};
	_subTextControl = _baguette displayCtrl 25009;
	_subTextControl ctrlSetStructuredText (parseText format["<t size='19' font='PuristaMedium'>%1</t>",_subText]);
	_textHeight = ctrlTextHeight _subTextControl;
	_textPosition = ctrlPosition _subTextControl;
	_textPosition set [3, _textHeight];
	_subTextAreaSize set [3, _textHeight + 14 * pixelH];
	_textPosition set [1, 7 * pixelH];
	_subTextControl ctrlSetPosition _textPosition;
	_subTextControl ctrlCommit 0;
	_backgroundControl = _baguette displayCtrl 25007;
	_backgroundPosition = ctrlPosition _backgroundControl;
	_backgroundPosition set [3, _subTextAreaSize select 3];
	_backgroundControl ctrlSetPosition _backgroundPosition;
	_backgroundControl ctrlCommit 0;
	_colorBar = _baguette displayCtrl 25008;
	_colorBar ctrlSetBackGroundColor _barColor;
	_barPosition = ctrlPosition _colorBar;
	_barPosition set [3, _subTextAreaSize select 3];
	_colorBar ctrlSetPosition _barPosition;
	_colorBar ctrlCommit 0;
};
_iconArea ctrlSetFade 0;
_iconArea ctrlCommit 0.5;
uiSleep 0.5;
playsound "ZoomIn";
_textArea ctrlSetPosition _textAreaSize;
_textArea ctrlSetFade 0;
_textArea ctrlCommit 0.25;
if !(_subText isEqualTo "") then
{
	uiSleep 0.75;
	_subTextArea ctrlSetPosition _subTextAreaSize;
	_subTextArea ctrlSetFade 0;
	_subTextArea ctrlCommit 0.50;
};
uiSleep (0.25 + _timeToDisplay);
_textArea ctrlSetPosition [_textAreaSize select 0, _textAreaSize select 1, 0, _textAreaSize select 2];
_textArea ctrlSetFade 1;
_textArea ctrlCommit 0.25;
if !(_subText isEqualTo "") then
{
	_subTextArea ctrlSetPosition [_subTextAreaSize select 0, _subTextAreaSize select 1, _subTextAreaSize select 2, 0];
	_subTextArea ctrlSetFade 1;
	_subTextArea ctrlCommit 0.25;
};
playsound "ZoomOut";
uiSleep 0.25;
_iconArea ctrlSetFade 1;
_iconArea ctrlCommit 0.5;
uiSleep 0.25;
_textArea ctrlSetPosition _textAreaSize;
_textArea ctrlCommit 0;
_subTextArea ctrlSetPosition _subTextAreaSize;
_subTextArea ctrlCommit 0;
ExileBaguetteIsVisible = false;
