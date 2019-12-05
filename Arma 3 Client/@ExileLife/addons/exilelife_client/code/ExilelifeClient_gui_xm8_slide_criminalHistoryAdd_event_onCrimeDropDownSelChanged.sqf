/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistoryAdd_event_onCrimeDropDownSelChanged
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_punishments","_display","_dropDownCtrl","_fineCtrl","_jailCtrl","_selectedOffence","_crime","_fine","_prison","_fineAmount","_fineTime","_prisonAmount","_prisonTime","_fineText","_jailText"];
disableSerialization;
_punishments = getArray(missionConfigFile >> "CfgLaws" >> "offences");
if !(isClass(missionConfigFile >> "CfgLaws"))exitWith{};
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_dropDownCtrl = _display displayCtrl 5227;
_fineCtrl = _display displayCtrl 5230;
_jailCtrl = _display displayCtrl 5231;
_selectedOffence = _punishments select (lbCurSel _dropDownCtrl);
_crime = _selectedOffence select 0;
_fine = _selectedOffence select 1;
_prison = _selectedOffence select 2;
_fineAmount = _fine select 0;
_fineTime = _fine select 1;
_prisonAmount = _prison select 0;
_prisonTime = _prison select 1;
ExileLifeInfraction set [0, _crime];
ExileLifeInfraction set [5, [_fineAmount,_fineTime]];
ExileLifeInfraction set [6, [_prisonAmount,_prisonTime]];
_fineCtrl ctrlSetText "";
_jailCtrl ctrlSetText "";
if (_fineAmount == 0)then{
	if (_prisonAmount == 0)then{
		_fineText = parseText "<br/><t align='center'>No Fine To Be Issued</t>";
	}else{
		_fineText = parseText "<br/><t color='#ea0000' align='center'>Issue Arrest Warrant</t>";
		_jailText = parseText (
			format[
				"<t underline='true' align='center'>Sentence</t><br/><t underline='false' align='left'>Mine: %1 Ore</t><br/><t>Length: %2 Days, %3 Hrs, %4 Mins</t>",
				_prisonAmount, 
				_prisonTime select 0, 
				_prisonTime select 1, 
				_prisonTime select 2
			]
		);
		_jailCtrl ctrlSetStructuredText _jailText;
	};
	_fineCtrl ctrlSetStructuredText _fineText;
}else{
	_fineText = parseText(
		format[
			"<t underline='true' align='center'>Fine</t><br/><t underline='false' align='left'>Amount: %1</t><br/><t>Due: %2 Days, %3 Hrs, %4 Mins</t>",
			_fineAmount, 
			_fineTime select 0, 
			_fineTime select 1, 
			_fineTime select 2
		]
	);
	_fineCtrl ctrlSetStructuredText _fineText;
	if !(_prisonAmount == 0)then{
		_jailText = parseText (
			format[
				"<t underline='true' align='center'>Failure to Pay</t><br/><t underline='false' align='left'>Mine: %1 Ore</t><br/><t>Length: %2 Days, %3 Hrs, %4 Mins</t>",
				_prisonAmount, 
				_prisonTime select 0, 
				_prisonTime select 1, 
				_prisonTime select 2
			]
		);
		_jailCtrl ctrlSetStructuredText _jailText;
	};
};
