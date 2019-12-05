/**
                    * ExilelifeClient_gui_characterInfo_event_enableButton
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_ageDropdown","_reasonDropdown","_reasonEdit","_confirmButton","_fnameEdit","_lnameEdit"];
disableSerialization;
_display = findDisplay 23500;
if (isNull _display) exitWith {};
_ageDropdown = _display displayCtrl 23512;
_reasonDropdown = _display displayCtrl 23514;
_reasonEdit = _display displayCtrl 23515;
_confirmButton = _display displayCtrl 23516;
_fnameEdit = _display displayCtrl 23508;
_lnameEdit = _display displayCtrl 23510;
if
(
    (       
    	!((lbCursel _ageDropdown) isEqualTo -1)
    	&&
    	!((lbCursel _reasonDropdown) isEqualTo -1)
    	&&
    	!((ctrlText _fnameEdit) isEqualTo "")
    	&&
    	!((ctrlText _lnameEdit) isEqualTo "")
    )||(    
        !((lbCursel _ageDropdown) isEqualTo -1)
        &&
        !((ctrlText _reasonEdit) isEqualTo "")
        &&
        !((ctrlText _fnameEdit) isEqualTo "")
        &&
        !((ctrlText _lnameEdit) isEqualTo "")
    )
)
then
{
	_confirmButton ctrlEnable true;
}
else
{
	_confirmButton ctrlEnable false;
};
true
