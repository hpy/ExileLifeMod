/**
                    * ExilelifeServer_system_jobs_util_vehicle_network_setPinCodeResponse
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

                    private["_sessionID","_parameters","_vehicleNetID","_pincode","_playerObject","_jobClassname","_vehicleJobNetID","_vehicle","_pinCode","_result"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleNetID = _parameters select 0;
_pincode = _parameters select 1;
try{
    if( _pincode isEqualTo "") then {
        throw "No Pincode Entered";
    };
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _playerObject) then {
        throw "You don't Exist...";
    };
    if(_jobClassname == "") then {
        throw "You don't have a job...";
    };
    _vehicleJobNetID = _playerObject getVariable ["ExileLifeJobVehicle",""];
    if (_vehicleJobNetID == "") then {
        throw "You don't have a job vehicle..";
    };
    if(_vehicleNetID != _vehicleJobNetID)then{
        throw "This is not your vehicle!";
    };
    _vehicle = objectFromNetId _vehicleNetID;
    if ((isNull _vehicle) || !(alive _vehicle)) then {
        throw "Your vehicle is destroyed!";
    };
    if (_playerObject distance _vehicle > 15) then {
        throw "Your vehicle is too far away!";
    };
    _vehicle setVariable ["ExileAccessCode", _pinCode];
	[_sessionID, "setPinResponse", [["SuccessTitleOnly", ["PIN changed successfully!"]], netId _vehicle, _pinCode]] call ExileServer_system_network_send_to;
}
catch
{
    _result = _exception;
};
