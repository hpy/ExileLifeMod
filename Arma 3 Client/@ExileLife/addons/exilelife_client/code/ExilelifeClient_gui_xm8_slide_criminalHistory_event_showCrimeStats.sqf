/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistory_event_showCrimeStats
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_btnPressID","_titlebar","_listbox","_currentCrime","_title","_text","_history","_fine","_historyList","_items","_itemsList","_notesList","_notes","_author","_date","_wanted","_armed","_wantedText","_armedText","_fineStatus","_fineAmount","_dateIssued","_secondsUntilDue","_datePaid","_jailSentence","_oreAmount","_prisonTime","_time","_length","_endSeconds","_days","_hours","_minutes","_infractionDate","_issuedBy"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_btnPressID = _this;
(_display displayCtrl 4182) ctrlShow true;
(_display displayCtrl 4180) ctrlShow true;
(_display displayCtrl 4166) ctrlShow true;
_titlebar = _display displayCtrl 4182;
_titlebar ctrlSetText "";
_listbox = _display displayCtrl 4166;
_listbox ctrlSetText "";
(_display displayCtrl 4176) ctrlShow false;
if(isNil "ExileLifeCurrentCrimeIndex" || ExileLifeCurrentCrimeMaxIndex < 0)then {
    ExileLifeCurrentCrimeIndex = 0; 
    _btnPressID = -1;
    _currentCrime = [];
}else{
    _currentCrime = (ExileLifeCriminalRecordsList select ExileLifeCurrentCrimeIndex);
};
_title = "";
_text = "";
_history = [];
_fine = [];
if !(_currentCrime isEqualTo [])then{
    _historyList = _currentCrime select 2; 
    _fine = (_historyList select 0) select 6;
};
_history = _historyList select 0;
switch (_btnPressID) do {
    case (4160): {
        _title = "<t size='1.1' shadow='0' align='center' valign='middle' underline='true'>Offence</t> <br /><br />";
        _text = parseText format["<t underline='false' align='center'  > %1 </t><br />",_currentCrime select 1];
    };
    case (4161): {
        _title = "<t size='1.1' shadow='0' align='center' valign='middle' underline='true'>Prohibited Items</t> <br /><br />";
         _text = parseText format["<t size='1.1' shadow='0' align='center' valign='middle'>No Prohibited Items Found On Person</t>"];
        if (typename _history == 'ARRAY' && (count _history) > 0) then{
            _items = _history select 4;
            if (typename _items == 'ARRAY' && (count _items) > 0)then{
                _itemsList = [];
                {   
                    _itemsList pushBack (format["<t underline='false' size='1.1' shadow='0' align='center' valign='middle'> %1  :  %2<br /></t>",_x select 0,_x select 1]);
                }forEach _items;
                _itemsList pushBack "<br />";
                _text = parseText (_itemsList joinString " ");
            };
        };
    };
    case (4162): {
        _title = "<t size='1.1' shadow='0' align='center' valign='middle' underline='true'>Notes</t>";
        _notesList = [];
        {
            _notes = _history select 5;
            _author = _history select 7;
            _date = (_history select 8) call ExileLifeClient_util_time_dbTimetoString;
            _wanted = _history select 2;
            _armed = _history select 3;
            _wantedText = "";
            _armedText = "";
            if(_wanted == 1)then{
                _wantedText = "| Wanted ";
            };
            if(_armed == 1)then{
                _armedText = "| Armed";
            };
            _text = format["<t underline='false' align='center'> %1 <br />%2 - %3 %4%5 </t><br /><br />",_notes, _date, _author, _wantedText,_armedText];
            _notesList pushBack _text;
        }forEach _historyList;   
        reverse _notesList; 
        _text = parseText (_notesList joinString " ");
    };
    case (4163): {
        _title = "<t size='1.1' shadow='0' underline='true' align='center' valign='middle'>Fine</t>";
        _text = parseText format["<t size='1.1' shadow='0' align='center' valign='middle'>No Fine Issued</t>"];
        if !(_fine isEqualTo [])then{
            _fineStatus = _fine select 0;
            _fineAmount = _fine select 1;
            _dateIssued = _fine select 2;
            _secondsUntilDue = _fine select 3;
            _datePaid = _fine select 4;
            _jailSentence = _fine select 5;
            switch (_fineStatus) do {
                case 5: {
                    _text = parseText format["<t size='1.1' shadow='0' align='center' color='#a0df3b' valign='middle'>Fine Paid %1</t>",_datePaid];
                };
                case 2: {
                    _oreAmount = _jailSentence select 0;
                    _prisonTime = _jailSentence select 1;
                    _time = [_prisonTime,[0,0],0] call ExileLifeClient_util_array_insert;
                    _length = _time call ExileLifeClient_util_time_timetoString;
                    _title = "<t size='1.1' shadow='0' underline='true' align='center' color='#e14141' valign='middle'>Unpaid Fine</t>";
                    _text = parseText (format[
                            "<t size='1.1' shadow='0' underline='false' align='center' valign='middle'>Labor Mine<br /><br /></t><t underline='false' align='center'>%1 Ore<br />%2</t><br />",
                            _oreAmount, 
                            _length
                        ]
                    );   
                };
                case 4: {
                    _oreAmount = _jailSentence select 0;
                    _prisonTime = _jailSentence select 1;
                    _time = [_prisonTime,[0,0],0] call ExileLifeClient_util_array_insert;
                    _length = _time call ExileLifeClient_util_time_timetoString;
                    _title = "<t size='1.1' shadow='0' underline='true' align='center' color='#e14141' valign='middle'>Warrant For Immediate Arrest</t>";
                    _text = parseText (format[
                            "<t underline='false' align='center'>Labor Mine<br /><br /></t><t underline='false' align='center'>%1 Ore<br />%2</t><br />",
                            _oreAmount, 
                            _length
                        ]
                    );   
                };
                case 0: {
                    _endSeconds = _secondsUntilDue - serverTime + ExileLifeTimeDifference;
                    _days = floor(_endSeconds / 60 / 60 / 24);
                    _hours = floor((_endSeconds / 60 / 60) % 24);
                    _minutes = floor((_endSeconds / 60) % 60);
                    if !((_days + _hours + _minutes) > 0) exitWith{
                        _history = _historyList select 0;
                        _history set [0, _fine];
                        (ExileLifeCriminalRecordsList select ExileLifeCurrentCrimeIndex) set [2, _history];
                        4163 call ExileLifeClient_gui_xm8_slide_criminalHistory_event_showCrimeStats;
                    };
                    _time = format["<t>Due %1 days, %2 hours, %3 minutes</t>",_days,_hours,_minutes];
                    _title = "<t size='1.1' shadow='0' underline='true' align='center' valign='middle'>Fine</t>";
                    _text = parseText(
                        format[
                            "<t underline='false' align='center'>%1 Poptabs<br />%2</t><br />",
                            _fineAmount, 
                            _time
                        ]
                    );
                };
                case 1: {
                    _text = parseText format["<t size='1.1' shadow='0' align='center' valign='middle'>No Fine Issued</t>"];
                };
                case 6: {
                    _text = parseText format["<t size='1.1' shadow='0' align='center' valign='middle'>Fine Cancelled</t>"];
                };
                default {};
            };
        };
    };
    default {_text = parseText format["<t size='1.5' shadow='0' align='center'  valign='middle'>No Recent Criminal Records</t>"];};
};
_titlebar ctrlSetStructuredText (parseText _title);
_listbox ctrlSetStructuredText _text;
if (!(_currentCrime isEqualTo []) && !(_fine isEqualTo []) && !(_history isEqualTo []))then{
    _infractionDate = (_history select 8) call ExileLifeClient_util_time_dbTimetoString;
    _issuedBy = _history select 7;
};
if (isNil '_infractionDate')then{
    (_display displayCtrl 4175) ctrlShow false;
    (_display displayCtrl 4165) ctrlShow false;
}else{
    (_display displayCtrl 4175) ctrlShow true;
    (_display displayCtrl 4165) ctrlShow true;
    (_display displayCtrl 4165) ctrlSetText format["%1",_infractionDate];
};
if (isNil '_issuedBy')then{
    (_display displayCtrl 4174) ctrlShow false;
    (_display displayCtrl 4164) ctrlShow false;
}else{
    (_display displayCtrl 4174) ctrlShow true;
    (_display displayCtrl 4164) ctrlShow true;
    (_display displayCtrl 4164) ctrlSetText format["%1",_issuedBy];
};
