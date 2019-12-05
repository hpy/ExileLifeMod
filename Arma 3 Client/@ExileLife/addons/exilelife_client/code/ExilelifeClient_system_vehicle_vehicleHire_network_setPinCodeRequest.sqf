/**
                    * ExilelifeClient_system_vehicle_vehicleHire_network_setPinCodeRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_vehicleID","_pincode","_pincode2","_vehicle"];
_this spawn {
    _vehicleID = _this select 0;
    _pincode = -1;
    _pincode2 = -2;
    _vehicle = objectFromNetId _vehicleID;
    if (isNull _vehicle) exitWith{};
    while {_pincode != _pincode2} do {
        ["InfoTitleAndText", ["Step 1 of 2", "Please enter a vehicle PIN."]] call ExileClient_gui_toaster_addTemplateToast;
        ExileClientInteractionObject = _vehicle;
        _pincode = 4 call ExileClient_gui_keypadDialog_show;
        if(_pincode isEqualTo "")exitWith{
                ["ErrorTitleAndText", ["No PIN Entered", "This Vehicle cannot be locked!"]] call ExileClient_gui_toaster_addTemplateToast;
        };
        ["InfoTitleAndText", ["Step 2 of 2", "Please reenter PIN."]] call ExileClient_gui_toaster_addTemplateToast;
        ExileClientInteractionObject = _vehicle;
        _pincode2 = 4 call ExileClient_gui_keypadDialog_show;
        if(_pincode2 isEqualTo "")exitWith{
                ["ErrorTitleAndText", ["No PIN Entered", "This Vehicle cannot be locked!"]] call ExileClient_gui_toaster_addTemplateToast;
        };
        if(_pincode2 != _pincode)then{
            ["ErrorTitleAndText", ["Invalid Pin", "Your PIN did not match!"]] call ExileClient_gui_toaster_addTemplateToast;
        };
    };
    ["setPinCodeResponse",[_vehicleID,_pincode]] call ExileClient_system_network_send;
}
