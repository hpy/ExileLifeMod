/**
                    * ExilelifeClient_gui_keypadHack_hashCat
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_pincode","_loopStart","_loop0Start","_loop1Start","_pincodeArray","_number","_numbertoSend","_modifier","_loop2Start","_loop3Start","_loop4Start","_loopFinish","_digitsArray","_countDigits","_newNumber"];
_pincode = _this;
_loopStart = time;
_loop0Start = _loopStart + 8;
_loop1Start = _loop0Start + 8;
ExileLifeHackCheck = true;
ExileLifeHashCatLoop = true;
if (_pincode isEqualto "ERROR" || _pincode isEqualto "") exitWith
{
	ExileLifeHashCatLoop = false;
    ExileClientPinCode = "DENIED";
    [0] call ExileLifeClient_gui_keypadHack_updateControls;
};
_pincodeArray = _pincode splitString "";
_number = "";
_numbertoSend = "";
_modifier = 0;
while {ExileLifeHashCatLoop} do
{
  try
  {
  	if (ExileClientPinCodeLength isEqualto 6) then
  	{
		if (time < _loop0Start) then
		{
			throw str(floor(random [000000, 555555, 999999]));
		};
		if (time < _loop1Start) then
		{
			throw str(floor(random [00000, 55555, 99999]));
		};
  	};
  	if (ExileClientPinCodeLength isEqualto 5) then
  	{
		_loop1Start = _loopStart + 8;
		_modifier = 1;
		if (time < _loop1Start) then
		{
			throw str(floor(random [00000, 55555, 99999]));
		};
  	};
	_loop2Start = _loop1Start + 8;
  	if (ExileClientPinCodeLength isEqualto 4) then
  	{
		_loop2Start = _loopStart + 8;
		_modifier = 2;
  	};
	_loop3Start = _loop2Start + 6;
	_loop4Start = _loop3Start + 4;
	_loopFinish = _loop4Start + 2;
	if (time < _loop2Start) then
	{
		throw str(floor(random [0000, 5555, 9999]));
	};
	if (time < _loop3Start) then
	{
		throw str(floor(random [000, 555, 999]));
	};
	if (time < _loop4Start) then
	{
		throw str(floor(random [00, 55, 99]));
	};
	if (time < _loopFinish) then
	{
		throw str(floor(random [0, 5, 9]));
	}
	else
	{
		ExileLifeHashCatLoop = false;
		throw _pincode;
	};
  }
  catch
  {
	_number = _exception;
  };
if !(_number isEqualto _pincode) then
{
	_digitsArray = _number splitstring "";
	_countDigits = (count _digitsArray) + _modifier;
	switch (_countDigits) do
	{
		case 6 :
		{
			ExileClientPinCode = _number;
		};
		case 5 :
		{
			_newNumber = ([(_pincodeArray select 0)] + _digitsArray) joinString "";
			ExileClientPinCode = _newNumber;
		};
		case 4 :
		{
			_newNumber = ([(_pincodeArray select 0),(_pincodeArray select 1)] + _digitsArray) joinString "";
			ExileClientPinCode = _newNumber;
		};
		case 3 :
		{
			_newNumber = ([(_pincodeArray select 0),(_pincodeArray select 1),(_pincodeArray select 2)] + _digitsArray) joinString "";
			ExileClientPinCode = _newNumber;
		};
		case 2 :
		{
			_newNumber = ([(_pincodeArray select 0),(_pincodeArray select 1),(_pincodeArray select 2),(_pincodeArray select 3)] + _digitsArray) joinString "";
			ExileClientPinCode = _newNumber;
		};
		case 1 :
		{
			_newNumber = ([(_pincodeArray select 0),(_pincodeArray select 1),(_pincodeArray select 2),(_pincodeArray select 3),(_pincodeArray select 4)] + _digitsArray) joinString "";
			ExileClientPinCode = _newNumber;
		};
		default {  ExileClientPinCode = _pincode; ExileLifeHashCatLoop = false;};
	};
};
 [0] call ExileLifeClient_gui_keypadHack_updateControls;
  uisleep 0.2;
};
waitUntil {!(ExileLifeHashCatLoop)};
ExileLifeHackCheck = false;
ExileClientPinCode = _pincode;
[1] call ExileLifeClient_gui_keypadHack_updateControls;
